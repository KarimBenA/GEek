package dao;

import java.util.List;

import model.Utilisateur;
import model.UtilisateurDetails;

public interface InterfaceDAO {
	
	public boolean ajouteUtilisateur(Utilisateur utilisateur);

	public boolean supprimeUtilisateur(Utilisateur utilisateur);
	
	public boolean modifieUtilisateur(Utilisateur utilisateur, Utilisateur utilisateurMAJ);

	public Utilisateur getUtilisateur(String login);

	public boolean utilisateurExiste(String login);

	public boolean utilisateurExiste(String login, String password);
	
	public List<UtilisateurDetails> getListeUtilisateurDetails(String login);


}
