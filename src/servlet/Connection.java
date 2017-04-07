package servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import model.Adresse;
import model.Utilisateur;

@WebServlet("/Connection")
public class Connection extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public Connection() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/Connection.jsp");
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		DAO dao = DAO.getInstance();
		//Utilisateur util = dao.utilisateurExiste(id, pwd);
		Utilisateur util = new Utilisateur();
		util.setPrenom("Jean");
		util.setNom("David");
		util.setDdn(new Date());
		util.setEmail("j.d@gggg.fr");
		util.setPwd("0000");
		util.setTelephone("0000000000");
		util.setGenre("homme");
		util.setFumeur(true);
		util.setBlabla(true);
		Adresse ad = new Adresse("3 rue du chien", "68888", "stras", "france");
		util.setAdresse(ad);
		//util = null;

		if(util != null){
			request.getSession().setAttribute("connecte", true);
			request.getSession().setAttribute("utilisateurConnecte", util);
			response.sendRedirect("/GEek");
		}else{
			request.getSession().setAttribute("wrongIDS", true);
			RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/Connection.jsp");
			dispatch.forward(request, response);
		}
	}

}
