package src.com.model.controller;

import java.util.ArrayList;

import src.com.model.classes.Prefeito;
import src.com.model.classes.Vereador;

public class EleicaoDB {
	
	ArrayList<Prefeito> candidatosPrefeito = new ArrayList();
	ArrayList<Vereador> candidatosVereador = new ArrayList();
	
	public EleicaoDB() {
		
		//Inicializa os candidatos
		//Prefeitos
		this.candidatosPrefeito.add(new Prefeito("Baby do Brasil", "90", 
				"Partido dos Novos Baianos", "Pepeu Gomes"));
		this.candidatosPrefeito.add(new Prefeito("Caetano Veloso", "91", 
				"Partido da Tropicália", "Gal Costa"));
		this.candidatosPrefeito.add(new Prefeito("Alceu Valença", "92", 
				"Partido Armorial", "Elba Ramalho"));
	
		// Vereadores
		this.candidatosVereador.add(new Vereador("Arnaldo Antunes", "80888", "Partido dos Titãs"));
		this.candidatosVereador.add(new Vereador("Nando Reis", "80999", "Partido dos Titãs"));
		this.candidatosVereador.add(new Vereador("Branco Melo", "80777", "Partido dos Titãs"));
		
		this.candidatosVereador.add(new Vereador("Morais Moreira", "90999", "Partido dos Novos Baianos"));
		this.candidatosVereador.add(new Vereador("Paulinho Boca de Cantor", "90888", "Partido dos Novos Baianos"));
		
		this.candidatosVereador.add(new Vereador("Rita Lee", "91999", "Partido da Tropicália"));
		this.candidatosVereador.add(new Vereador("Tom Zé", "91888", "Partido da Tropicália"));
		this.candidatosVereador.add(new Vereador("Nara Leão", "91777", "Partido da Tropicália"));
		
		this.candidatosVereador.add(new Vereador("Geraldo Azevedo", "92999", "Partido Armorial"));
		this.candidatosVereador.add(new Vereador("Lenine", "92888", "Partido Armorial"));
	}

	public ArrayList<Prefeito> getCandidatosPrefeito() {
		return candidatosPrefeito;
	}

	public void setCandidatosPrefeito(ArrayList<Prefeito> candidatosPrefeito) {
		this.candidatosPrefeito = candidatosPrefeito;
	}

	public ArrayList<Vereador> getCandidatosVereador() {
		return candidatosVereador;
	}

	public void setCandidatosVereador(ArrayList<Vereador> candidatosVereador) {
		this.candidatosVereador = candidatosVereador;
	}
	public Vereador getVereadorByNum( String numero ) {
		for (Vereador vereador : candidatosVereador) {
			if ( vereador.getNumero().equals(numero) ) {
				return vereador;
			}
		}
		return null;
	}
	public Prefeito getPrefeitoByNum( String numero ) {
		for (Prefeito prefeito : candidatosPrefeito) {
			if ( prefeito.getNumero().equals(numero) ) {
				return prefeito;
			}
		}
		return null;
	}
	
	public String getPartidoByNum( String number ) {
		for (Vereador vereador : candidatosVereador) {
			if ( vereador.getNumero().substring(0, 2).equals(number) ) {
				return vereador.getPartido();
			}
		}
		return "";
	}
}
