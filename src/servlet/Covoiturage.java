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

@WebServlet("/Covoiturage")
public class Covoiturage extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public Covoiturage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DAO dao = DAO.getInstance();
		Utilisateur curUtil = (Utilisateur) request.getSession().getAttribute("utilisateurConnecte");
		
		if(dao.utilisateurExiste(curUtil.getEmail())){
			RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/views/Covoiturage.jsp");
			dispatch.forward(request, response);
		}
		
		//send error
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
