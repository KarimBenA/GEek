package model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

////// CECI EST UN BEAN

public class Utilisateur implements Serializable {

	private static final long serialVersionUID = 1L;

	String nom;
	String prenom;
	Date ddn;
	String email;
	String pwd;
	String telephone;
	String genre;
	Boolean fumeur;
	Boolean blabla;
	Adresse adresse;
	
	
	public Utilisateur(){
		
	}
	
	public Utilisateur(String nom, String prenom, String email, String pwd, String telephone, String genre,
			Boolean fumeur, Boolean blabla, Adresse adresse) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.pwd = pwd;
		this.telephone = telephone;
		this.genre = genre;
		this.fumeur = fumeur;
		this.blabla = blabla;
		this.adresse = adresse;
	}
	
	public Utilisateur(String nom, String prenom, String email, String pwd, String telephone, String genre,
			Boolean fumeur, Boolean blabla, String numRue, String codePostal, String ville, String pays) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.pwd = pwd;
		this.telephone = telephone;
		this.genre = genre;
		this.fumeur = fumeur;
		this.blabla = blabla;
		this.adresse = new Adresse(numRue, codePostal, ville, pays);
	}


	@Override
	public String toString() {
		return this.getPrenom() + " " + this.getNom();
	}
	
	
	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public Date getDdn() {
		return ddn;
	}
	public String getDdnToString(){
		SimpleDateFormat sdf  = new SimpleDateFormat("dd-MM-yyyy");
		return sdf.format(ddn);
	}

	public void setDdn(Date ddn) {
		this.ddn = ddn;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public Boolean getFumeur() {
		return fumeur;
	}

	public void setFumeur(Boolean fumeur) {
		this.fumeur = fumeur;
	}

	public Boolean getBlabla() {
		return blabla;
	}

	public void setBlabla(Boolean blabla) {
		this.blabla = blabla;
	}
	
	public Adresse getAdresse() {
		return adresse;
	}

	public void setAdresse(Adresse adresse) {
		this.adresse = adresse;
	}


}