#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: malades
#------------------------------------------------------------

CREATE TABLE malades(
        numero    Int  Auto_increment  NOT NULL ,
        nom       Varchar (50) NOT NULL ,
        adresse   Varchar (50) NOT NULL ,
        sex       Varchar (50) NOT NULL ,
        datenaiss Date NOT NULL ,
        lieunaiss Varchar (50) NOT NULL
	,CONSTRAINT malades_PK PRIMARY KEY (numero)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: feuillevo
#------------------------------------------------------------

CREATE TABLE feuillevo(
        feuille Int  Auto_increment  NOT NULL ,
        date    Date NOT NULL ,
        etat    Varchar (50) NOT NULL ,
        numero  Int NOT NULL
	,CONSTRAINT feuillevo_PK PRIMARY KEY (feuille)

	,CONSTRAINT feuillevo_malades_FK FOREIGN KEY (numero) REFERENCES malades(numero)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: chambre
#------------------------------------------------------------

CREATE TABLE chambre(
        numero  Int  Auto_increment  NOT NULL ,
        chambre Varchar (50) NOT NULL ,
        type    Varchar (50) NOT NULL
	,CONSTRAINT chambre_PK PRIMARY KEY (numero)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: departementmedikal
#------------------------------------------------------------

CREATE TABLE departementmedikal(
        numero         Int  Auto_increment  NOT NULL ,
        nom            Varchar (50) NOT NULL ,
        numero_chambre Int NOT NULL
	,CONSTRAINT departementmedikal_PK PRIMARY KEY (numero)

	,CONSTRAINT departementmedikal_chambre_FK FOREIGN KEY (numero_chambre) REFERENCES chambre(numero)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: medecins
#------------------------------------------------------------

CREATE TABLE medecins(
        numero                    Int  Auto_increment  NOT NULL ,
        nom                       Varchar (50) NOT NULL ,
        specialite                Varchar (50) NOT NULL ,
        numero_departementmedikal Int NOT NULL
	,CONSTRAINT medecins_PK PRIMARY KEY (numero)

	,CONSTRAINT medecins_departementmedikal_FK FOREIGN KEY (numero_departementmedikal) REFERENCES departementmedikal(numero)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: lits
#------------------------------------------------------------

CREATE TABLE lits(
        numero         Int  Auto_increment  NOT NULL ,
        numero_chambre Int NOT NULL ,
        numero_malades Int
	,CONSTRAINT lits_PK PRIMARY KEY (numero)

	,CONSTRAINT lits_chambre_FK FOREIGN KEY (numero_chambre) REFERENCES chambre(numero)
	,CONSTRAINT lits_malades0_FK FOREIGN KEY (numero_malades) REFERENCES malades(numero)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: suivre
#------------------------------------------------------------

CREATE TABLE suivre(
        numero          Int NOT NULL ,
        numero_medecins Int NOT NULL
	,CONSTRAINT suivre_PK PRIMARY KEY (numero,numero_medecins)

	,CONSTRAINT suivre_malades_FK FOREIGN KEY (numero) REFERENCES malades(numero)
	,CONSTRAINT suivre_medecins0_FK FOREIGN KEY (numero_medecins) REFERENCES medecins(numero)
)ENGINE=InnoDB;

