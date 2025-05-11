package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.LoginResponse;
import com.example.demo.model.SignupRequest;
import com.example.demo.repository.AuthRepository;

@Service
public class AuthService {

	 @Autowired
	    private AuthRepository authRepository;

	    public LoginResponse login(String email, String password) {
	        return authRepository.verifyUser(email, password);
	    }
	    
	    
	    public int signup(SignupRequest req) {
	        // ici on délègue tout au repo
	        return authRepository.createOrUpdateUser(req);
	    }
}
