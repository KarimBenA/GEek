package jpa.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * Entity implementation class for Entity: User
 *
 */
@Entity
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String nom;
	private String prenom;
	//private Date ddn;
	private String email;
	private String pwd;
	private String telephone;
	private String genre;
	private Boolean fumeur;
	private Boolean blabla;

	@ManyToOne
	@JoinColumn(name = "Adress_id", referencedColumnName = "id")
	private Adress adress;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

//	public Date getDdn() {
//		return ddn;
//	}
//
//	public void setDdn(Date ddn) {
//		this.ddn = ddn;
//	}

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

	public Adress getAdress() {
		return adress;
	}

	public void setAdress(Adress adress) {
		this.adress = adress;
	}

	@Override
	public String toString() {
		return prenom + "  " + nom;
	}

	public User() {
		super();
	}
}
