package src.com.model.controller;

import java.util.ArrayList;
import java.util.HashMap;

import src.com.model.classes.Candidato;
import src.com.model.classes.Prefeito;
import src.com.model.classes.Vereador;
import src.com.model.exceptions.CandidatoInvalidoException;

public class Urna {
	
	EleicaoDB eleicao;
	private HashMap<String, Integer> votosPrefeito;
	private HashMap<String, Integer> votosVereador;
	private int votosEmBrancoPrefeito;
	private int votosEmBrancoVereador;
	
	public Urna() { //Regra
		
		this.eleicao = new EleicaoDB();
		this.votosPrefeito = new HashMap();
		this.votosVereador = new HashMap();
		
		//Zero voto
		for ( Prefeito prefeito : eleicao.getCandidatosPrefeito() ) {
			this.votosPrefeito.put( prefeito.getNumero(), Integer.valueOf(0) );
		}
		
		for ( Vereador vereador : eleicao.getCandidatosVereador() ) {
			this.votosVereador.put( vereador.getNumero(), Integer.valueOf(0) );
		}
		
		this.votosEmBrancoPrefeito = 0;
		this.votosEmBrancoVereador = 0;
	}
	
	public void inserirVotoVereador(String numero) throws CandidatoInvalidoException {
		try {
			if (votosVereador.get(numero) == null) {
				throw new CandidatoInvalidoException("Vereador não encontrado");
			} else {
				int votos = Integer.valueOf( votosVereador.get(numero) );
				votos = votos + 1;
				votosVereador.put( numero, Integer.valueOf(votos) );
			}
		}catch (CandidatoInvalidoException e) {
			e.printStackTrace();
		}
	}
	
	public void inserirVotoPrefeito(String numero) throws CandidatoInvalidoException {
		try {
			if (votosPrefeito.get(numero) == null) {
				throw new CandidatoInvalidoException("Prefeito não encontrado");
			} else {
				int votos = Integer.valueOf( votosPrefeito.get(numero) );
				votos = votos + 1;
				votosPrefeito.put( numero, votos);
			}
		}catch (CandidatoInvalidoException e) {
			e.printStackTrace();
		}
	}
	
	public void inserirVotoPrefeitoEmBranco() {
		this.votosEmBrancoPrefeito++;
	}
	
	public void inserirVotoVereadorEmBranco() {
		this.votosEmBrancoVereador++;
	}
	
	public boolean validarPrefeito(String numero) {
		if ( eleicao.getPrefeitoByNum( numero ) != null) {
			return true;
		}
		return false;
	}
	
	public boolean validarVereador(String numero) {
		if ( eleicao.getVereadorByNum( numero ) != null) {
			return true;
		}
		return false;
	}
	
	public HashMap getBoletimVereadores() {
		return this.votosVereador;
	}
	
	public HashMap getBoletimPrefeitos() {
		return this.votosPrefeito;
	}
	
	public int getVotosBrancoPrefeito() {
		return this.votosEmBrancoPrefeito;
	}
	
	public int getVotosBrancoVereador() {
		return this.votosEmBrancoVereador;
	}
	
	public Candidato getCandidato(String numero) {
		if ( validarPrefeito(numero) ) {
			return eleicao.getPrefeitoByNum(numero);
		}else if ( validarVereador(numero) ) {
			return eleicao.getVereadorByNum(numero);
		}
		return null;
	}
	
	public void getVotosByPartido(String numero) {
		
	}
	public void getVotosByCandidato() {
		
	}
	public void getVotosBranco() {
		
	}

}
