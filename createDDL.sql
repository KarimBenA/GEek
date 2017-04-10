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