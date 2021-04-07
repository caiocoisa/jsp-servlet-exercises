package src.com.model.classes;

public class Prefeito extends Candidato{
	
	private String vicePrefeito;

	public String getVicePrefeito() {
		return vicePrefeito;
	}

	public void setVicePrefeito(String vicePrefeito) {
		this.vicePrefeito = vicePrefeito;
	}

	public Prefeito(String nome, String numero, String partido, String vicePrefeito) {
		super(nome, numero, partido);
		this.vicePrefeito = vicePrefeito;
	}

}
