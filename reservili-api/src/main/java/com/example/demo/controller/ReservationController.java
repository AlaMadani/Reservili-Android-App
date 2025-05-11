package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.model.Crenaux;
import com.example.demo.model.ReservationRequest;
import com.example.demo.service.ReservationService;

@RestController
@RequestMapping("/reservations")
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @PostMapping
    public ResponseEntity<Map<String, Object>> createReservation(@RequestBody ReservationRequest request) {
    	 Map<String, Object> response = new HashMap<>();
    	    try {
    	        reservationService.createReservation(request);
    	        response.put("success", true);
    	        response.put("message", "Réservation réussie");
    	        return ResponseEntity.ok(response);
    	    } catch (Exception e) {
    	        response.put("success", false);
    	        response.put("message", "Erreur: " + e.getMessage());
    	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
    	    }
    }
    
    
    
    @GetMapping("/{clientId}")
    public List<Crenaux> getByClient(@PathVariable int clientId) {
        return reservationService.findByClientId(clientId);
    }
}