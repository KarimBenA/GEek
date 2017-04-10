package model;

public class Adresse {
	
	private String numRue;
	private String codePostal;
	private String ville;
	private String pays;
	private Point coordonnees;


	public Adresse(String numRue, String codePostal, String ville, String pays, Point coordonnees) {
		super();
		this.numRue = numRue;
		this.codePostal = codePostal;
		this.ville = ville;
		this.pays = pays;
		this.coordonnees = coordonnees;
	}

	@Override
	public String toString() {
		return numRue + " " + codePostal + " " + ville + " " + pays;
	}
	
	public String getNumRue() {
		return numRue;
	}
	public void setNumRue(String adresse) {
		this.numRue = adresse;
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
	public Point getCoordonnees() {
		return coordonnees;
	}
	public void setCoordonnees(Point coordonnees) {
		this.coordonnees = coordonnees;
	}
	
}
