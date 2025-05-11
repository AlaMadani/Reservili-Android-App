package com.example.demo.model;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import java.time.LocalDate;
import java.util.List;
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Spectacle {
	 private int idSpec;
	    private String titre;
	    private LocalDate dateS;
	    private String imageUrl;
	    private String annulee;
	    private String h_debut;
	    private String NomLieu;
	    private String ville;
	    private int nbrSpect;
	    private int capacite;
    
}