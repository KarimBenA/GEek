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
	public final void testUtilisateurExisteStringString() {
		assertEquals(true,dao.utilisateurExiste("bak@gmail.com", "123"));
		assertEquals(false,dao.utilisateurExiste("bak@gmail.com", "1234"));
		assertEquals(false,dao.utilisateurExiste("abc@gmail.com", "123"));
	}
	
	@Test
	public final void testSupprimeUtilisateur() {
		Utilisateur user = dao.getUtilisateur("bak@gmail.com");
		assertEquals(true,dao.supprimeUtilisateur(user));
	}
	

	@Test
	public final void testAjouteUtilisateur() {
		
		Adresse adresse = new Adresse("26 boulevard de la victoire", "67000", "Strasbourg", "France");
		Utilisateur utilisateur = new Utilisateur("Ben Ahmed", "Karim", "bak@gmail.com", "123", "0123456789", "homme", true, true, adresse);
		
		assertEquals(true,dao.ajouteUtilisateur(utilisateur));
	}

}
