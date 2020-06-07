USE INPHOTOTHEQUE;

CREATE TABLE IF NOT EXISTS 'CLIENT'(
'idClient' INT NOT NULL,
'nomClient' VARCHAR(255) NOT NULL,
'prenomClient' VARCHAR(255) NOT NULL,
'adresseClient' VARCHAR(255) NOT NULL,
'mailClient' VARCHAR(255) NOT NULL,
PRIMARY KEY ('idClient')
);
INSERT INTO 'CLIENT' ('idClient', 'nomClient', 'prenomClient', 'adresseClient', 'mailClient') VALUES
(1, 'Guerard', 'Martin', 'rue de la montee', 'exemple@laposte.net'),
(2, 'Jean', 'Fort', 'rue du succes', 'jean@ovh.net'),
(3, 'Luc', 'Dupont', 'rue des lilas', 'example@yahoo.com'),
(4, 'Francis', 'Stross', 'place du marche', 'francis.stross@gmail.com'),
(5, 'Marie', 'Schneider', 'avenue de la paix', 'marie.schneider@yahoo.fr'),
(6, 'Jessica', 'Bost', 'bld de la victoire', 'jessica.bost@gmail.com');

CREATE TABLE IF NOT EXISTS 'FORMAT'(
'idFormat' INT(255) NOT NULL,
'nomFormat' VARCHAR(255) NOT NULL,
'quantite' INT(255) NOT NULL,
PRIMARY KEY ('idFormat')
);
INSERT INTO 'FORMAT' ('idFormat', 'nomFormat', 'quantite', ) VALUES
(1, 'standard 10x15',1),
(2, 'pleine page 20x30',1),
(3, 'simili A5 15x21',1),
(4, 'carré 20x20',1),
(5, 'Poster 30x45',1),
(6, 'Poster XL 76x100',1);

CREATE TABLE IF NOT EXISTS 'PHOTOGRAPHE'(
'idPhotographe' INT(255) NOT NULL,
'nomPhotographe' VARCHAR(255) NOT NULL,
'contactPhotographe' VARCHAR(255) NOT NULL,
PRIMARY KEY ('idPhotographe')
);
INSERT INTO 'PHOTOGRAPHE' ('idPhotographe', 'nomPhotographe', 'contactPhotographe') VALUES
(1, 'Matt Adams', 'matt.adams@contact.com'),
(2, 'Nadia Ferroukhi', 'GEO@agence.com'),
(3, 'Emmanuel Henry', 'contact@emmanuelhenry.com'),
(4, 'Thomas Pesquet','thomas.pesquet@esa.eu'),
(5, 'Melissa Hie','insta: @girleatworld'),
(6, 'Laurent Breillat','laurent@apprendre-la-photo.fr'),
(7, 'Douglas Gimesy', 'info@gimesy.com');

CREATE TABLE IF NOT EXISTS 'APPAREIL'(
'idAppareil', INT(255) NOT NULL,
'marque',VARCHAR(255) NOT NULL,
'modele',VARCHAR(255) NOT NULL,
PRIMARY KEY ('idAppareil')
);           
INSERT INTO 'APPAREIL' ('idAppareil', 'marque', 'modèle') VALUES
(1, 'Canon','EOS 1DX'),
(2, 'Olympus','OMD EM mkIII'),
(3, 'Sony','Alpha 7R'),
(4, 'Pentax','K-1 II'),
(5, 'Nikon', 'DS4'),
(6, 'Nikon', 'Z50'),
(7, 'Iphone', '9');

