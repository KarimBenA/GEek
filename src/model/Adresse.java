package model;

public class Adresse {
	
	private String numRue;
	private String codePostal;
	private String ville;
	private String pays;

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
}
