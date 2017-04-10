CREATE SCHEMA IF NOT EXISTS geek DEFAULT CHARACTER SET utf8 ;

-- -----------------------------------------------------
-- Table Adresse
-- -----------------------------------------------------
CREATE TABLE GEEK.ADRESS (
ID BIGINT AUTO_INCREMENT NOT NULL, 
CODEPOSTAL VARCHAR(255), 
NUMRUE VARCHAR(255), 
PAYS VARCHAR(255), 
VILLE VARCHAR(255), 
PRIMARY KEY (ID)
);


-- -----------------------------------------------------
-- Table Utilisateur
-- -----------------------------------------------------
CREATE TABLE GEEK.USER (
ID BIGINT AUTO_INCREMENT NOT NULL, 
BLABLA TINYINT(1) default 0, 
EMAIL VARCHAR(255), 
FUMEUR TINYINT(1) default 0, 
GENRE VARCHAR(255), 
NOM VARCHAR(255), 
PRENOM VARCHAR(255), 
PWD VARCHAR(255), 
TELEPHONE VARCHAR(255), 
Adress_id BIGINT, PRIMARY KEY (ID)
);


-- -----------------------------------------------------
-- Table Utilisateur/Adresses
-- -----------------------------------------------------
CREATE TABLE GEEK.ADRESS_USER (
Adress_ID BIGINT NOT NULL, 
users_ID BIGINT NOT NULL, 
PRIMARY KEY (Adress_ID, users_ID)
); 


-- -----------------------------------------------------
-- Alimentation des tables
-- -----------------------------------------------------
INSERT INTO geek.adress VALUES (
1, "1 rue des fleurs", "67000", "Strasbourg", "France");
INSERT INTO geek.user VALUES(
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


INSERT INTO geek.adress VALUES (
2, "2 rue des fleurs", "67000", "Strasbourg", "France");
INSERT INTO geek.user VALUES(
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


INSERT INTO geek.adress VALUES (
3, "3 rue des fleurs", "67000", "Strasbourg", "France");
INSERT INTO geek.user VALUES(
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


INSERT INTO geek.adress VALUES (
4, "4 rue des fleurs", "67000", "Strasbourg", "France");
INSERT INTO geek.user VALUES(
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