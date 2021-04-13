package src.com.model.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.com.model.controller.Urna;
import src.com.model.exceptions.CandidatoInvalidoException;

@WebServlet(urlPatterns = {"/votar"})
public class ServletVoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static int etapa;
	
	public static String nomeEmVotacao;
	public static String partidoEmVotacao;
	public static String numeroEmVotacao;
	public static Urna urna;
	
       
    public ServletVoto() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	urna = new Urna();
    	nomeEmVotacao = "";
    	partidoEmVotacao = "";
    	numeroEmVotacao = "";
    	etapa = 1;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath().toString());

    	request.getRequestDispatcher("telavoto.jsp").forward(request, response);
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	try {

    		System.out.println( numeroEmVotacao );
    		/*
    		 *  Se for detectado o botão "CORRIGE", remove um número e devolve a tela de voto
    		 */
    		if (request.getParameter("corrige") != null) {
    			
    			corrige();
    			request.getRequestDispatcher("telavoto.jsp").forward(request, response);
			/*
    		 *  Se for detectado o botão "BRANCO", inclui voto e avança etapa se for aplicável
    		 */	
    		} else if ( request.getParameter("branco") != null ) {
        		// Voto VEREADOR em BRANCO ---
    			if( etapa == 1) {
    				numeroEmVotacao = "";
    				nomeEmVotacao = "";
    				partidoEmVotacao = "";
    				urna.inserirVotoVereadorEmBranco();
    				etapa = 2;
    				request.getRequestDispatcher("telavoto.jsp").forward(request, response);
    				
				// Voto PREFEITO em BRANCO ---	
    			} else {
    				numeroEmVotacao = "";
    				nomeEmVotacao = "";
    				partidoEmVotacao = "";
    				urna.inserirVotoPrefeitoEmBranco();
    				etapa = 1;
    				request.getRequestDispatcher("telafim.jsp").forward(request, response);
    			}
    			
    			
    			
    		} else if ( request.getParameter("confirmar") != null ) {
    			inserirVoto();
    			numeroEmVotacao = "";
				nomeEmVotacao = "";
				partidoEmVotacao = "";
    			if (etapa == 1) {
    				etapa = 2;
    				request.getRequestDispatcher("telavoto.jsp").forward(request, response);
    			} else {
    				etapa = 1;
    				request.getRequestDispatcher("telafim.jsp").forward(request, response);
    			}
    			
    		} else {
    			// Vereador
	    		if ( etapa == 1) { 
	    			
	        		// Inserindo dígitos na tela de voto de VEREADOR
	        		if ( numeroEmVotacao.length() <= 4 ) {
	        			numeroEmVotacao = numeroEmVotacao.concat( getClicked(request) );
	        		}
	    			
		    		if ( numeroEmVotacao.length() == 2 ) {
		    			if ( urna.validarPartido(numeroEmVotacao) ) {
		    				partidoEmVotacao = urna.getPartido(numeroEmVotacao);
		    			}
		    		}else if ( numeroEmVotacao.length() == 5 ) {
		    			if ( urna.validarVereador(numeroEmVotacao) ) {
		    				request.setAttribute("confirma", "ok");
		    				nomeEmVotacao = urna.getCandidato(numeroEmVotacao).getNome();
		    			}
		    					    			
		    		}

	    		// Prefeito
	    		} else if ( etapa == 2 ) {
	    			// Inserindo dígitos na tela de voto de VEREADOR
	        		if ( numeroEmVotacao.length() <= 1 ) {
	        			numeroEmVotacao = numeroEmVotacao.concat( getClicked(request) );
	        		}
	        		
	        		if ( numeroEmVotacao.length() == 2 ) {
	        			System.out.println("Votando no prefeito");
	        			if ( urna.validarPrefeito(numeroEmVotacao) ) {
	        				request.setAttribute("confirma", "ok");
	        				nomeEmVotacao = urna.getCandidato(numeroEmVotacao).getNome();
	        				partidoEmVotacao = urna.getCandidato(numeroEmVotacao).getPartido();
	        			}
	        		}
	    			
	    		}
	    		System.out.println( ">>" +numeroEmVotacao );
	    		request.getRequestDispatcher("telavoto.jsp").forward(request, response);
    		}

    		
    	} catch (NullPointerException e) {
    		e.printStackTrace();
    	} catch (CandidatoInvalidoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
    private String getClicked(HttpServletRequest request) {
		for (int i = 0; i < 10; i++) {
			if ( request.getParameter( "btn-".concat(String.valueOf(i)) )!= null) {
				return Integer.toString(i);
			}
		}
		return "";
    }
    
    public String getNumeroEmVotacao() {
    	return numeroEmVotacao;
    }
    
    public String corrigeNumeroEmVotacao() {
    	int tam = numeroEmVotacao.length();
    	if ( tam > 1 ) {
    		return numeroEmVotacao.substring(0, tam-1);
    	}
    	return "";
    }
    
    public void corrige() {
    	int tam = numeroEmVotacao.length();
    	
    	if ( tam > 1 ) {
    		numeroEmVotacao = numeroEmVotacao.substring(0, tam-1);
    	
	    	if (tam == 5) {
	    		nomeEmVotacao = "";
	    	} else if (tam == 2) {
	    		partidoEmVotacao = "";
	    	}
    	} else {
    		numeroEmVotacao = "";
    	}
    }
    
    public static String getDigito(int i) {
	    
    	if ( numeroEmVotacao != null ) {
	    	switch (i) {
				case 1:
					if(numeroEmVotacao.length()>=1) {
						return numeroEmVotacao.substring(0, 1);
					}
					break;
				case 2:
					if(numeroEmVotacao.length()>=2) {
						return numeroEmVotacao.substring(1, 2);
					}
					break;
				case 3:
					if(numeroEmVotacao.length()>=3) {
						return numeroEmVotacao.substring(2, 3);
					}
					break;
				case 4:
					if(numeroEmVotacao.length()>=4) {
						return numeroEmVotacao.substring(3, 4);
					}
					break;
				case 5:
					if(numeroEmVotacao.length()>=5) {
						return numeroEmVotacao.substring(4, 5);
					}
					break;
				default:
					break;
				}
    	}
    	return "_";
    }
    
    public void inserirVoto() throws CandidatoInvalidoException {
    	if ( etapa == 1 ) {
    		urna.inserirVotoVereador(numeroEmVotacao);
    	} else if ( etapa == 2) {
    		urna.inserirVotoPrefeito(numeroEmVotacao);
    	}
    }
}
