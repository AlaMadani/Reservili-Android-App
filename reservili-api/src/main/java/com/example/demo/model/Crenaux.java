package com.example.demo.model;

import java.time.LocalDate;

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
public class Crenaux {
	private Long id;
	private LocalDate datecrn;
	private String nomlieu;
	private String adrss;
	private String ville;
	private int capact;
	private String suppr;
	private float prixbalcon;
	private float prixorchestre;
	private float prixgalerie;
	private int reservedQty;
	

}
