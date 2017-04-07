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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/Connection.jsp");
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String login = request.getParameter("email");
		String pwd = request.getParameter("pwd");

		DAO dao = DAO.getInstance();
		
		Utilisateur util = null;
		if (dao.utilisateurExiste(login, pwd)){
			util = dao.getUtilisateur(login);
		}

		if (util != null) {
			request.getSession().setAttribute("connecte", true);
			request.getSession().setAttribute("utilisateurConnecte", util);
			response.sendRedirect("/GEek");
		} else {
			request.getSession().setAttribute("wrongIDS", true);
			RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/Connection.jsp");
			dispatch.forward(request, response);
		}
	}
}