package com.example.demo.repository;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.demo.model.Crenaux;
import com.example.demo.model.ReservationRequest;

@Repository
public class ReservationRepository {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * Crée une réservation ; si request.getIdClt()>0 on considère
     * que l'utilisateur est déjà enregistré, sinon on l'insère d'abord.
     */
    public void createReservation(ReservationRequest request) {
        Integer idClt = request.getIdClt();

        // 1) Si pas d'utilisateur connecté, on l'insère en anonyme (motP=NULL)
        if (idClt == null || idClt <= 0) {
            // Génère un nouvel ID pour le client
            idClt = jdbcTemplate.queryForObject(
                "SELECT SEQ_joker.NEXTVAL FROM dual", 
                Integer.class
            );
            // Insère le client avec motP NULL
            String sqlInsertClient = 
                  "INSERT INTO CLIENT (idClt, NomClt, PrenomClt, tel, email, motP) " +
                  "VALUES (?, ?, ?, ?, ?, '0')";
            jdbcTemplate.update(
                sqlInsertClient,
                idClt,
                request.getNomClt(),
                request.getPrenomClt(),
                request.getTel(),
                request.getEmail()
            );
        }

        // 2) On vérifie la capacité résiduelle sur CE créneau (idDateLieu)
        String sqlCap = ""
            + "SELECT l.capacite - NVL(SUM(r.QTE),0) AS places_restantes "
            + "  FROM DATE_LIEU dl "
            + "  JOIN LIEU l ON dl.idLieu = l.idLieu "
            + "  LEFT JOIN RESERVATION r ON r.idDateLieu = dl.idDateLieu "
            + " WHERE dl.idDateLieu = ? "
            + " GROUP BY l.capacite";

        Integer placesRestantes = jdbcTemplate.queryForObject(
            sqlCap, 
            new Object[]{ request.getIdDateLieu() },
            Integer.class
        );
        if (request.getQte() > placesRestantes) {
            throw new RuntimeException(
                "Capacité insuffisante : il ne reste que " 
                + placesRestantes + " places."
            );
        }

        // 3) Insertion de la réservation, avec toutes les colonnes
        String sqlInsertRes = ""
            + "INSERT INTO RESERVATION "
            + "(idRes, idClt, idSpec, categorieTckt, QTE, idDateLieu, paymentMethod, prixpaye) "
            + "VALUES (SEQ_RESERVATION.NEXTVAL, ?, ?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(
            sqlInsertRes,
            idClt,
            request.getIdSpec(),
            request.getCategorieTckt(),
            request.getQte(),
            request.getIdDateLieu(),
            request.getPaymentMethod(),    // "Carte", "Espèces", etc.
            request.getPrixpaye()    // float
        );
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    public List<Crenaux> findByClientId(int clientId) {
        String sql =
            "SELECT dl.idDateLieu, " +
            "       dl.dateLieu, " +
            "       dl.prixBalcon, " +
            "       dl.prixOrchestre, " +
            "       dl.prixGalerie, " +
            "       l.nomLieu, " +
            "       l.adresse, " +
            "       l.ville, " +
            "       l.capacite, " +
            "       l.supprimee, " +
            "       r.qte AS reservedQty " +
            "  FROM RESERVATION r " +
            "  JOIN DATE_LIEU dl ON r.idDateLieu = dl.idDateLieu " +
            "  JOIN LIEU l      ON dl.idLieu      = l.idLieu " +
            " WHERE r.idClt = ? " +
            " ORDER BY dl.dateLieu";

        return jdbcTemplate.query(
            sql,
            new Object[]{ clientId },
            (rs, rowNum) -> {
                Crenaux c = new Crenaux();
                c.setId(rs.getLong("idDateLieu"));
                c.setDatecrn(rs.getDate("dateLieu").toLocalDate());
                c.setPrixbalcon(rs.getFloat("prixBalcon"));
                c.setPrixorchestre(rs.getFloat("prixOrchestre"));
                c.setPrixgalerie(rs.getFloat("prixGalerie"));
                c.setNomlieu(rs.getString("nomLieu"));
                c.setAdrss(rs.getString("adresse"));
                c.setVille(rs.getString("ville"));
                c.setCapact(rs.getInt("capacite"));
                c.setSuppr(rs.getString("supprimee"));
                c.setReservedQty(rs.getInt("reservedQty"));
                return c;
            }
        );
    }
}
