package com.example.demo.model;


import java.time.LocalDate;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class SpectacleDetails {
	private String description;
	private String dureeS;
	private String adresseLieu;
	private List<Rubrique> rubriques;
	private List<Crenaux> crenaux;

}
