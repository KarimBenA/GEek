-- -----------------------------------------------------
-- Table Utilisateur
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Utilisateurs (
idUtilisateur BIGINT AUTO_INCREMENT NOT NULL, 
nom VARCHAR(255), 
prenom VARCHAR(255),
genre VARCHAR(255),
email VARCHAR(255),
pwd VARCHAR(255),
telephone VARCHAR(255),
idAdresse BIGINT,
blabla TINYINT(1) default 0,
fumeur TINYINT(1) default 0,
CONSTRAINT pk_utilisateurs PRIMARY KEY (idUtilisateur)
--CONSTRAINT fk_utilisateur_adresse FOREIGN KEY (idAdresse) REFERENCES Adresses (idAdresse)
)

-- -----------------------------------------------------
-- Table Adresse
-- -----------------------------------------------------
CREATE TABLE Adresses (
idAdresse BIGINT AUTO_INCREMENT NOT NULL,
numRue VARCHAR(255),
codePostal VARCHAR(255),
ville VARCHAR(255),
pays VARCHAR(255),
CONSTRAINT pk_adresses PRIMARY KEY (idAdresse)
)


-- -----------------------------------------------------
-- Table Adresse utilisateur
-- -----------------------------------------------------
--CREATE TABLE Adresses_Utilisateurs (
--idAdresse BIGINT NOT NULL, 
--idUtilisateur BIGINT NOT NULL, 
--CONSTRAINT PRIMARY KEY (Adress_ID, users_ID))


-- -----------------------------------------------------
-- Alimentation des tables
-- -----------------------------------------------------
INSERT INTO Utilisateurs VALUES
("Muller", 
"Albert", 
"homme", 
"albert.muller@gmail.com", 
"0000",
"0601000000",
1,
1,
1,
),

("Schmitt",
"Joséphine",
"femme",
"josephine.schmitt@gmail.com",
"0000",
"0602000000",
2,
1,
0
),

("Loic",
"Arthus",
"homme",
"loic.arthus@gmail.com",
"0000",
"0603000000",
3,
1,
0
)

("Jeanne",
"Dufou",
"femme",
"jeanne.dufou@gmail.com",
"0000",
"0604000000",
4,
1,
1
)