CREATE TABLE IF NOT EXISTS 'OBJECTIF'(
'idObjectif' INT(255) NOT NULL,
'diametre' VARCHAR(255),
'focale' VARCHAR(255),
'fk_idAppareilO' INT NOT NULL,
PRIMARY KEY ('idObjectif'),
FOREIGN KEY ('fk_idAppareilO') REFERENCES 'APPAREIL' ('idAppareil')
);
INSERT INTO 'OBJECTIF' ('idObjectif', 'diametre', 'focale', 'fk_idAppareilO') VALUES
#pour Olympus
(1, '12-50mm', 'f1:3,5-6,3'),
#pour Pentax
(2, '18-55mm', 'f/3,5-5,6' ),
#pour Nikon Z50
(3, '50mm', 'f1,8'),
#pour Nikon DS4
(4, '800mm','f/5,6'), 
#pour Sony alpha
(5, '18-105mm', 'f/4,0' ),
# Canon
(6, 'RF 24-240mm','f/4-6,3');


CREATE TABLE IF NOT EXISTS 'CATEGORIE'(
'idCategorie' INT(255) NOT NULL,
'nomCategorie' VARCHAR(255) NOT NULL,
PRIMARY KEY ('idCategorie')
);
INSERT INTO 'CATEGORIE' ('idCategorie', 'nomCategorie') VALUES
(1, 'paysage'),
(2, 'urbain'),
(3, 'portrait'),
(4, 'nature'),
(5, 'sport'),
(6, 'art'),
(7, 'animaux'),
(8, 'espace');

CREATE TABLE IF NOT EXISTS 'COMMANDE'(
'idCommande' INT(255) NOT NULL,
'dateCommande' Date,
'prixTotal' INT(255) NOT NULL,
'fk_idClientC' INT(255) NOT NULL,
PRIMARY KEY ('idCommande'),
FOREIGN KEY ('fk_idClientC') REFERENCES 'CLIENT' ('idClient')
);
(1, 2020-03-24, ,1,1),
(2, 2020-04-27, ,2,2),
(3, 2020-03-10, ,3,3),
(4, 2020-03-19, ,4,4),
(5, 2020-05-06, ,5,5),
(6, 2020-05-11, ,6,6),
(7, 2020-04-19, ,1,3),
(8, 2020-05-20, ,3,1);

CREATE TABLE IF NOT EXISTS 'SPECIFICITE'(
'idSpecificite' INT NOT NULL,
'vitesse_obturation' VARCHAR(255),
'ISO' VARCHAR(255) NOT NULL,
'fk_idPhotographieS' INT NOT NULL,
PRIMARY KEY ('idSpecificite')
);
INSERT INTO 'SPECIFICITE' ('idSpecificite', 'vitesse_obturation', 'ISO','fk_idPhotographieS') VALUES
(1, '1/8000s','2000'),
(2, '1/1000s','800'),
(3, '1/10s','400'),
(4, '1s','LOW'),
(5, '1/20s','AUTO'),
(6, '1/60s','800');

CREATE TABLE IF NOT EXISTS 'PHOTOGRAPHIE'(
'idPhotographie' INT NOT NULL,
'titrePhotographie' VARCHAR(255) NOT NULL,
'prixUnitaire' FLOAT NOT NULL,
'fk_idPhotographePhoto' INT NOT NULL,
'fk_idAppareilPhoto' INT NOT NULL,
'fk_idSpecificitePhoto' INT NOT NULL,
'fk_idCategoriePhoto' INT NOT NULL,
PRIMARY KEY ('IdPhotographie'),
FOREIGN KEY ('fk_idPhotographePhoto') REFERENCES 'PHOTOGRAPHE' ('idPhotographe'),
FOREIGN KEY ('fk_idAppareilPhoto') REFERENCES 'APPAREIL' ('idAppareil'),
FOREIGN KEY ('fk_idSpecificitePhoto') REFERENCES 'SPECIFICITE' ('idSpecificite'),
FOREIGN KEY ('fk_idCategoriePhoto') REFERENCES 'CATEGORIE' ('idCategorie')
);
INSERT INTO 'PHOTOGRAPHIE' ('idPhotographie', 'titrePhotographie', 'prixUnitaire','fk_idPhotographePhoto','fk_idAppareilPhoto', 'fk_idSpecificitePhoto', 'fk_idCategoriePhoto') VALUES
# Melissa Hi 
(1, 'sunset Boracay, White Beach, Philippines', 8.11, 5, 6, 1, 4),
# Melissa Hi 
(2, 'Plage', 1.10, 5, 7, 5, 1),
#Emmanuel Henry
(3, 'Forêt', 7.7, 3, 3, 3, 4),
# Thomas Pesquet
(4, 'Terre', 24.24, 4, 5, 1, 8),
# Matt Adams
(5, 'Portrait', 10.10, 1, 2, 2, 3),
# Douglas Gimesy
(6, 'Animal', 9999.99, 7, 5, 6, 7),
#Nadia Ferroukhi
(7, 'Paris', 17.60, 2, 1, 3, 2);

