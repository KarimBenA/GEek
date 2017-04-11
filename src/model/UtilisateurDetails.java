package model;

import java.io.Serializable;

public class UtilisateurDetails implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	String nom;
	String prenom;
	String email;
	String telephone;
	String genre;
	Boolean fumeur;
	Boolean blabla;
	String adresseString;
	double lat;
	double lng;
	
	public UtilisateurDetails(String nom, String prenom, String email, String telephone, String genre, Boolean fumeur,
			Boolean blabla, String numRue, String codePostal, String ville, String pays, double lat, double lng) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.telephone = telephone;
		this.genre = genre;
		this.fumeur = fumeur;
		this.blabla = blabla;
		this.adresseString = numRue + ",  " + codePostal + ",  " + ville + ",  " + pays;
		this.lat = lat;
		this.lng = lng;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getAdresseString() {
		return adresseString;
	}

	public void setAdresseString(String adresseString) {
		this.adresseString = adresseString;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	
	
}
