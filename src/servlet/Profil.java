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

@WebServlet("/Profil")
public class Profil extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	public Profil(){
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//temp
		Utilisateur util = new Utilisateur();
		util.setPrenom("jacky");
		util.setNom("Tunning");
		request.getSession().setAttribute("utilisateurConnecte", util);
		
		request.getSession().setAttribute("modification", false);
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/views/Profil.jsp");
		dispatch.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

