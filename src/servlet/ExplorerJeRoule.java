package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import model.Utilisateur;
import model.UtilisateurDetails;

@WebServlet("/ExplorerJeRoule")
public class ExplorerJeRoule extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public ExplorerJeRoule() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Utilisateur curUtil = (Utilisateur) request.getSession().getAttribute("utilisateurConnecte");
		String login = curUtil.getEmail();
		DAO dao = DAO.getInstance();
		List<UtilisateurDetails> listeUtil = (List<UtilisateurDetails>) dao.getListeUtilisateurDetails(login);
		request.getSession().setAttribute("listeUtilisateurs", listeUtil);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/views/ExplorerJeRoule.jsp");
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
