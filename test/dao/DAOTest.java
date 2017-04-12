package dao;

import static org.junit.Assert.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import model.Adresse;
import model.Point;
import model.Utilisateur;

public class DAOTest {
	
	public static final String PERSISTENCE_UNIT_NAME="GEek";
	private static EntityManagerFactory emf=null;
	private static EntityManager em=null;
	private static DAO dao=null;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		emf=Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
		em=emf.createEntityManager();
		dao=DAO.getInstance();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}
	
	@Test
	public final void testListeUtilisateurs() {
		
		assertEquals(2,dao.getListeUtilisateurDetails("bak@gmail.com").size());
		assertEquals(1,dao.getListeUtilisateurDetails("bakaaa@gmail.com").size());
		assertEquals(1,dao.getListeUtilisateurDetails("bakbbbbb@gmail.com").size());
		assertEquals("bakaaa@gmail.com",dao.getListeUtilisateurDetails("bakbbbbb@gmail.com").get(0).getEmail());
		assertEquals("bakbbbbb@gmail.com",dao.getListeUtilisateurDetails("bakaaa@gmail.com").get(0).getEmail());
		
	}
		


	@Test
	public final void testAjouteModifSupprimeExisteUtilisateur() {
		
		assertEquals(false,dao.utilisateurExiste("bak@gmail.com"));
		
		Adresse adresse = new Adresse("32 boulevard de la victoire", "67000", "Strasbourg",
				"France", new Point(Double.valueOf(22),Double.valueOf(13)));
		Utilisateur utilisateur = new Utilisateur("Ben Ahmed", "Karim", "bak@gmail.com",
				"123", "0123456789", "homme", true, true, adresse);
		Utilisateur utilisateurMAJ = new Utilisateur("Ben", "Ka", "bak@gmail.com",
				"000", "0000000000", "femme", false, false, adresse);
		Utilisateur utilisateurMAJ2 = new Utilisateur("Ben", "Ka", "aaa@gmail.com",
				"000", "0000000000", "femme", false, false, adresse);
		
		Adresse adresseMAJ3 = new Adresse("32 boulevard de la victoire", "67000", "Strasbourg",
				"France", new Point(Double.valueOf(22),Double.valueOf(23)));
		Utilisateur utilisateurMAJ3 = new Utilisateur("Ben", "Ka", "bak@gmail.com",
				"000", "0000000000", "femme", false, false, adresseMAJ3);
		
		assertEquals(true,dao.ajouteUtilisateur(utilisateur));
		assertEquals(false,dao.ajouteUtilisateur(utilisateur));
		assertEquals(true,dao.utilisateurExiste("bak@gmail.com"));
		assertEquals(true,dao.utilisateurExiste("bak@gmail.com", "123"));
		assertEquals(false,dao.utilisateurExiste("bak@gmail.com", "1234"));
		assertEquals(false,dao.utilisateurExiste("abc@gmail.com", "123"));
//		assertEquals(true,dao.supprimeUtilisateur(utilisateur));
//		assertEquals(false,dao.utilisateurExiste("bak@gmail.com"));
//		assertEquals(false,dao.supprimeUtilisateur(utilisateur));
		assertEquals(true,dao.modifieUtilisateur(utilisateur, utilisateurMAJ));
		assertEquals(false,dao.modifieUtilisateur(utilisateurMAJ, utilisateurMAJ2));
		assertEquals(true,dao.modifieUtilisateur(utilisateurMAJ, utilisateurMAJ3));
		
		assertEquals(true,dao.supprimeUtilisateur(utilisateurMAJ3));
		assertEquals(false,dao.utilisateurExiste("bak@gmail.com"));
		assertEquals(false,dao.supprimeUtilisateur(utilisateurMAJ3));
		
		Utilisateur utilisateur2 = new Utilisateur("Benaa", "Kaaaa", "bakaaa@gmail.com",
				"000", "0000000000", "femme", false, false, adresseMAJ3);
		Utilisateur utilisateur3 = new Utilisateur("Benaa", "Kaaaa", "bakbbbbb@gmail.com",
				"000", "0000000000", "femme", false, false, adresseMAJ3);
		
		assertEquals(true,dao.ajouteUtilisateur(utilisateur2));
		assertEquals(true,dao.ajouteUtilisateur(utilisateur3));
		
	}
	
	@Test
	public final void testModifUtilisateur() {
		
		Adresse adresse = new Adresse("32 boulevard de la victoire", "67000", "Strasbourg",
				"France", new Point(Double.valueOf(22),Double.valueOf(13)));

		Utilisateur utilisateur = new Utilisateur("E", "F", "eee@gmail.com",
				"123", "0123456789", "homme", true, true, adresse);
		
		assertEquals(true,dao.ajouteUtilisateur(utilisateur));
		
		Utilisateur utilisateurMAJ = new Utilisateur("M", "M", "eee@gmail.com",
				"123", "0123456789", "homme", true, true, adresse);

		assertEquals(true,dao.modifieUtilisateur(utilisateur, utilisateurMAJ));
		
	}

}
