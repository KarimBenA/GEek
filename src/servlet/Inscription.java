package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import model.Utilisateur;

@WebServlet("/Inscription")
public class Inscription extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public Inscription() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/views/Inscription.jsp");
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		Utilisateur util = new Utilisateur();
		util.setPrenom(request.getParameter("prenom"));
		util.setNom(request.getParameter("nom"));
		
		String ddnString = request.getParameter("ddn");
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		Date ddn = null;
		try {
			ddn = formatter.parse(ddnString);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		util.setDdn(ddn);
		util.setEmail(request.getParameter("email"));
		util.setPwd(request.getParameter("mdp"));
		util.setTelephone(request.getParameter("telephone"));
		util.setGenre(request.getParameter("genre"));
		util.setFumeur(request.getParameter("fumeur").equals("oui"));
		util.setBlabla(request.getParameter("blabla").equals("oui"));
		

		DAO dao = DAO.getInstance();
		//boolean reussi = dao.ajouteUtilisateur(util);
		boolean reussi = true;
		
		RequestDispatcher dispatch = null;
		if(reussi){
			request.getSession().setAttribute("connecte", true);
			request.getSession().setAttribute("utilisateurConnecte", util);
			dispatch = request.getRequestDispatcher("/WEB-INF/views/InscriptionValide.jsp");
		}else{
			dispatch = request.getRequestDispatcher("/WEB-INF/views/InscriptionNonValide.jsp");
		}
		dispatch.forward(request, response);
	}
	
	
	
	///////////////////////////////////  VALIDATION SAISIE ///////////////////////////////////////////////////
	
	private void validerNom(String nom) throws Exception {
		if (nom != null && nom.trim().length() != 0) {
			if (!nom.matches("[a-zA-Z]+")) {
				throw new Exception("Le nom ne peut contenir que des lettres [A-z]");
			}
		} else {
			throw new Exception("Le nom est obligatoire");
		}
	}

	private void validerPrenom(String prenom) throws Exception {
		if (prenom != null && prenom.trim().length() != 0) {
			if (!prenom.matches("[a-zA-Z]+")) {
				throw new Exception("Le pr�nom ne peut contenir que des lettres [A-z]");
			}
		} else {
			throw new Exception("Le pr�nom est obligatoire");
		}
	}

}
