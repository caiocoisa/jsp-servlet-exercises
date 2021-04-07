package src.com.model.controller;

import java.util.ArrayList;
import java.util.HashMap;

import src.com.model.classes.Candidato;
import src.com.model.classes.Vereador;
import src.com.model.exceptions.CandidatoInvalidoException;

public class Teste {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Urna urna = new Urna();
		
		try {
			urna.inserirVotoVereador("80888");
			urna.inserirVotoVereador("91999");
			urna.inserirVotoVereador("80888");
		}catch (CandidatoInvalidoException e) {
			System.out.println(e.getMessage());
		}
		
		try {
			urna.inserirVotoPrefeito("90");
			urna.inserirVotoPrefeito("91");
			urna.inserirVotoPrefeito("92");
			urna.inserirVotoPrefeito("92");
		}catch (CandidatoInvalidoException e) {
			System.out.println(e.getMessage());
		}
				
		System.out.println( urna.getBoletimVereadores().toString() );
		
		System.out.println( urna.getBoletimPrefeitos().toString() );
		
		HashMap<Candidato, Integer> v = urna.getBoletimPrefeitos();
		
		for (Object candidato : v.keySet().toArray()) {
			System.out.println(candidato.toString());
		}
		
		
		
		
		
	}

}
