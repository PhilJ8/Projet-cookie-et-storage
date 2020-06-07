USE INPHOTOTHEQUE;

CREATE TABLE IF NOT EXISTS CLIENT(
idClient INT NOT NULL, 
nomClient VARCHAR(255) NOT NULL, 
prénomClient VARCHAR(255) NOT NULL, 
adresseClient VARCHAR(255) NOT NULL, 
mailClient VARCHAR(255) NOT NULL,
PRIMARY KEY (idClient)
);

CREATE TABLE IF NOT EXISTS FORMAT(
idFormat INT NOT NULL, 
nomFormat VARCHAR(255) NOT NULL, 
quantite INT NOT NULL,
PRIMARY KEY (idFormat)
);

CREATE TABLE IF NOT EXISTS PHOTOGRAPHE(
idPhotographe INT NOT NULL, 
nomPhotographe VARCHAR(255) NOT NULL, 
contactPhotographe VARCHAR(255) NOT NULL,
PRIMARY KEY (idPhotographe)
);

CREATE TABLE IF NOT EXISTS APPAREIL(
idAppareil INT NOT NULL,
marque VARCHAR(255) NOT NULL,
modele VARCHAR(255) NOT NULL,
PRIMARY KEY (idAppareil)
);

CREATE TABLE IF NOT EXISTS OBJECTIF(
idObjectif INT NOT NULL, 
diamètre VARCHAR(255), 
focale VARCHAR(255),
fk_idAppareilO INT NOT NULL, 
PRIMARY KEY (idObjectif),
FOREIGN KEY (fk_idAppareilO) REFERENCES APPAREIL (idAppareil)  
);

CREATE TABLE IF NOT EXISTS CATEGORIE(
idCategorie INT NOT NULL, 
nomCategorie VARCHAR(255) NOT NULL,
PRIMARY KEY (idCategorie)
);	

CREATE TABLE IF NOT EXISTS COMMANDE(
idCommande INT NOT NULL, 
dateCommande Date, 
prixTotal INT NOT NULL,
fk_idClientC INT NOT NULL,
PRIMARY KEY (idCommande),
FOREIGN KEY (fk_idClientC) REFERENCES CLIENT (idClient)
);

CREATE TABLE IF NOT EXISTS SPECIFICITE(
idSpecificite INT NOT NULL, 
vitesse_opturation VARCHAR(255), 
ISO VARCHAR(255) NOT NULL,
fk_idPhotographieS INT NOT NULL,
PRIMARY KEY (idSpecificite)
);

CREATE TABLE IF NOT EXISTS PHOTOGRAPHIE(
idPhotographie INT NOT NULL, 
titrePhotographie VARCHAR(255) NOT NULL, 
prixUnitaire INT NOT NULL,
fk_idPhotographePhoto INT NOT NULL,
fk_idAppareilPhoto INT NOT NULL,
fk_idSpecificitePhoto INT NOT NULL,
fk_idCategoriePhoto INT NOT NULL, 
PRIMARY KEY (IdPhotographie),
FOREIGN KEY (fk_idPhotographePhoto) REFERENCES PHOTOGRAPHIE (idPhotographie),
FOREIGN KEY (fk_idAppareilPhoto) REFERENCES APPAREIL (idAppareil),
FOREIGN KEY (fk_idSpecificitePhoto) REFERENCES SPECIFICITE (idSpecificite),
FOREIGN KEY (fk_idCategoriePhoto) REFERENCES CATEGORIE (idCategorie)
);

CREATE TABLE IF NOT EXISTS COMMANDE_CONCERNE_PHOTOGRAPHIE(
idCommandeConcernePhotographie INT NOT NULL, 
fk_idCommandeComPhoto INT NOT NULL, 
fk_idPhotographieComPhoto INT NOT NULL, 
fk_idFormatComPhoto INT NOT NULL,
PRIMARY KEY  (idCommandeConcernePhotographie),
FOREIGN KEY (fk_idCommandeComPhoto) REFERENCES COMMANDE (idCommande),
FOREIGN KEY (fk_idPhotographieComPhoto) REFERENCES PHOTOGRAPHIE (idPhotographie),
FOREIGN KEY (fk_idFormatComPhoto) REFERENCES FORMAT (idFormat)
);

CREATE TABLE IF NOT EXISTS APPAREIL_REALISE_PHOTOGRAPHIE(
idAppareilRealisePhotographie INT NOT NULL,  
fk_idAppareilA INT NOT NULL, 
fk_idPhotographieA INT NOT NULL, 
PRIMARY KEY (idAppareilRealisePhotographie),
FOREIGN KEY (fk_idAppareilA) REFERENCES APPAREIL (idAppareil),
FOREIGN KEY (fk_idPhotographieA) REFERENCES PHOTOGRAPHIE (idPhotographie)
);

CREATE TABLE IF NOT EXISTS PHOTOGRAPHIE_POSSEDE_FORMAT(
idPhotographiePossedeFormat INT NOT NULL, 
fk_idPhotographieP INT NOT NULL,   
fk_idFormatP INT NOT NULL, 
PRIMARY KEY(idPhotographiePossedeFormat),
FOREIGN KEY (fk_idPhotographieP) REFERENCES PHOTOGRAPHIE (idPhotographie),
FOREIGN KEY (fk_idFormatP) REFERENCES FORMAT (idFormat)
);