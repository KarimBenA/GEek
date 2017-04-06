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

	private void validerPrenom(String prenom) throws Exception {
		if (prenom != null && prenom.trim().length() != 0) {
			if (!prenom.matches("[a-zA-Z]+")) {
				throw new Exception("Le prénom ne peut contenir que des lettres [A-z]");
			}
		} else {
			throw new Exception("Le prénom est obligatoire");
		}
	}

	private void validerNom(String nom) throws Exception {
		if (nom != null && nom.trim().length() != 0) {
			if (!nom.matches("[a-zA-Z]+")) {
				throw new Exception("Le nom ne peut contenir que des lettres [A-z]");
			}
		} else {
			throw new Exception("Le nom est obligatoire");
		}
	}

	// private void validerAge(String age) throws Exception {
	// if (age != null && age.trim().length() != 0) {
	// if (Integer.parseInt(age) < 0 || Integer.parseInt(age) > 80) {
	// throw new Exception("Saisissez un age cohérent");
	// }
	// } else {
	// throw new Exception("L'age est obligatoire");
	// }
	// }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/Inscription.jsp");
		dispatch.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DAO dao = DAO.getInstance();
		
		String prenom = request.getParameter("prenom");
		String nom = request.getParameter("nom");

		String ddnString = request.getParameter("ddn");
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		Date ddn = null;
		try {
			ddn = formatter.parse(ddnString);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		String email = request.getParameter("email");
		String pwd = request.getParameter("mdp");
		String telephone = request.getParameter("telephone");
		String genre = request.getParameter("genre");
		boolean fumeur = (request.getParameter("fumeur").equals("oui")) ? true : false;
		boolean blabla = (request.getParameter("blabla").equals("oui")) ? true : false;

		try {
			validerPrenom(prenom);
			validerNom(nom);
			// validerAge("" + age);
		} catch (Exception e) {
			response.getWriter().println(e.getMessage());
			this.getServletContext().getRequestDispatcher("Inscription").include(request, response);

		} finally {
			Utilisateur utilisateur = new Utilisateur();
			utilisateur.setPrenom(prenom);
			utilisateur.setNom(nom);
			utilisateur.setDdn(ddn);
			utilisateur.setEmail(email);
			utilisateur.setPwd(pwd);
			utilisateur.setTelephone(telephone);
			utilisateur.setGenre(genre);
			utilisateur.setFumeur(fumeur);
			utilisateur.setBlabla(blabla);
			dao.ajouteUtilisateur(utilisateur);
			System.out.println(dao.getUtilisateur(email).getNom() + " " + dao.getUtilisateur(email).getPrenom());
			response.sendRedirect("index.jsp");

		}
	}

}
