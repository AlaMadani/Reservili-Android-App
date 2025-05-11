package com.example.demo.repository;

import com.example.demo.model.EmailAlreadyExistsException;
import com.example.demo.model.LoginResponse;
import com.example.demo.model.SignupRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AuthRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    /**
     * Vérifie les identifiants, et renvoie les infos utilisateur si OK,
     * ou null si pas trouvé / mot de passe incorrect.
     */
    public LoginResponse verifyUser(String email, String password) {
        String sql = 
            "SELECT idClt, NomClt, PrenomClt, tel, email " +
            "FROM Client WHERE email = ? AND motP = ?";
        try {
            return jdbcTemplate.queryForObject(
                sql,
                new Object[]{ email, password },
                (rs, rowNum) -> {
                    LoginResponse resp = new LoginResponse();
                    resp.setClientId(   rs.getInt("idClt") );
                    resp.setLastName(   rs.getString("NomClt") );
                    resp.setFirstName(  rs.getString("PrenomClt") );
                    resp.setPhone(      rs.getString("tel") );
                    resp.setEmail(      rs.getString("email") );
                    return resp;
                }
            );
        } catch (EmptyResultDataAccessException ex) {
            // Aucun user ne correspond → retourne null
            return null;
        }
    }
    
    
    
    
    
    
    
    public Integer findClientIdByEmail(String email) {
        try {
            return jdbcTemplate.queryForObject(
                "SELECT idClt FROM Client WHERE email = ?",
                Integer.class, email
            );
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    /** Recherche le mot de passe stocké, ou null si pas trouvé */
    public String findPasswordByEmail(String email) {
        try {
            return jdbcTemplate.queryForObject(
                "SELECT motP FROM Client WHERE email = ?",
                String.class, email
            );
        } catch (EmptyResultDataAccessException ex) {
            return null;
        }
    }

    /**
     * Crée ou met à jour l’utilisateur selon l’email.
     * @return idClt du client.
     * @throws EmailAlreadyExistsException si compte déjà créé avec motP != "0".
     */
    public int createOrUpdateUser(SignupRequest req) {
        String email = req.getEmail();
        Integer existingId = findClientIdByEmail(email);
        if (existingId != null) {
            String currentPwd = findPasswordByEmail(email);
            if (currentPwd != null && !currentPwd.equals("0")) {
                // le compte existe déjà avec mot de passe valide
                throw new EmailAlreadyExistsException(
                   "Un compte existe déjà pour cet email"
                );
            }
            // compte existe mais motP == "0" → on met à jour uniquement le mot de passe
            jdbcTemplate.update(
                "UPDATE Client SET motP = ?, NomClt = ?, PrenomClt = ?, tel = ? WHERE idClt = ?",
                req.getPassword(),
                req.getNom(),
                req.getPrenom(),
                req.getTel(),
                existingId
            );
            return existingId;
        } else {
            // nouveau client
            int newId = jdbcTemplate.queryForObject(
                "SELECT SEQ_joker.NEXTVAL FROM dual",
                Integer.class
            );
            jdbcTemplate.update(
                "INSERT INTO Client (idClt, NomClt, PrenomClt, email, tel, motP) VALUES (?, ?, ?, ?, ?, ?)",
                newId,
                req.getNom(),
                req.getPrenom(),
                req.getEmail(),
                req.getTel(),
                req.getPassword()
            );
            return newId;
        }
    }
}
