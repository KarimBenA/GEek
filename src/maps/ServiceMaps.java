package maps;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Adresse;
import model.Point;
import model.Utilisateur;

@WebServlet("/ServiceMaps")
public class ServiceMaps extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ServiceMaps() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Utilisateur utilisateur = new Utilisateur();
		utilisateur.setAdresse(
				new Adresse("19 rue de la Chapelle", "67540", "Ostwald", "France", new Point(48.5534743, 7.7074594)));
		request.getSession().setAttribute("utilisateurConnecte", utilisateur);

		RequestDispatcher dispatch = request.getRequestDispatcher("/WEB-INF/views/ServiceMaps.jsp");
		dispatch.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}