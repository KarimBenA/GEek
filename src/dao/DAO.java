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

public class DAO {

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

		// if(bdd.containsValue(utilisateur)){
		// return false;
		// }else{
		// bdd.put(utilisateur.getEmail(), utilisateur);
		// return true;
		// }
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

	//
	// public boolean modifUser(Utilisateur utilisateur){
	// if(bdd.containsValue(utilisateur)){
	// bdd.replace(utilisateur.getEmail(), utilisateur);
	// return true;
	// }else{
	// return false;
	// }
	// }
	//
	public Utilisateur getUtilisateur(String login) {
		Query query = em.createQuery("SELECT NEW model.Utilisateur(u.nom, u.prenom, u.email, " 
 				+ "u.pwd, u.telephone, u.genre, u.fumeur, u.blabla, u.adress.numRue, u.adress.codePostal, u.adress.ville, u.adress.pays) " 
 				+ "FROM User u WHERE u.email = :mail");
		query.setParameter("mail", login);
		return (Utilisateur) query.getSingleResult();

		// if(bdd.containsKey(login)){
		// return bdd.get(login);
		// }else{
		// return null;
		// }
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

		// if(utilisateurExiste(login)){
		// if(bdd.get(login).getPwd().equals(password)){
		// return true;
		// }else{
		// return false;
		// }
		// }else{
		// return false;
		// }
	}

	//////////////////////////////////////////// CREATION BDD
	//////////////////////////////////////////// /////////////////////////////////

	// private void createBdd(){
	//
	// SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
	// Date ddn;
	//
	// Utilisateur u1 = new Utilisateur();
	// u1.setNom("Muller");
	// u1.setPrenom("Albert");
	// ddn = null;
	// try {
	// ddn = formatter.parse("01-01-1953");
	// } catch (ParseException e) {
	// e.printStackTrace();
	// }
	// u1.setDdn(ddn);
	// u1.setEmail("albert.muller@gmail.com");
	// u1.setPwd("0000");
	// u1.setTelephone("00.00.00.00.00");
	// u1.setGenre("homme");
	// u1.setFumeur(true);
	// u1.setBlabla(true);
	// bdd.put(u1.getEmail(), u1);
	//
	//
	// Utilisateur u2 = new Utilisateur();
	// u2.setNom("Schmitt");
	// u2.setPrenom("Joséphine");
	// ddn = null;
	// try {
	// ddn = formatter.parse("03-05-1998");
	// } catch (ParseException e) {
	// e.printStackTrace();
	// }
	// u2.setDdn(ddn);
	// u2.setEmail("josephine.schmitt@gmail.com");
	// u2.setPwd("0000");
	// u2.setTelephone("00.00.00.00.01");
	// u2.setGenre("femme");
	// u2.setFumeur(false);
	// u2.setBlabla(false);
	// bdd.put(u2.getEmail(), u2);
	// }

}