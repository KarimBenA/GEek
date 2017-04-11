package jpa.model;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Entity implementation class for Entity: Adress
 *
 */
@Entity
@Table(indexes = { @Index(columnList = "coordonnees", unique = true) })
public class Adress implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String numRue;
	private String codePostal;
	private String ville;
	private String pays;
	private EPoint coordonnees;

	private Collection<User> users;

	@OneToMany(mappedBy = "adress")
	public Collection<User> getUsers() {
		return users;
	}

	public void setUsers(Collection<User> users) {
		this.users = users;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNumRue() {
		return numRue;
	}

	public void setNumRue(String numRue) {
		this.numRue = numRue;
	}

	public String getCodePostal() {
		return codePostal;
	}

	public void setCodePostal(String codePostal) {
		this.codePostal = codePostal;
	}

	public String getVille() {
		return ville;
	}

	public void setVille(String ville) {
		this.ville = ville;
	}

	public String getPays() {
		return pays;
	}

	public void setPays(String pays) {
		this.pays = pays;
	}
	
	public EPoint getCoordonnees() {
		return coordonnees;
	}

	public void setCoordonnees(EPoint coordonnees) {
		this.coordonnees = coordonnees;
	}

	public Adress() {
		super();
	}

	@Override
	public String toString() {
		return numRue + "  " + codePostal + "  " + ville + "  " + pays;
	}

}
