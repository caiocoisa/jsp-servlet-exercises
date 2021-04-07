package src.com.model.classes;

public class Candidato {
	
	private String nome;
	private String numero;
	private String partido;
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public Candidato(String nome, String numero, String partido) {
		super();
		this.nome = nome;
		this.numero = numero;
		this.partido = partido;
	}
}