CREATE TABLE IF NOT EXISTS 'COMMANDE_CONCERNE_PHOTOGRAPHIE'(
'idCommandeConcernePhotographie' INT NOT NULL,
'fk_idCommandeComPhoto' INT NOT NULL,
'fk_idPhotographieComPhoto' INT NOT NULL,
'fk_idFormatComPhoto' INT NOT NULL,
PRIMARY KEY  ('idCommandeConcernePhotographie'),
FOREIGN KEY ('fk_idCommandeComPhoto') REFERENCES 'COMMANDE' ('idCommande'),
FOREIGN KEY ('fk_idPhotographieComPhoto') REFERENCES 'PHOTOGRAPHIE' ('idPhotographie'),
FOREIGN KEY ('fk_idFormatComPhoto') REFERENCES 'FORMAT' ('idFormat')
);
INSERT INTO 'COMMANDE_CONCERNE_PHOTOGRAPHIE'('idCommandeConcernePhotographie', 'fk_idCommandeComPhoto', 'fk_idPhotographieComPhoto', 'fk_idFormatComPhoto') VALUES
(1, 1, 4, 6),
(2, 2, 1, 2),
(3, 3, 6, 6),   
(4, 4, 2, 3),    
(5, 5, 7, 2),
(6, 6, 2, 3),   
(7, 7, 3, 1),
(8, 8, 5, 5),
);

CREATE TABLE IF NOT EXISTS 'APPAREIL_REALISE_PHOTOGRAPHIE'(
'idAppareilRealisePhotographie' INT NOT NULL,
'fk_idAppareilA' INT NOT NULL,
'fk_idPhotographieA' INT NOT NULL,
PRIMARY KEY ('idAppareilRealisePhotographie'),
FOREIGN KEY ('fk_idAppareilA') REFERENCES 'APPAREIL' ('idAppareil'),
FOREIGN KEY ('fk_idPhotographieA') REFERENCES 'PHOTOGRAPHIE' ('idPhotographie');
INSERT INTO 'APPAREIL_REALISE_PHOTOGRAPHIE'('idAppareilRealisePhotographie', 'fk_idAppareilA', 'fk_idPhotographieA') VALUES
(1, 1, 5),
(2, 2, 7),
(3, 3, 3),   
(4, 4, 5),    
(5, 5, 2),
(6, 6, 5),
(7, 7, 1),
);

CREATE TABLE IF NOT EXISTS 'PHOTOGRAPHIE_POSSEDE_FORMAT'(
'idPhotographiePossedeFormat' INT NOT NULL,
'fk_idPhotographieP' INT NOT NULL,
'fk_idFormatP' INT NOT NULL,
PRIMARY KEY ('idPhotographiePossedeFormat'),
FOREIGN KEY ('fk_idPhotographieP') REFERENCES 'PHOTOGRAPHIE' ('idPhotographie'),
FOREIGN KEY ('fk_idFormatP') REFERENCES 'FORMAT' ('idFormat')
INSERT INTO 'PHOTOGRAPHIE_POSSEDE_FORMAT'('idPhotographiePossedeFormat', 'fk_idPhotographieP', 'fk_idFormatP') VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1),   
(4, 4, 6),    
(5, 5, 5),
(6, 6, 6),
(7, 7, 2),
);
