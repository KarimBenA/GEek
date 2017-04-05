package dao;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import model.Utilisateur;

public class DAO {
	
	private static DAO instance = null;
	
	private HashMap<String, Utilisateur> bdd;
	
	
	private DAO(){
		bdd = new HashMap<String, Utilisateur>();
		createBdd();
	}
	
	public static DAO getInstance(){
		if(instance == null){
			instance = new DAO();
		}
		return instance;
	}
	
	
	public boolean ajouteUtilisateur(Utilisateur utilisateur){
		if(bdd.containsValue(utilisateur)){
			return false;
		}else{
			bdd.put(utilisateur.getEmail(), utilisateur);
			return true;
		}
		
	}
	
	public boolean supprimeUtilisateur(Utilisateur utilisateur){
		if(bdd.containsValue(utilisateur)){
			bdd.remove(utilisateur);
			return true;
		}else{
			return false;
		}
	}
	
	public boolean modifUser(Utilisateur utilisateur){
		if(bdd.containsValue(utilisateur)){
			bdd.replace(utilisateur.getEmail(), utilisateur);
			return true;
		}else{
			return false;
		}
	}
	
	public Utilisateur getUtilisateur(String login){
		if(bdd.containsKey(login)){
			return bdd.get(login);
		}else{
			return null;
		}
	}
	
	
	public boolean utilisateurExiste(String login){
		return bdd.containsKey(login);
	}
	
	public boolean utilisateurExiste(String login, String password){
		if(utilisateurExiste(login)){
			if(bdd.get(login).getPwd().equals(password)){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	
	
	
	
	////////////////////////////////////////////  CREATION BDD /////////////////////////////////
	
	private void createBdd(){
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		Date ddn;
		
		Utilisateur u1 = new Utilisateur();
		u1.setNom("Muller");
		u1.setPrenom("Albert");
		ddn = null;
		try {
			ddn = formatter.parse("01-01-1953");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		u1.setEmail("albert.muller@gmail.com");
		u1.setPwd("0000");
		u1.setTelephone("00.00.00.00.00");
		u1.setGenre("homme");
		u1.setFumeur(true);
		u1.setBlabla(true);
		bdd.put(u1.getEmail(), u1);
		
		
		
		Utilisateur u2 = new Utilisateur();
		u2.setNom("Schmitt");
		u2.setPrenom("Joséphine");
		ddn = null;
		try {
			ddn = formatter.parse("03-05-1998");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		u2.setEmail("josephine.schmitt@gmail.com");
		u2.setPwd("0000");
		u2.setTelephone("00.00.00.00.01");
		u2.setGenre("femme");
		u2.setFumeur(false);
		u2.setBlabla(false);
		bdd.put(u2.getEmail(), u2);
	}
	
}