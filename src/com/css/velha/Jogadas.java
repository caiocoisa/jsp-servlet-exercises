package com.css.velha;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/jogar"})
public class Jogadas extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArrayList<String> posicoes;
	private String turno;

    public Jogadas() {
        super();
    }
    
    public void init() {
    	this.posicoes = new ArrayList();
    	
    	for (int i = 0; i < 9; i++) {
			posicoes.add(i, "-");
		}
    	
    	this.turno = "X";
    	
    	
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jogada = request.getParameter("marcar");
		
		//valida o parâmetro enviado pela url
		if ( isLegal(jogada) ) {
			int index = Integer.parseInt(jogada);
			this.posicoes.set(index, turno);
			switchPlayer();
			//atualiza os atributos para devolver à página
			for (int i = 0; i < 9; i++) {
				request.setAttribute(String.valueOf(i), posicoes.get(i));
			}
			// verificar se houve vencedor no turno atual
			if ( hasWinner() ) {
				switchPlayer();
				request.setAttribute("winner", turno);
			}
			
			//verifica se houve empate
			if ( isDraw() ) {
				request.setAttribute("draw", true);
			}
		}
		
		if ( jogada == null ) {
			for (int i = 0; i < 9; i++) {
				request.setAttribute(String.valueOf(i), posicoes.get(i));
			}
		}
		
		//troca o turno e atualiza o atributo a ser devolvido à página 
		
		request.setAttribute("turno", turno);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
		//response.getWriter().append("Parameters: ").append(request.getParameterMap().keySet().toString());
		//response.getWriter().append("Parameter Names: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Par: ").append(request.getParameterMap().keySet().toString());
		//doGet(request, response);
	}
	
	private boolean isLegal(String jogada ) {
		try {
			if (  jogada.equals("1") | jogada.equals("2") | jogada.equals("3") 
				| jogada.equals("4") | jogada.equals("5") | jogada.equals("6")
				| jogada.equals("7") | jogada.equals("8") | jogada.equals("0")) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	private void switchPlayer() {
		if ( this.turno.equals("X") ) {
			this.turno = "O";
		} else {
			this.turno = "X";
		}
	}
	
	private boolean hasWinner() {
		//horizontal
		if ( posicoes.get(0).equals(posicoes.get(1)) & posicoes.get(0).equals(posicoes.get(2)) & !posicoes.get(0).equals("-")
			| posicoes.get(3).equals(posicoes.get(4)) & posicoes.get(3).equals(posicoes.get(5)) & !posicoes.get(3).equals("-")
			| posicoes.get(6).equals(posicoes.get(7)) & posicoes.get(6).equals(posicoes.get(8)) & !posicoes.get(6).equals("-")
			) {
			
			return true;
		}
		
		//vertical
		if ( posicoes.get(0).equals(posicoes.get(3)) & posicoes.get(0).equals(posicoes.get(6)) & !posicoes.get(0).equals("-") 
			| posicoes.get(1).equals(posicoes.get(4)) & posicoes.get(1).equals(posicoes.get(7)) & !posicoes.get(1).equals("-")
			| posicoes.get(2).equals(posicoes.get(5)) & posicoes.get(2).equals(posicoes.get(8)) & !posicoes.get(2).equals("-")
			) {
			return true;
		}
		
		//diagonal
		if ( posicoes.get(0).equals(posicoes.get(4)) & posicoes.get(0).equals(posicoes.get(8)) & !posicoes.get(0).equals("-")
			| posicoes.get(2).equals(posicoes.get(4)) & posicoes.get(2).equals(posicoes.get(6)) & !posicoes.get(2).equals("-")
			) {
			return true;
		}
		return false;
	}
	
	private boolean isDraw() {
		for (String string : posicoes) {
			if ( string.equals("-") ) {
				return false;
			}
		}
		return true;
	}
}
