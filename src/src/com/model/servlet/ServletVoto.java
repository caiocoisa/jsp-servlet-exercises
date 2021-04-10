package src.com.model.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.com.model.controller.Urna;

@WebServlet(urlPatterns = {"/votar"})
public class ServletVoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static Urna urna;
       
    public ServletVoto() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getAttribute("etapa").toString());
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	request.setAttribute("etapa", "prefeito");
    	request.getRequestDispatcher("index.jsp").forward(request, response);
		doGet(request, response);
	}

}
