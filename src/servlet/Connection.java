package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import model.Utilisateur;

/**
 * Servlet implementation class Connection
 */
@WebServlet("/Connection")
public class Connection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Connection() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/Connection.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		DAO dao = DAO.getInstance();
		
		HttpSession session = request.getSession();

		String logEmail = request.getParameter("email");
		String logMotDePasse = request.getParameter("pwd");

		Utilisateur logUtilisateur = null;
		String msgErreur = "";
		
		

		msgErreur += (logEmail == null || logEmail == "") ? "L'email est obligatoire !\n" : "";
		msgErreur += (logMotDePasse == null || logMotDePasse == "") ? "Le mot de passe est obligatoire !\n" : "";

		if ((msgErreur != null) && !(msgErreur.equals(""))) {
			//msgErreur += "jequitte";
			session.setAttribute("error", msgErreur);
			response.sendRedirect("Connection");
		} else {


			if (!dao.utilisateurExiste(logEmail, logMotDePasse)) {
				msgErreur = "Vos identifiants ne permettent pas de vous connecter";
				session.setAttribute("error", msgErreur);
				response.sendRedirect("Connection");
			} else {
				msgErreur = "Connecté\n";
				logUtilisateur = dao.getUtilisateur(logEmail);
				session.setAttribute("connecte", true);
				session.setAttribute("utilisateurConnecte", logUtilisateur);
				
				session.setAttribute("error", msgErreur);
				response.sendRedirect("index.jsp");
			}
			
			//response.sendRedirect("DetailUser?user=" + logUser.getId());


		}
	}

}
