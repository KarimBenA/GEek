package servlet;

import model.Utilisateur;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

@WebServlet("/")
public class Profil extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public Profil(){
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAO dao = DAO.getInstance();
		request.getSession().setAttribute("utilisateurConnecte", dao.getUtilisateur("albert.muller@gmail.com"));
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/views/Profil.jsp");
		dispatch.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}

