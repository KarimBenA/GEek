package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import jpa.model.Adress;
import jpa.model.EPoint;
import jpa.model.User;
import model.Adresse;
import model.Utilisateur;
import model.UtilisateurDetails;

public class DAO implements InterfaceDAO {

	private static DAO instance = null;

	private DAO() {
	}

	public static DAO getInstance() {
		if (instance == null) {
			instance = new DAO();
			if (instance.em == null) {
				EntityManagerFactory emf = Persistence.createEntityManagerFactory("GEek");
				instance.em = emf.createEntityManager();
			}
		}
		return instance;
	}

	@PersistenceContext(unitName = "GEek")
	private EntityManager em;

	private DAO(EntityManager em) {
		super();
		this.em = em;
	}
	
	public List<UtilisateurDetails> getListeUtilisateurDetails(String login) {
		Query query = em.createQuery("SELECT NEW model.UtilisateurDetails(u.nom, u.prenom, u.email, "
				+ "u.telephone, u.genre, u.fumeur, u.blabla, u.adress.numRue, u.adress.codePostal, "
				+ "u.adress.ville, u.adress.pays, "
				+ "u.adress.coordonnees.lat, u.adress.coordonnees.lng) "
				+ "FROM User u WHERE u.email != :mail");
		query.setParameter("mail", login);
		return (List<UtilisateurDetails>) query.getResultList();
	}

	public boolean ajouteUtilisateur(Utilisateur utilisateur) {

		if (utilisateurExiste(utilisateur.getEmail())) {
			return false;
		} else {
			em.getTransaction().begin();

			User user = new User();
			
			setUtilisateurToUser(utilisateur, user);

			em.persist(user);
			em.getTransaction().commit();
			// em.close();

			return true;
		}
	}

	private void setUtilisateurToUser(Utilisateur utilisateur, User user) {
		setAdresseToUser(utilisateur.getAdresse(), user);
		setUtilisateurExceptAdressToUser(utilisateur, user);
	}

	private void setUtilisateurExceptAdressToUser(Utilisateur utilisateur, User user) {
		user.setNom(utilisateur.getNom());
		user.setPrenom(utilisateur.getPrenom());
		user.setEmail(utilisateur.getEmail());
		user.setPwd(utilisateur.getPwd());

		user.setTelephone(utilisateur.getTelephone());
		user.setGenre(utilisateur.getGenre());
		user.setFumeur(utilisateur.getFumeur());
		user.setBlabla(utilisateur.getBlabla());
	}
	
	@Override
	public boolean modifieUtilisateur(Utilisateur utilisateur, Utilisateur utilisateurMAJ) {

		if (utilisateur.equals(utilisateurMAJ)){
			System.out.println("equals");
			return true;
		} else if (!utilisateur.getEmail().equals(utilisateurMAJ.getEmail())){
			return false;
		} else {
			em.getTransaction().begin();

			User user = getUser(utilisateur.getEmail());
			
			if (!utilisateur.getAdresse().equals(utilisateurMAJ.getAdresse())){				
				setAdresseToUser(utilisateurMAJ.getAdresse(), user);		
			}

			setUtilisateurExceptAdressToUser(utilisateurMAJ, user);

			
			em.persist(user);
			em.getTransaction().commit();
			System.out.println("commité");
			return true;
		}
		
		
	}

	private void setAdresseToUser(Adresse adresse, User user) {
		Adress adress = new Adress();
		
		if (getAdressSiExiste(adresse) != null) {
			adress = getAdressSiExiste(adresse);
		} else {
			adress.setNumRue(adresse.getNumRue());
			adress.setCodePostal(adresse.getCodePostal());
			adress.setVille(adresse.getVille());
			adress.setPays(adresse.getPays());

			EPoint point = new EPoint();
			point.setLat(adresse.getCoordonnees().getLat());
			point.setLng(adresse.getCoordonnees().getLng());

			adress.setCoordonnees(point);

			em.persist(point);
		}
		
		user.setAdress(adress);
		em.persist(adress);
	}

	public boolean supprimeUtilisateur(Utilisateur utilisateur) {

		if (utilisateurExiste(utilisateur.getEmail())) {

			em.getTransaction().begin();

			Query query = em.createQuery("DELETE FROM User u WHERE u.email= :mail");
			query.setParameter("mail", utilisateur.getEmail());
			query.executeUpdate();

			em.getTransaction().commit();
			// em.close();
			return true;
		} else {
			return false;
		}
	}
	
	private User getUser(String login) {
		Query query = em.createQuery("SELECT u "
				+ "FROM User u WHERE u.email = :mail");
		query.setParameter("mail", login);
		return (User) query.getSingleResult();
	}

	public Utilisateur getUtilisateur(String login) {
		Query query = em.createQuery("SELECT NEW model.Utilisateur(u.nom, u.prenom, u.email, "
				+ "u.pwd, u.telephone, u.genre, u.fumeur, u.blabla, "
				+ "u.adress.numRue, u.adress.codePostal, u.adress.ville, u.adress.pays, "
				+ "u.adress.coordonnees.lat, u.adress.coordonnees.lng) "
				+ "FROM User u WHERE u.email = :mail");
		
		query.setParameter("mail", login);
		return (Utilisateur) query.getSingleResult();
	}

	public boolean utilisateurExiste(String login) {
		Query query = em
				.createQuery("SELECT NEW model.Identifiants(u.email, u.pwd) FROM " + "User u WHERE u.email= :mail");
		query.setParameter("mail", login);
		return (query.getResultList().isEmpty()) ? false : true;
	}

	public boolean utilisateurExiste(String login, String password) {
		System.out.println(em);
		Query query = em.createQuery("SELECT NEW model.Identifiants(u.email, u.pwd) FROM "
				+ "User u WHERE u.email= :mail AND u.pwd= :password");
		query.setParameter("mail", login);
		query.setParameter("password", password);
		return (query.getResultList().isEmpty()) ? false : true;
	}

	private Adress getAdressSiExiste(Adresse adresse) {
		Adress result = null;
		Query query = em
				.createQuery("SELECT a FROM "
						+ "Adress a WHERE a.coordonnees.lat= :lat AND a.coordonnees.lng= :lng");
		query.setParameter("lat", adresse.getCoordonnees().getLat());
		query.setParameter("lng", adresse.getCoordonnees().getLng());
		try {
			result = (Adress) query.getSingleResult();
		} catch (NoResultException e) {
			
		}
		return result;
	}

	// public Boolean AdresseExiste(Adresse adresse) {
	// Query query = em.createQuery("SELECT NEW model.Adresse(a.coordonnees)
	// FROM "
	// + "Adress a WHERE a.coordonnees.lat= :lat AND a.coordonnees.lng= :lng");
	// query.setParameter("lat", adresse.getCoordonnees().getLat());
	// query.setParameter("lng", adresse.getCoordonnees().getLng());
	// return (query.getResultList().isEmpty()) ? false : true;
	// }

}