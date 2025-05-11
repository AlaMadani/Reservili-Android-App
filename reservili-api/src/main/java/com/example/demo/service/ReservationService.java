package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Crenaux;
import com.example.demo.model.ReservationRequest;
import com.example.demo.model.Spectacle;
import com.example.demo.repository.ReservationRepository;
import com.example.demo.repository.SpectacleRepository;

import jakarta.transaction.Transactional;

@Service
public class ReservationService {
	  @Autowired
	    private ReservationRepository reservationRepository;
	  @Autowired
	    private SpectacleRepository spectacleRepo;
	  @Autowired
	    private EmailService emailService;

	    @Transactional
	    public void createReservation(ReservationRequest request) {
	        reservationRepository.createReservation(request);
	        
	        
	        Spectacle spec = spectacleRepo.findSpectacles().stream().filter(s->s.getIdSpec()==request.getIdSpec()).toList().get(0);
	        // Et envoyez le mail
	        emailService.sendReservationConfirmation(
	            // adresse du client récupérée soit du request, soit d'une table client
	           request.getEmail(),
	            request,
	            spec
	        );
	    }
	    
	    
	    
	    public List<Crenaux> findByClientId(int clientId) {
	        return reservationRepository.findByClientId(clientId);
	    }
	
}

