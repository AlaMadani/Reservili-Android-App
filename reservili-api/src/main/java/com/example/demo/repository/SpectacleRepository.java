package com.example.demo.repository;

import com.example.demo.model.Crenaux;
import com.example.demo.model.Rubrique;
import com.example.demo.model.Spectacle;
import com.example.demo.model.SpectacleDetails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Repository
public class SpectacleRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    // Example method to find spectacles with filters
    public List<Spectacle> findSpectacles() {
    	String sql =
    		    "SELECT S.idSpec,                                             " +
    		    "       S.Titre,                                              " +
    		    "       DL.dateLieu   AS dateS,                               " +
    		    "       S.imageUrl,                                           " +
    		    "       S.annulee,                                           " +
    		    "       S.h_debut,                                           " +
    		    "       L.NomLieu,                                           " +
    		    "       L.ville,                                             " +
    		    "       S.nbrSpectateur,                                     " +
    		    "       L.capacite                                           " +
    		    "  FROM SPECTACLE S                                          " +
    		    "  /* sous‐requête pour récupérer la date min par spectacle */" +
    		    "  JOIN (                                                     " +
    		    "    SELECT idSpec,                                          " +
    		    "           MIN(dateLieu) AS minDate                         " +
    		    "      FROM DATE_LIEU                                        " +
    		    "     WHERE dateLieu > SYSDATE                              " +
    		    "     GROUP BY idSpec                                       " +
    		    "  ) MD ON S.idSpec = MD.idSpec                              " +
    		    "  /* on recolle pour avoir aussi l’idLieu de ce créneau */  " +
    		    "  JOIN DATE_LIEU DL                                         " +
    		    "    ON DL.idSpec = MD.idSpec                                " +
    		    "   AND DL.dateLieu = MD.minDate                             " +
    		    "  /* enfin le lieu correspondant */                        " +
    		    "  JOIN LIEU L ON DL.idLieu = L.idLieu";


        return jdbcTemplate.query(sql, new RowMapper<Spectacle>() {
            @Override
            public Spectacle mapRow(ResultSet rs, int rowNum) throws SQLException {
                Spectacle spectacle = new Spectacle();
                spectacle.setIdSpec(rs.getInt("idSpec"));
                spectacle.setTitre(rs.getString("Titre"));
                spectacle.setDateS(rs.getDate("dateS").toLocalDate());
                spectacle.setImageUrl(rs.getString("imageUrl"));
                spectacle.setAnnulee(rs.getString("annulee"));
                spectacle.setH_debut(rs.getString("h_debut"));
                spectacle.setNomLieu(rs.getString("NomLieu"));
                spectacle.setVille(rs.getString("ville"));
                spectacle.setNbrSpect(rs.getInt("nbrSpectateur"));
                spectacle.setCapacite(rs.getInt("capacite"));
                return spectacle;
            }
        });
    }
    public List<Spectacle> findSpectaclesByParams(String titre, String lieu, String ville,String dateS,String h_debut) {
    	StringBuilder sql = new StringBuilder();
        sql.append( "SELECT idSpec,Titre,dateS,imageUrl,annulee,h_debut,NomLieu,ville,  nbrSpectateur,capacite");
        sql.append(" FROM SPECTACLE S,LIEU L");
        sql.append(" WHERE S.idLieu=L.idLieu");

        Map<String, Object> params = new HashMap<>();

        if (titre != null && !titre.trim().isEmpty()) {
            sql.append(" AND LOWER(S.titre) LIKE LOWER(:titre) ");
            params.put("titre", "%" + titre.trim() + "%");
        }
        if (lieu != null && !lieu.trim().isEmpty()) {
            sql.append(" AND LOWER(L.NomLieu) LIKE LOWER(:lieu) ");
            params.put("lieu", "%" + lieu.trim() + "%");
        }
        if (ville != null && !ville.trim().isEmpty()) {
            sql.append(" AND LOWER(L.ville) LIKE LOWER(:ville) ");
            params.put("ville", "%" + ville.trim() + "%");
        }
        if (dateS != null && !dateS.trim().isEmpty()) {
            sql.append(" AND TO_CHAR(s.dateS, 'DD-MM-YYYY') LIKE :dateS ");
            params.put("dateS", "%" + dateS.trim() + "%");
        }


        if (h_debut != null && !h_debut.trim().isEmpty()) {
            sql.append(" AND TO_CHAR(h_debut) LIKE :h_debut ");
            params.put("h_debut", "%" + h_debut.trim() + "%");
        }

        return namedParameterJdbcTemplate.query(sql.toString(), params, new RowMapper<Spectacle>() {
            @Override
            public Spectacle mapRow(ResultSet rs, int rowNum) throws SQLException {
                Spectacle summary = new Spectacle();
                summary.setIdSpec(rs.getInt("idSpec"));
                summary.setTitre(rs.getString("titre"));
                summary.setDateS(rs.getDate("dateS").toLocalDate()); // Adapté selon le type dans votre modèle
                summary.setImageUrl(rs.getString("imageUrl"));
                summary.setAnnulee(rs.getString("annulee"));
                summary.setH_debut(rs.getString("h_debut")); // ou convertir si nécessaire
                summary.setNomLieu(rs.getString("nomLieu"));
                summary.setVille(rs.getString("ville"));
                summary.setNbrSpect(rs.getInt("nbrSpectateur"));
                summary.setCapacite(rs.getInt("capacite"));
                return summary;
            }
        });

    }

    // Retrieve a spectacle by ID
    public SpectacleDetails findSpectacleById(Long id) {
    	
    	String rubriqueSql = "SELECT H_debutR, dureeRub, typeR, NomArt, PrenomArt " +
    	                     "FROM RUBRIQUE R, ARTISTE A " +
    	                     "WHERE R.idArt = A.idArt AND R.idSpec = ?";
    	List<Rubrique> rubriques = jdbcTemplate.query(rubriqueSql, new Object[]{id}, new RowMapper<Rubrique>() {
    	    @Override
    	    public Rubrique mapRow(ResultSet rs, int rowNum) throws SQLException {
    	        Rubrique rubrique = new Rubrique();
    	        rubrique.setH_debutR(rs.getString("H_debutR"));
    	        rubrique.setDureeR(rs.getString("dureeRub"));
    	        rubrique.setTypeR(rs.getString("typeR"));
    	        rubrique.setNomart(rs.getString("NomArt"));
    	        rubrique.setPnomart(rs.getString("PrenomArt"));
    	        return rubrique;
    	    }
    	});
    	
    	
    	String crenauxSql =
    		    "SELECT DL.idDateLieu, "
    		  + "       DL.dateLieu, "
    		  + "       DL.prixBalcon, "
    		  + "       DL.prixOrchestre, "
    		  + "       DL.prixGalerie, "
    		  + "       L.NomLieu, "
    		  + "       L.Adresse, "
    		  + "       L.ville, "
    		  + "       L.capacite, "
    		  + "       L.supprimee, "
    		  + "       NVL((SELECT SUM(R.qte) "
    		  + "            FROM RESERVATION R "
    		  + "           WHERE R.idDateLieu = DL.idDateLieu), 0) AS reservedQty "
    		  + "  FROM DATE_LIEU DL "
    		  + "  JOIN LIEU L ON DL.idLieu = L.idLieu "
    		  + " WHERE DL.idSpec = ? "
    		  + " ORDER BY DL.dateLieu";

    		List<Crenaux> crenaux = jdbcTemplate.query(
    		    crenauxSql,
    		    new Object[]{ id },
    		    (rs, rowNum) -> {
    		        Crenaux c = new Crenaux();
    		        c.setId(rs.getLong("idDateLieu"));
    		        c.setDatecrn(rs.getDate("dateLieu").toLocalDate());
    		        c.setNomlieu(rs.getString("NomLieu"));
    		        c.setVille(rs.getString("ville"));
    		        c.setAdrss(rs.getString("Adresse"));
    		        c.setCapact(rs.getInt("capacite"));
    		        c.setSuppr(rs.getString("supprimee"));
    		        c.setPrixbalcon(rs.getFloat("prixBalcon"));
    		        c.setPrixorchestre(rs.getFloat("prixOrchestre"));
    		        c.setPrixgalerie(rs.getFloat("prixGalerie"));
    		        c.setReservedQty(rs.getInt("reservedQty"));  // <— nouveau champ
    		        return c;
    		    }
    		);


    	// Now retrieve the spectacle details using queryForObject for a single result
    	String spectacleSql = "SELECT description, dureeS, Adresse " +
    	                      "FROM SPECTACLE S, LIEU L " +
    	                      "WHERE S.idLieu = L.idLieu AND S.idSpec = ?";

    	SpectacleDetails spectacle = jdbcTemplate.queryForObject(spectacleSql, new Object[]{id}, new RowMapper<SpectacleDetails>() {
    	    @Override
    	    public SpectacleDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
    	        SpectacleDetails spectacle = new SpectacleDetails();
    	        spectacle.setDescription(rs.getString("description"));
    	        spectacle.setAdresseLieu(rs.getString("Adresse"));
    	        spectacle.setDureeS(rs.getString("dureeS"));
    	        spectacle.setRubriques(rubriques);
    	        spectacle.setCrenaux(crenaux);
    	        return spectacle;
    	    }
    	});

    	return spectacle;

        
    }

    // Reserve a spectacle (this is a placeholder that would call a stored procedure)
    public boolean reserveSpectacle(Long id, Object reservationRequest) {
        // Example: call stored procedure here using jdbcTemplate.call(...);
        // For now, we'll return true to simulate a reservation.
        return true;
    }

    // Define a RowMapper to map rows of the ResultSet to a Spectacle object
    private static class SpectacleRowMapper implements RowMapper<Spectacle> {
        @Override
        public Spectacle mapRow(ResultSet rs, int rowNum) throws SQLException {
            // Map the result set columns to your Spectacle object
            Spectacle spectacle = new Spectacle(
                rs.getInt("idSpec"),
                rs.getString("Titre"),  // You may need to format the date
                rs.getDate("dateS").toLocalDate(),
                rs.getString("imageUrl"),
                rs.getString("annulee"),
                rs.getString("h_debut"),
                rs.getString("NomLieu"),
                rs.getString("ville"),
                rs.getInt("nbrSpectateur"),
                rs.getInt("capacite")
                
                
             
                
            );
            return spectacle;
        }
    }
    
    
    
    
    
    public Crenaux getCrenaux(int ids,int idc) {
    	
    	String crenauxSql =
    		    "SELECT DL.idDateLieu, "
    		  + "       DL.dateLieu, "
    		  + "       DL.prixBalcon, "
    		  + "       DL.prixOrchestre, "
    		  + "       DL.prixGalerie, "
    		  + "       L.NomLieu, "
    		  + "       L.Adresse, "
    		  + "       L.ville, "
    		  + "       L.capacite, "
    		  + "       L.supprimee, "
    		  + "       NVL((SELECT SUM(R.qte) "
    		  + "            FROM RESERVATION R "
    		  + "           WHERE R.idDateLieu = DL.idDateLieu), 0) AS reservedQty "
    		  + "  FROM DATE_LIEU DL "
    		  + "  JOIN LIEU L ON DL.idLieu = L.idLieu "
    		  + " WHERE DL.idSpec = ? AND DL.IDDATELIEU = ?"
    		  + " ORDER BY DL.dateLieu";

    		List<Crenaux> crenaux = jdbcTemplate.query(
    		    crenauxSql,
    		    new Object[]{ ids,idc },
    		    (rs, rowNum) -> {
    		        Crenaux c = new Crenaux();
    		        c.setId(rs.getLong("idDateLieu"));
    		        c.setDatecrn(rs.getDate("dateLieu").toLocalDate());
    		        c.setNomlieu(rs.getString("NomLieu"));
    		        c.setVille(rs.getString("ville"));
    		        c.setAdrss(rs.getString("Adresse"));
    		        c.setCapact(rs.getInt("capacite"));
    		        c.setSuppr(rs.getString("supprimee"));
    		        c.setPrixbalcon(rs.getFloat("prixBalcon"));
    		        c.setPrixorchestre(rs.getFloat("prixOrchestre"));
    		        c.setPrixgalerie(rs.getFloat("prixGalerie"));
    		        c.setReservedQty(rs.getInt("reservedQty"));  // <— nouveau champ
    		        return c;
    		    }
    		);
    		return crenaux.get(0);
    }
    
    
    
    
    
    
    
    
    
   

}
