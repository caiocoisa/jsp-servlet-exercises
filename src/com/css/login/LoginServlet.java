package com.css.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UsersDB usersDB;
	
	public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	public void init() {
		this.usersDB = new UsersDB();
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			
			if( this.usersDB.check(email, password)) {
				
				request.getRequestDispatcher("welcomepage.jsp").forward(request, response);
				
			}else {
				
				request.setAttribute("alert", "Login inválido");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		doGet(request, response);
	}

}
