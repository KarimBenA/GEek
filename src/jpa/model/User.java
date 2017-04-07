package jpa.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * Entity implementation class for Entity: User
 *
 */
@Entity

public class User implements Serializable {

	
	private static final long serialVersionUID = 1L;

	public User() {
		super();
	}
   
	/* Commentaire Eddy :
	Essaie de saisir les attributs avec getters et setters
	peut être que @Entity sera reconnu après ça
	+ lier à ton workbench
	*/
}
