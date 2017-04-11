package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import model.Utilisateur;

@WebServlet("/SupprimerCompte")
public class SupprimerCompte extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public SupprimerCompte() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Utilisateur curUtil = (Utilisateur) request.getSession().getAttribute("utilisateurConnecte");
		
		DAO dao = DAO.getInstance();
		dao.supprimeUtilisateur(curUtil);
		
		request.getSession().setAttribute("connecte", false);
		request.getSession().setAttribute("utilisateurConnecte", null);
		response.sendRedirect("/GEek");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
