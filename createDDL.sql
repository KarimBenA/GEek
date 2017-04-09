CREATE SCHEMA IF NOT EXISTS geek DEFAULT CHARACTER SET utf8 ;

-- -----------------------------------------------------
-- Table Adresse
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS geek.adresses (
  idAdresse BIGINT NOT NULL AUTO_INCREMENT,
  rue VARCHAR(45) NULL,
  codePostal VARCHAR(5) NULL,
  ville VARCHAR(45) NULL,
  pays VARCHAR(45) NULL,
  PRIMARY KEY (`idAdresse`));


-- -----------------------------------------------------
-- Table Utilisateur
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS geek.utilisateurs (
  idUtilistateur BIGINT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(45) NULL,
  prenom VARCHAR(45) NULL,
  genre VARCHAR(45) NULL,
  email VARCHAR(45) NULL,
  pwd VARCHAR(45) NULL,
  telephone VARCHAR(45) NULL,
  idAdresse BIGINT NULL,
  blabla TINYINT(1) NULL,
  fumeur TINYINT(1) NULL,
  PRIMARY KEY (idUtilistateur),
  CONSTRAINT idAdresse
    FOREIGN KEY (idAdresse)
    REFERENCES geek.adresses (idAdresse)
);


-- -----------------------------------------------------
-- Alimentation des tables
-- -----------------------------------------------------
INSERT INTO geek.adresses VALUES (
1, "1 rue des fleurs", "67000", "Strasbourg", "France");
INSERT INTO geek.utilisateurs VALUES(
1, 
"Muller", 
"Albert", 
"homme", 
"albert.muller@gmail.com", 
"0000",
"0601000000",
1,
1,
1
);


INSERT INTO geek.adresses VALUES (
2, "2 rue des fleurs", "67000", "Strasbourg", "France");
INSERT INTO geek.utilisateurs VALUES(
2,
"Schmitt",
"Joséphine",
"femme",
"josephine.schmitt@gmail.com",
"0000",
"0602000000",
2,
1,
0
);


INSERT INTO geek.adresses VALUES (
3, "3 rue des fleurs", "67000", "Strasbourg", "France");
INSERT INTO geek.utilisateurs VALUES(
3,
"Arthus",
"Loic",
"homme",
"loic.arthus@gmail.com",
"0000",
"0603000000",
3,
1,
0
);


INSERT INTO geek.adresses VALUES (
4, "4 rue des fleurs", "67000", "Strasbourg", "France");
INSERT INTO geek.utilisateurs VALUES(
4,
"Dufou",
"Jeanne",
"femme",
"jeanne.dufou@gmail.com",
"0000",
"0604000000",
4,
1,
1
);