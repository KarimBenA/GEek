package dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import jpa.model.Adress;
import jpa.model.User;
import model.Adresse;
import model.Utilisateur;

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

	public boolean ajouteUtilisateur(Utilisateur utilisateur) {

		if (utilisateurExiste(utilisateur.getEmail())) {
			return false;
		} else {
			em.getTransaction().begin();

			User user = new User();
			Adress adress = new Adress();

			Adresse adresseUtilisateur = utilisateur.getAdresse();

			adress.setNumRue(adresseUtilisateur.getNumRue());
			adress.setCodePostal(adresseUtilisateur.getCodePostal());
			adress.setVille(adresseUtilisateur.getVille());
			adress.setPays(adresseUtilisateur.getPays());

			user.setNom(utilisateur.getNom());
			user.setPrenom(utilisateur.getPrenom());
			user.setEmail(utilisateur.getEmail());
			user.setPwd(utilisateur.getPwd());
			user.setAdress(adress);
			user.setTelephone(utilisateur.getTelephone());
			user.setGenre(utilisateur.getGenre());
			user.setFumeur(utilisateur.getFumeur());
			user.setBlabla(utilisateur.getBlabla());

			em.persist(adress);
			em.persist(user);
			em.getTransaction().commit();
			// em.close();

			return true;
		}
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

	@Override
	public boolean modifieUtilisateur(Utilisateur utilisateur, Utilisateur utilisateurMAJ) {
		// TODO Auto-generated method stub
		return false;
	}

	public Utilisateur getUtilisateur(String login) {
		Query query = em.createQuery("SELECT NEW model.Utilisateur(u.nom, u.prenom, u.email, "
				+ "u.pwd, u.telephone, u.genre, u.fumeur, u.blabla, u.adress.numRue, u.adress.codePostal, u.adress.ville, u.adress.pays) "
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

}