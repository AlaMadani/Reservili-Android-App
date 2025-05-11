package com.example.demo.service;

import com.example.demo.model.Spectacle;
import com.example.demo.model.SpectacleDetails;
import com.example.demo.repository.SpectacleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SpectacleService {

    @Autowired
    private SpectacleRepository spectacleRepository;

    // Retrieve spectacles with optional filters
    public List<Spectacle> findSpectacles(String titre, String date, String heure, String lieu, String ville) {
        // Call repository method to run stored procedure or SQL query with filters.
        return spectacleRepository.findSpectacles();
    }
    public List<Spectacle> searchSpectacles(String titre, String lieu, String ville,String dateS,String h_debut) {
        return spectacleRepository.findSpectaclesByParams(titre, lieu, ville, dateS, h_debut);
    }

    // Retrieve a spectacle by its ID
    public SpectacleDetails getSpectacleById(Long id) {
        return spectacleRepository.findSpectacleById(id);
    }

    // Reserve a spectacle (example method)
    public boolean reserveSpectacle(Long id, Object reservationRequest) {
        // Call repository method to check availability and reserve ticket(s)
        // This is a placeholder implementation.
        return spectacleRepository.reserveSpectacle(id, reservationRequest);
    }
}