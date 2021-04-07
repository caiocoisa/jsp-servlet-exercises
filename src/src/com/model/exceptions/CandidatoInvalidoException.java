package src.com.model.exceptions;

public class CandidatoInvalidoException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String msg;
	
	public CandidatoInvalidoException(String msg) {
		super(msg);
		this.msg = msg;
	}
	
	public String getMessage() {
		return msg;
	}
	

}
