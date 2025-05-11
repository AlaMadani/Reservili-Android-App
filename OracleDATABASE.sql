--------------------------------------------------------
--  File created - Thursday-May-01-2025   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_DATE_LIEU
--------------------------------------------------------

   CREATE SEQUENCE  "PROJETSGBD"."SEQ_DATE_LIEU"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 12 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_JOKER
--------------------------------------------------------

   CREATE SEQUENCE  "PROJETSGBD"."SEQ_JOKER"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 281 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RESERVATION
--------------------------------------------------------

   CREATE SEQUENCE  "PROJETSGBD"."SEQ_RESERVATION"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 181 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table ARTISTE
--------------------------------------------------------

  CREATE TABLE "PROJETSGBD"."ARTISTE" 
   (	"IDART" NUMBER(*,0), 
	"NOMART" VARCHAR2(30 BYTE), 
	"PRENOMART" VARCHAR2(30 BYTE), 
	"SPECIALITE" VARCHAR2(10 BYTE), 
	"DESCRIPTION" VARCHAR2(500 BYTE), 
	"IMAGEURL" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table BILLET
--------------------------------------------------------

  CREATE TABLE "PROJETSGBD"."BILLET" 
   (	"IDBILLET" NUMBER(*,0), 
	"CATEGORIE" VARCHAR2(10 BYTE), 
	"PRIX" NUMBER(5,2), 
	"IDSPEC" NUMBER(*,0), 
	"VENDU" VARCHAR2(3 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CLIENT
--------------------------------------------------------

  CREATE TABLE "PROJETSGBD"."CLIENT" 
   (	"IDCLT" NUMBER(*,0), 
	"NOMCLT" VARCHAR2(10 BYTE), 
	"PRENOMCLT" VARCHAR2(10 BYTE), 
	"TEL" CHAR(8 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"MOTP" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DATE_LIEU
--------------------------------------------------------

  CREATE TABLE "PROJETSGBD"."DATE_LIEU" 
   (	"IDDATELIEU" NUMBER, 
	"IDSPEC" NUMBER, 
	"DATELIEU" DATE, 
	"IDLIEU" NUMBER, 
	"PRIXBALCON" NUMBER(6,2), 
	"PRIXGALERIE" NUMBER(6,2), 
	"PRIXORCHESTRE" NUMBER(6,2)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table LIEU
--------------------------------------------------------

  CREATE TABLE "PROJETSGBD"."LIEU" 
   (	"IDLIEU" NUMBER(*,0), 
	"NOMLIEU" VARCHAR2(30 BYTE), 
	"ADRESSE" VARCHAR2(100 BYTE), 
	"VILLE" VARCHAR2(30 BYTE), 
	"CAPACITE" NUMBER, 
	"SUPPRIMEE" VARCHAR2(10 BYTE) DEFAULT 'non'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RESERVATION
--------------------------------------------------------

  CREATE TABLE "PROJETSGBD"."RESERVATION" 
   (	"IDRES" NUMBER(*,0), 
	"IDCLT" NUMBER(*,0), 
	"IDSPEC" NUMBER(*,0), 
	"CATEGORIETCKT" VARCHAR2(10 BYTE), 
	"QTE" NUMBER(*,0), 
	"IDDATELIEU" NUMBER, 
	"PAYMENTMETHOD" VARCHAR2(20 BYTE) DEFAULT 'Carte', 
	"PRIXPAYE" NUMBER(10,2) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RUBRIQUE
--------------------------------------------------------

  CREATE TABLE "PROJETSGBD"."RUBRIQUE" 
   (	"IDRUB" NUMBER(*,0), 
	"IDSPEC" NUMBER(*,0), 
	"IDART" NUMBER(*,0), 
	"H_DEBUTR" NUMBER(4,2), 
	"DUREERUB" NUMBER(4,2), 
	"TYPER" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table SPECTACLE
--------------------------------------------------------

  CREATE TABLE "PROJETSGBD"."SPECTACLE" 
   (	"IDSPEC" NUMBER(*,0), 
	"TITRE" VARCHAR2(40 BYTE), 
	"DATES" DATE, 
	"H_DEBUT" NUMBER(4,2), 
	"DUREES" NUMBER(4,2), 
	"NBRSPECTATEUR" NUMBER(*,0), 
	"IDLIEU" NUMBER(*,0), 
	"ANNULEE" VARCHAR2(3 BYTE) DEFAULT 'non', 
	"IMAGEURL" VARCHAR2(500 BYTE), 
	"DESCRIPTION" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into PROJETSGBD.ARTISTE
SET DEFINE OFF;
Insert into PROJETSGBD.ARTISTE (IDART,NOMART,PRENOMART,SPECIALITE,DESCRIPTION,IMAGEURL) values (1,'Slim','Hedi','chanteur','Résumé de Slim Hedi, spécialiste en chanteur','https://example.com/images/artiste_1.jpg');
Insert into PROJETSGBD.ARTISTE (IDART,NOMART,PRENOMART,SPECIALITE,DESCRIPTION,IMAGEURL) values (2,'Boussida','Amira','danseur','Résumé de Boussida Amira, spécialiste en danseur','https://example.com/images/artiste_2.jpg');
Insert into PROJETSGBD.ARTISTE (IDART,NOMART,PRENOMART,SPECIALITE,DESCRIPTION,IMAGEURL) values (3,'Khemiri','Foued','acteur','Résumé de Khemiri Foued, spécialiste en acteur','https://example.com/images/artiste_3.jpg');
Insert into PROJETSGBD.ARTISTE (IDART,NOMART,PRENOMART,SPECIALITE,DESCRIPTION,IMAGEURL) values (4,'Nasri','Sahar','musicien','Résumé de Nasri Sahar, spécialiste en musicien','https://example.com/images/artiste_4.jpg');
Insert into PROJETSGBD.ARTISTE (IDART,NOMART,PRENOMART,SPECIALITE,DESCRIPTION,IMAGEURL) values (5,'Zouaoui','Chiraz','imitateur','Résumé de Zouaoui Chiraz, spécialiste en imitateur','https://example.com/images/artiste_5.jpg');
Insert into PROJETSGBD.ARTISTE (IDART,NOMART,PRENOMART,SPECIALITE,DESCRIPTION,IMAGEURL) values (6,'Ben Youssef','Hatem','humoriste','Résumé de Ben Youssef Hatem, spécialiste en humoriste','https://example.com/images/artiste_6.jpg');
Insert into PROJETSGBD.ARTISTE (IDART,NOMART,PRENOMART,SPECIALITE,DESCRIPTION,IMAGEURL) values (7,'Bouhlel','Souad','chanteur','Résumé de Bouhlel Souad, spécialiste en chanteur','https://example.com/images/artiste_7.jpg');
Insert into PROJETSGBD.ARTISTE (IDART,NOMART,PRENOMART,SPECIALITE,DESCRIPTION,IMAGEURL) values (8,'Jaziri','Karim','musicien','Résumé de Jaziri Karim, spécialiste en musicien','https://example.com/images/artiste_8.jpg');
Insert into PROJETSGBD.ARTISTE (IDART,NOMART,PRENOMART,SPECIALITE,DESCRIPTION,IMAGEURL) values (9,'Farah','Amani','acteur','Résumé de Farah Amani, spécialiste en acteur','https://example.com/images/artiste_9.jpg');
Insert into PROJETSGBD.ARTISTE (IDART,NOMART,PRENOMART,SPECIALITE,DESCRIPTION,IMAGEURL) values (10,'Mehdi','Rafik','imitateur','Résumé de Mehdi Rafik, spécialiste en imitateur','https://example.com/images/artiste_10.jpg');
REM INSERTING into PROJETSGBD.BILLET
SET DEFINE OFF;
REM INSERTING into PROJETSGBD.CLIENT
SET DEFINE OFF;
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (1,'BenAli','Ahmed','23456789','ahmed.benali@gmail.com','pass1234');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (2,'Trabelsi','Khaled','25456789','khaled.trabelsi@yahoo.com','khaled12');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (3,'Jaziri','Mohamed','21456789','mohamed.jaziri@hotmail.com','moham123');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (4,'Chaabane','Fatma','29456789','fatma.chaabane@gmail.com','chaabane');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (5,'Slimani','Sarra','26456789','sarra.slimani@yahoo.com','slimani1');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (202,'Dupont','Jean','99345678','jean.dupont@example.com','0');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (203,'ala','ala','56333222','ala@gmail.com','0');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (227,'Dupont','Alice','22345678','alice.dupont@example.com','monMot');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (235,'e','e','22345678','e@gmail.com','1425');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (236,'msaddak','mourad','55555555','mourad@gmail.com','1425');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (238,'Dupont','Jean','56555656','jean.dupont@example.com','0');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (240,'Thabet','Dhia','53893870','mohamaddhia@gmail.com','0');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (241,'p','p','20020222','alamadani2002@gmail.com','0');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (242,'j','j','23222555','alamadani2002@gmail.com','0');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (261,'hi','hello','55666396','a@gmail.com','0');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (262,'b','a','26333555','a@gmail.com','0');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (263,'w','e','55636982','t@gmail.com','0');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (161,'ttt','ttt','99999999','guizani@gmail.com','lllllll');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (131,'Madani','Ala Eddine','26380131','alemedeni0@gmail.com','azerty');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (133,'phone','phone','23130766','hey@gmail.com','12345');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (141,'nsj','jsjdj','53893870','dhia@gmail.com','0000');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (134,'chebel','youssef','22222222','youssef@gmail.com','aaaa');
Insert into PROJETSGBD.CLIENT (IDCLT,NOMCLT,PRENOMCLT,TEL,EMAIL,MOTP) values (181,'g','gh','23811363','gh@gmail.com','fgggg');
REM INSERTING into PROJETSGBD.DATE_LIEU
SET DEFINE OFF;
Insert into PROJETSGBD.DATE_LIEU (IDDATELIEU,IDSPEC,DATELIEU,IDLIEU,PRIXBALCON,PRIXGALERIE,PRIXORCHESTRE) values (1,76,to_date('10-JAN-25','DD-MON-RR'),38,16.99,10.71,67.13);
Insert into PROJETSGBD.DATE_LIEU (IDDATELIEU,IDSPEC,DATELIEU,IDLIEU,PRIXBALCON,PRIXGALERIE,PRIXORCHESTRE) values (2,77,to_date('15-JAN-25','DD-MON-RR'),39,19.27,20.37,82.2);
Insert into PROJETSGBD.DATE_LIEU (IDDATELIEU,IDSPEC,DATELIEU,IDLIEU,PRIXBALCON,PRIXGALERIE,PRIXORCHESTRE) values (3,78,to_date('20-JAN-25','DD-MON-RR'),40,25.46,20.21,22.21);
Insert into PROJETSGBD.DATE_LIEU (IDDATELIEU,IDSPEC,DATELIEU,IDLIEU,PRIXBALCON,PRIXGALERIE,PRIXORCHESTRE) values (4,79,to_date('25-JAN-25','DD-MON-RR'),41,35.35,23.72,30.6);
Insert into PROJETSGBD.DATE_LIEU (IDDATELIEU,IDSPEC,DATELIEU,IDLIEU,PRIXBALCON,PRIXGALERIE,PRIXORCHESTRE) values (5,80,to_date('11-MAR-25','DD-MON-RR'),42,31.72,15.68,65.97);
Insert into PROJETSGBD.DATE_LIEU (IDDATELIEU,IDSPEC,DATELIEU,IDLIEU,PRIXBALCON,PRIXGALERIE,PRIXORCHESTRE) values (6,81,to_date('05-FEB-25','DD-MON-RR'),43,13.82,22.61,85.45);
Insert into PROJETSGBD.DATE_LIEU (IDDATELIEU,IDSPEC,DATELIEU,IDLIEU,PRIXBALCON,PRIXGALERIE,PRIXORCHESTRE) values (7,82,to_date('10-FEB-25','DD-MON-RR'),44,26.38,24.66,22.84);
Insert into PROJETSGBD.DATE_LIEU (IDDATELIEU,IDSPEC,DATELIEU,IDLIEU,PRIXBALCON,PRIXGALERIE,PRIXORCHESTRE) values (8,83,to_date('15-FEB-25','DD-MON-RR'),45,49.99,11.12,28.3);
Insert into PROJETSGBD.DATE_LIEU (IDDATELIEU,IDSPEC,DATELIEU,IDLIEU,PRIXBALCON,PRIXGALERIE,PRIXORCHESTRE) values (9,84,to_date('20-FEB-25','DD-MON-RR'),46,22.03,9.05,24.86);
Insert into PROJETSGBD.DATE_LIEU (IDDATELIEU,IDSPEC,DATELIEU,IDLIEU,PRIXBALCON,PRIXGALERIE,PRIXORCHESTRE) values (10,85,to_date('25-FEB-25','DD-MON-RR'),47,46.81,23.66,75.52);
Insert into PROJETSGBD.DATE_LIEU (IDDATELIEU,IDSPEC,DATELIEU,IDLIEU,PRIXBALCON,PRIXGALERIE,PRIXORCHESTRE) values (11,95,to_date('10-JAN-25','DD-MON-RR'),39,18.69,19.85,94.7);
Insert into PROJETSGBD.DATE_LIEU (IDDATELIEU,IDSPEC,DATELIEU,IDLIEU,PRIXBALCON,PRIXGALERIE,PRIXORCHESTRE) values (12,76,to_date('09-JAN-24','DD-MON-RR'),40,28.81,29.93,29.23);
REM INSERTING into PROJETSGBD.LIEU
SET DEFINE OFF;
Insert into PROJETSGBD.LIEU (IDLIEU,NOMLIEU,ADRESSE,VILLE,CAPACITE,SUPPRIMEE) values (38,'Théâtre de Carthage','Rue de Carthage','Tunis',1700,'non');
Insert into PROJETSGBD.LIEU (IDLIEU,NOMLIEU,ADRESSE,VILLE,CAPACITE,SUPPRIMEE) values (39,'Maison de la Culture','Avenue Habib Bourguiba','Sousse',1200,'non');
Insert into PROJETSGBD.LIEU (IDLIEU,NOMLIEU,ADRESSE,VILLE,CAPACITE,SUPPRIMEE) values (40,'Palais des Congrès','Boulevard Mohamed V','Tunis',2000,'non');
Insert into PROJETSGBD.LIEU (IDLIEU,NOMLIEU,ADRESSE,VILLE,CAPACITE,SUPPRIMEE) values (41,'Centre Culturel','Route de Monastir','Monastir',800,'oui');
Insert into PROJETSGBD.LIEU (IDLIEU,NOMLIEU,ADRESSE,VILLE,CAPACITE,SUPPRIMEE) values (42,'Salle El Menzah','Cité Olympique','Tunis',1900,'non');
Insert into PROJETSGBD.LIEU (IDLIEU,NOMLIEU,ADRESSE,VILLE,CAPACITE,SUPPRIMEE) values (43,'Salle Polyvalente','Centre Urbain Nord','Ariana',1600,'non');
Insert into PROJETSGBD.LIEU (IDLIEU,NOMLIEU,ADRESSE,VILLE,CAPACITE,SUPPRIMEE) values (44,'Théâtre Municipal','Place du Théâtre','Sfax',1400,'non');
Insert into PROJETSGBD.LIEU (IDLIEU,NOMLIEU,ADRESSE,VILLE,CAPACITE,SUPPRIMEE) values (45,'Espace Culturel','Rue de l''Indépendance','Gabès',1000,'non');
Insert into PROJETSGBD.LIEU (IDLIEU,NOMLIEU,ADRESSE,VILLE,CAPACITE,SUPPRIMEE) values (46,'Amphithéâtre Romain','El Jem','Mahdia',1800,'non');
Insert into PROJETSGBD.LIEU (IDLIEU,NOMLIEU,ADRESSE,VILLE,CAPACITE,SUPPRIMEE) values (47,'Théâtre Plein Air','Rue Farhat Hached','Hammamet',1200,'non');
REM INSERTING into PROJETSGBD.RESERVATION
SET DEFINE OFF;
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (101,1,76,'Orchestre',10,1,'Espèces',671.3);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (103,202,77,'Orchestre',2,1,'carte_bancaire',150);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (104,203,77,'Balcon',3,2,'Solde Telephonique',57.81);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (121,236,77,'Balcon',3,2,'Solde Telephonique',57.81);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (122,1,78,'Galerie',2,3,'Solde Telephonique',40.42);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (130,238,76,'Orchestre',2,10,'Carte bancaire',120.5);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (132,1,77,'Orchestre',2,2,'Carte bancaire',120.5);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (140,131,95,'Balcon',2,11,'Solde Telephonique',37.38);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (141,131,77,'Galerie',3,2,'Solde Telephonique',61.11);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (142,131,83,'Orchestre',1,8,'Carte Bancaire',28.3);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (143,240,95,'Orchestre',3,11,'Carte Bancaire',284.1);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (144,241,77,'Balcon',2,2,'Carte Bancaire',38.54);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (145,242,77,'Galerie',1,2,'Solde Telephonique',20.37);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (161,261,77,'Galerie',2,2,'Solde Telephonique',40.74);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (162,262,82,'Balcon',1,7,'Carte Bancaire',26.38);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (163,263,77,'Balcon',3,2,'Solde Telephonique',57.81);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (61,134,77,'Balcon',2,2,'Carte',0);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (62,161,77,'Orchestre',1,2,'Carte',0);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (17,131,76,'Orchestre',1,1,'Carte',0);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (18,131,76,'Orchestre',1,1,'Carte',0);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (19,131,81,'Orchestre',1,6,'Carte',0);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (20,131,79,'Orchestre',1,4,'Carte',0);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (21,133,85,'Galerie',5,10,'Carte',0);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (15,131,80,'Orchestre',3,5,'Carte',0);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (16,131,77,'Balcon',1,2,'Carte',0);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (41,141,76,'Orchestre',1,1,'Carte',0);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (22,134,76,'Orchestre',2,1,'Carte',0);
Insert into PROJETSGBD.RESERVATION (IDRES,IDCLT,IDSPEC,CATEGORIETCKT,QTE,IDDATELIEU,PAYMENTMETHOD,PRIXPAYE) values (81,181,80,'Orchestre',1,5,'Carte',0);
REM INSERTING into PROJETSGBD.RUBRIQUE
SET DEFINE OFF;
Insert into PROJETSGBD.RUBRIQUE (IDRUB,IDSPEC,IDART,H_DEBUTR,DUREERUB,TYPER) values (96,76,1,20,1.5,'musique');
Insert into PROJETSGBD.RUBRIQUE (IDRUB,IDSPEC,IDART,H_DEBUTR,DUREERUB,TYPER) values (97,76,2,21.5,1.5,'dance');
Insert into PROJETSGBD.RUBRIQUE (IDRUB,IDSPEC,IDART,H_DEBUTR,DUREERUB,TYPER) values (98,77,3,18.3,1,'comedie');
Insert into PROJETSGBD.RUBRIQUE (IDRUB,IDSPEC,IDART,H_DEBUTR,DUREERUB,TYPER) values (99,77,4,19.3,1.3,'musique');
Insert into PROJETSGBD.RUBRIQUE (IDRUB,IDSPEC,IDART,H_DEBUTR,DUREERUB,TYPER) values (100,78,5,21,1.5,'imitation');
Insert into PROJETSGBD.RUBRIQUE (IDRUB,IDSPEC,IDART,H_DEBUTR,DUREERUB,TYPER) values (101,80,7,22,2,'musique');
Insert into PROJETSGBD.RUBRIQUE (IDRUB,IDSPEC,IDART,H_DEBUTR,DUREERUB,TYPER) values (103,82,9,19.3,2,'comedie');
Insert into PROJETSGBD.RUBRIQUE (IDRUB,IDSPEC,IDART,H_DEBUTR,DUREERUB,TYPER) values (104,83,10,18,2,'théatre');
Insert into PROJETSGBD.RUBRIQUE (IDRUB,IDSPEC,IDART,H_DEBUTR,DUREERUB,TYPER) values (108,81,8,20,1.5,'musique');
REM INSERTING into PROJETSGBD.SPECTACLE
SET DEFINE OFF;
Insert into PROJETSGBD.SPECTACLE (IDSPEC,TITRE,DATES,H_DEBUT,DUREES,NBRSPECTATEUR,IDLIEU,ANNULEE,IMAGEURL,DESCRIPTION) values (76,'Mélodies Carthaginoises',to_date('10-JAN-25','DD-MON-RR'),20,3,1200,38,'non','https://upload.wikimedia.org/wikipedia/commons/e/e1/Festival_de_Carthage_au_th%C3%A9atre_romain.JPG','Un voyage musical à travers les anciennes mélodies de Carthage, interprétées avec passion et virtuosité.');
Insert into PROJETSGBD.SPECTACLE (IDSPEC,TITRE,DATES,H_DEBUT,DUREES,NBRSPECTATEUR,IDLIEU,ANNULEE,IMAGEURL,DESCRIPTION) values (77,'Danses Tunisiennes',to_date('15-JAN-25','DD-MON-RR'),18.3,2.5,800,39,'oui','http://voyage-tunisie.info/wp-content/uploads/2018/01/Festival-International-de-Sousse-Tunisie4.jpg','Un spectacle haut en couleur mettant en valeur la richesse des danses traditionnelles tunisiennes.');
Insert into PROJETSGBD.SPECTACLE (IDSPEC,TITRE,DATES,H_DEBUT,DUREES,NBRSPECTATEUR,IDLIEU,ANNULEE,IMAGEURL,DESCRIPTION) values (78,'Humour du Sud',to_date('20-JAN-25','DD-MON-RR'),21,1.5,500,40,'non','https://d1k4bi32qf3nf2.cloudfront.net/product/2023/10/notre_dame_de_paris_comedie_musicale_spectacle_photo_1_1698663612.jpg','Un show comique inspiré des accents, coutumes et anecdotes typiques du sud tunisien.');
Insert into PROJETSGBD.SPECTACLE (IDSPEC,TITRE,DATES,H_DEBUT,DUREES,NBRSPECTATEUR,IDLIEU,ANNULEE,IMAGEURL,DESCRIPTION) values (79,'Nuit des Imitateurs',to_date('25-JAN-25','DD-MON-RR'),19,2,700,41,'non','http://kapitalis.com/tunisie/wp-content/uploads/2020/01/Ahmed-Laajimi.jpg','Des imitateurs talentueux vous feront rire aux éclats lors d’une soirée pleine de surprises et de bonne humeur.');
Insert into PROJETSGBD.SPECTACLE (IDSPEC,TITRE,DATES,H_DEBUT,DUREES,NBRSPECTATEUR,IDLIEU,ANNULEE,IMAGEURL,DESCRIPTION) values (80,'Acteurs de la Scène',to_date('11-MAR-25','DD-MON-RR'),22,2.5,1000,42,'non','https://www.webdo.tn/assets/uploads/files//Sans%20titre2(22).jpeg','Un hommage au théâtre vivant avec des prestations captivantes de comédiens reconnus.');
Insert into PROJETSGBD.SPECTACLE (IDSPEC,TITRE,DATES,H_DEBUT,DUREES,NBRSPECTATEUR,IDLIEU,ANNULEE,IMAGEURL,DESCRIPTION) values (81,'Festival de Monastir',to_date('05-FEB-25','DD-MON-RR'),20,3,1500,43,'non','http://www.tunisienumerique.com/wp-content/uploads/2021/06/festival-de-carthage.png','Un événement artistique majeur réunissant musique, danse et culture dans la belle ville de Monastir.');
Insert into PROJETSGBD.SPECTACLE (IDSPEC,TITRE,DATES,H_DEBUT,DUREES,NBRSPECTATEUR,IDLIEU,ANNULEE,IMAGEURL,DESCRIPTION) values (82,'Jazz à Hammamet',to_date('10-FEB-25','DD-MON-RR'),19.3,3.5,1400,44,'non','http://www.challenges.tn/wp-content/uploads/2016/07/Ibrahim-Maalouf-Festival-International-de-Hammamet-2016-challenges-tn-05.jpg','Une soirée envoûtante au rythme du jazz, dans le cadre idyllique de Hammamet.');
Insert into PROJETSGBD.SPECTACLE (IDSPEC,TITRE,DATES,H_DEBUT,DUREES,NBRSPECTATEUR,IDLIEU,ANNULEE,IMAGEURL,DESCRIPTION) values (83,'Rythmes du Sahel',to_date('15-FEB-25','DD-MON-RR'),18,2,900,45,'non','http://voyage-tunisie.info/wp-content/uploads/2018/01/Festival-International-de-la-Musique-Symphonique-d%E2%80%99El-Jem-Tunisie.4-800x500.jpg','Une immersion musicale aux sons typiques et entraînants du Sahel tunisien.');
Insert into PROJETSGBD.SPECTACLE (IDSPEC,TITRE,DATES,H_DEBUT,DUREES,NBRSPECTATEUR,IDLIEU,ANNULEE,IMAGEURL,DESCRIPTION) values (84,'Concert à El Jem',to_date('20-FEB-25','DD-MON-RR'),21.3,4,1760,46,'non','https://upload.wikimedia.org/wikipedia/commons/2/25/Festival_el_jem.JPG','Un concert exceptionnel dans l’amphithéâtre romain d’El Jem, alliant histoire et modernité musicale.');
Insert into PROJETSGBD.SPECTACLE (IDSPEC,TITRE,DATES,H_DEBUT,DUREES,NBRSPECTATEUR,IDLIEU,ANNULEE,IMAGEURL,DESCRIPTION) values (85,'Show à Sfax',to_date('25-FEB-25','DD-MON-RR'),22,2.5,1115,47,'non','http://kapitalis.com/tunisie/wp-content/uploads/2024/02/Carmen-Opera-Theatre-de-Tunis.jpg','Un show spectaculaire à Sfax, entre jeux de lumière, sons vibrants et ambiance festive.');
Insert into PROJETSGBD.SPECTACLE (IDSPEC,TITRE,DATES,H_DEBUT,DUREES,NBRSPECTATEUR,IDLIEU,ANNULEE,IMAGEURL,DESCRIPTION) values (95,'Mélodies Carthaginoises---1',to_date('10-JAN-25','DD-MON-RR'),20,3,600,39,'non','http://www.destinationtunisie.info/wp-content/uploads/2023/08/festival-carthage-trio-taksim.jpg','Une autre édition enchanteresse dédiée aux sons classiques inspirés par l’héritage de Carthage.');
--------------------------------------------------------
--  DDL for Index IDX_NOMARTI
--------------------------------------------------------

  CREATE INDEX "PROJETSGBD"."IDX_NOMARTI" ON "PROJETSGBD"."ARTISTE" ("NOMART") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_SPEC_TITRE
--------------------------------------------------------

  CREATE INDEX "PROJETSGBD"."IDX_SPEC_TITRE" ON "PROJETSGBD"."SPECTACLE" ("TITRE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_RUB_IDART
--------------------------------------------------------

  CREATE INDEX "PROJETSGBD"."IDX_RUB_IDART" ON "PROJETSGBD"."RUBRIQUE" ("IDART") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_CHERCHER_LIEU
--------------------------------------------------------

  CREATE INDEX "PROJETSGBD"."IDX_CHERCHER_LIEU" ON "PROJETSGBD"."LIEU" ("NOMLIEU", "VILLE", "CAPACITE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDX_RUB_IDSPEC
--------------------------------------------------------

  CREATE INDEX "PROJETSGBD"."IDX_RUB_IDSPEC" ON "PROJETSGBD"."RUBRIQUE" ("IDSPEC") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger TRG_CHECK_DATES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "PROJETSGBD"."TRG_CHECK_DATES" 
BEFORE INSERT OR UPDATE OF DATES ON SPECTACLE
FOR EACH ROW
BEGIN
    IF :NEW.dateS <= SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20001, 'il faut que la date du spectacle soit dans le futur');
    END IF;
END;
/
ALTER TRIGGER "PROJETSGBD"."TRG_CHECK_DATES" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_UPDATE_RUBRIQUE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "PROJETSGBD"."TRG_UPDATE_RUBRIQUE" 
AFTER UPDATE ON SPECTACLE
FOR EACH ROW
DECLARE
diff NUMBER;
duro NUMBER;
BEGIN
    IF :NEW.h_debut IS NOT NULL AND :OLD.h_debut != :NEW.h_debut THEN
            diff := :NEW.h_debut - :OLD.h_debut;
            UPDATE RUBRIQUE
            SET H_debutR = H_debutR + diff
            WHERE idSpec = :NEW.idSpec;
    END IF;

    IF :NEW.dureeS IS NOT NULL AND :OLD.dureeS != :NEW.dureeS THEN
            SELECT dureeS INTO duro FROM SPECTACLE WHERE idSpec = :NEW.idSpec;
            UPDATE RUBRIQUE
            SET dureeRub = dureeRub + (dureeRub / duro) * (:NEW.dureeS - duro)
            WHERE idSpec = :NEW.idSpec;
    END IF;
END TRG_UPDATE_RUBRIQUE;
/
ALTER TRIGGER "PROJETSGBD"."TRG_UPDATE_RUBRIQUE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGVERIFARTISTE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "PROJETSGBD"."TRIGVERIFARTISTE" 
BEFORE INSERT OR UPDATE OF idArt ON RUBRIQUE
FOR EACH ROW
DECLARE
Vnb NUMBER;
BEGIN 
SELECT COUNT(*) INTO Vnb
FROM RUBRIQUE R,SPECTACLE S
WHERE R.idSpec=S.idSpec AND S.idSpec = :NEW.idSpec AND ((R.H_debutR BETWEEN :NEW.H_debutR AND (:NEW.H_debutR + :NEW.dureeRub))OR
(R.H_debutR+R.dureeRub BETWEEN :NEW.H_debutR AND(:NEW.H_debutR+:NEW.dureeRub)))AND R.idArt=:NEW.idArt;
IF (Vnb > 0) THEN
RAISE_APPLICATION_ERROR(-20105,'Cette Artiste n''est pas disponible a la date de cette rubrique');
END IF;
END;
/
ALTER TRIGGER "PROJETSGBD"."TRIGVERIFARTISTE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGVERIFDATERUB
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "PROJETSGBD"."TRIGVERIFDATERUB" 
BEFORE INSERT OR UPDATE OF H_debutR,dureeRub ON RUBRIQUE
FOR EACH ROW
DECLARE
Vhs SPECTACLE.h_debut%TYPE;
Vds SPECTACLE.dureeS%TYPE;
Vdt RUBRIQUE.dureeRub%TYPE;
BEGIN
SELECT h_debut,dureeS INTO Vhs,Vds
FROM SPECTACLE
WHERE idSpec = :NEW.idSpec;
SELECT SUM(dureeRub) INTO Vdt
FROM RUBRIQUE
WHERE idSpec = :NEW.idSpec;
IF (Vdt IS NULL) THEN
Vdt:=0;
END IF;
IF(Vhs > :NEW.H_debutR OR Vds < :NEW.dureeRub + Vdt) THEN
RAISE_APPLICATION_ERROR(-20104,'Heure de rubrique ou duree ne s"accorde pas avec le spectacle');
END IF;
END;
/
ALTER TRIGGER "PROJETSGBD"."TRIGVERIFDATERUB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGVERIFLIEU
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "PROJETSGBD"."TRIGVERIFLIEU" 
BEFORE INSERT OR UPDATE OF idLieu ON SPECTACLE
FOR EACH ROW
DECLARE
Vnb NUMBER;
BEGIN
SELECT COUNT(*) INTO Vnb
FROM SPECTACLE
WHERE idLieu=:NEW.idLieu AND dateS=:NEW.dateS;
IF(Vnb > 0) THEN
RAISE_APPLICATION_ERROR(-20102,'Le lieu est déjà réservé à cette date');
END IF;
END;
/
ALTER TRIGGER "PROJETSGBD"."TRIGVERIFLIEU" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGVERIFNBRUB
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "PROJETSGBD"."TRIGVERIFNBRUB" 
BEFORE INSERT OR UPDATE OF idSpec ON RUBRIQUE
FOR EACH ROW
DECLARE
Vnb NUMBER;
BEGIN
SELECT COUNT(*) INTO Vnb
FROM RUBRIQUE
WHERE idSpec=:NEW.idSpec;
IF (Vnb = 3) THEN
RAISE_APPLICATION_ERROR(-20103,'Un spectacle ne peut pas avoir plus de 3 rubriques');
END IF;
END;
/
ALTER TRIGGER "PROJETSGBD"."TRIGVERIFNBRUB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRIGVERIFNBSPECTATEURS
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "PROJETSGBD"."TRIGVERIFNBSPECTATEURS" 
BEFORE INSERT OR UPDATE OF nbrSpectateur ON SPECTACLE
FOR EACH ROW
DECLARE
Vcap Lieu.capacite%TYPE;
BEGIN
SELECT capacite INTO Vcap
FROM Lieu 
WHERE idLieu = :NEW.idLieu;
IF Vcap < :NEW.nbrSpectateur THEN
RAISE_APPLICATION_ERROR (-20101,'Le nombre de spectateurs prévus dépasse la capacité du lieu');
END IF;
EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE_APPLICATION_ERROR(-20001, 'Le lieu spécifié n''existe pas.');
END;
/
ALTER TRIGGER "PROJETSGBD"."TRIGVERIFNBSPECTATEURS" ENABLE;
--------------------------------------------------------
--  DDL for Package GESTION_LIEUX
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "PROJETSGBD"."GESTION_LIEUX" IS
PROCEDURE P_AjouterLieu(nomm Lieu.NomLieu%TYPE,adr Lieu.Adresse%TYPE,
vil Lieu.ville%TYPE,cap Lieu.capacite%TYPE,s Lieu.supprimee%TYPE DEFAULT 'non');
PROCEDURE P_ModifierLieu(idl INTEGER,nom VARCHAR DEFAULT NULL,cap NUMBER DEFAULT NULL);
PROCEDURE P_ChercherLieu(nom VARCHAR2 DEFAULT NULL,Vil VARCHAR2 DEFAULT NULL,
cap NUMBER DEFAULT NULL);
PROCEDURE P_SupprimerLieu(idl INTEGER);
END Gestion_Lieux;

/
--------------------------------------------------------
--  DDL for Package GESTION_SPECTACLES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE "PROJETSGBD"."GESTION_SPECTACLES" IS
PROCEDURE P_AjouterSpec(titre VARCHAR,dates DATE,h_debutS NUMBER,
duree NUMBER,nbrspec INTEGER,idl INTEGER);
PROCEDURE P_AnnulerSpec(ids INTEGER);
PROCEDURE P_ModifierSpec(ids INTEGER,titr VARCHAR DEFAULT NULL,
dat DATE DEFAULT NULL,h_debutS NUMBER DEFAULT NULL,dur NUMBER DEFAULT NULL,
nbrspec INTEGER DEFAULT NULL,idl INTEGER DEFAULT NULL);
PROCEDURE P_CherecherSpecID(ids INTEGER);
PROCEDURE P_CherecherSpecT(titr VARCHAR);
PROCEDURE P_AjouterRub(idSpec INTEGER, idArt INTEGER, H_debutR NUMBER, 
dureeRub NUMBER,typeR VARCHAR2);
PROCEDURE P_ModifierRub(idRubr INTEGER, idArti INTEGER DEFAULT NULL,
dureRub NUMBER DEFAULT NULL, HdebutR NUMBER DEFAULT NULL);
PROCEDURE P_SupprimerRub(idRubr INTEGER);
PROCEDURE P_ChercherRub(ids INTEGER DEFAULT NULL, nomArti VARCHAR2 DEFAULT NULL);
END Gestion_Spectacles;

/
--------------------------------------------------------
--  DDL for Package Body GESTION_LIEUX
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "PROJETSGBD"."GESTION_LIEUX" AS
PROCEDURE P_AjouterLieu(nomm Lieu.NomLieu%TYPE,adr Lieu.Adresse%TYPE,vil Lieu.ville%TYPE,cap Lieu.capacite%TYPE,s Lieu.supprimee%TYPE DEFAULT 'non')IS
BEGIN
INSERT INTO Lieu (idLieu,NomLieu,Adresse,ville,capacite,supprimee) VALUES (SEQ_JOKER.NEXTVAL,nomm,adr,vil,cap,s);
END P_AjouterLieu;

PROCEDURE P_ModifierLieu(idl INTEGER,nom VARCHAR DEFAULT NULL,cap NUMBER DEFAULT NULL)IS
Vnb NUMBER;
errup EXCEPTION;
BEGIN
IF (nom IS NULL AND cap IS NOT NULL)THEN 
UPDATE Lieu SET capacite=cap WHERE idLieu=idl;
ELSIF(nom IS NOT NULL AND cap IS NULL) THEN
UPDATE Lieu SET NomLieu=nom WHERE idLieu=idl;
END IF;
Vnb:=SQL%ROWCOUNT;
IF(Vnb=0)THEN
RAISE errup;
END IF;
EXCEPTION
WHEN errup THEN
DBMS_OUTPUT.PUT_LINE('AUCUN LIEU AVEC L''ID: '||idl);
END P_ModifierLieu;

PROCEDURE P_ChercherLieu(nom VARCHAR2 DEFAULT NULL,Vil VARCHAR2 DEFAULT NULL,cap NUMBER DEFAULT NULL)IS
CURSOR CurListLieu IS
 SELECT *
 FROM Lieu
 WHERE (nom IS NULL OR NomLieu = nom)
 AND (Ville IS NULL OR ville = Vil)
 AND (cap IS NULL OR capacite = cap)
 AND supprimee='non';
Vcur CurListLieu%ROWTYPE;
Vnb NUMBER;
errlieu EXCEPTION;
BEGIN
OPEN CurListLieu;
DBMS_OUTPUT.PUT_LINE('idLieu       NomLieu       Adresse       Ville       Capacite        supprimee');
LOOP
FETCH CurListLieu INTO Vcur;
EXIT WHEN CurListLieu%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(Vcur.idLieu||'       '||Vcur.NomLieu||'       '||Vcur.Adresse||'       '||Vcur.ville||'       '||Vcur.capacite||'       '||Vcur.supprimee);
END LOOP;
Vnb:=CurListLieu%ROWCOUNT;
CLOSE CurListLieu;
IF(Vnb=0)THEN
RAISE errlieu;
END IF;
EXCEPTION
WHEN errlieu THEN
DBMS_OUTPUT.PUT_LINE('AUCUN LIEU AVEC CE(S) CRITERE(S)');
END P_ChercherLieu;

PROCEDURE P_SupprimerLieu(idl INTEGER)IS
Vnb  NUMBER;
BEGIN
SELECT COUNT(*) INTO Vnb
FROM SPECTACLE
WHERE idLieu=idl;
IF (Vnb=0) THEN
DELETE FROM Lieu
WHERE idLieu=idl;
DBMS_OUTPUT.PUT_LINE('Lieu supprimé physiquement');
ELSE
UPDATE Lieu
SET supprimee='oui'
WHERE idLieu=idl;
END IF;
END P_SupprimerLieu;
END Gestion_Lieux;

/
--------------------------------------------------------
--  DDL for Package Body GESTION_SPECTACLES
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE PACKAGE BODY "PROJETSGBD"."GESTION_SPECTACLES" AS
PROCEDURE P_AjouterSpec(titre VARCHAR,dates DATE,h_debutS NUMBER,duree NUMBER,nbrspec INTEGER,idl INTEGER)IS
BEGIN
INSERT INTO SPECTACLE VALUES(SEQ_JOKER.NEXTVAL,titre,dates,h_debutS,duree,nbrspec,idl,'non');
END P_AjouterSpec;

PROCEDURE P_AnnulerSpec(ids INTEGER)IS
BEGIN
UPDATE SPECTACLE SET annulee='oui' WHERE idSpec=ids;
END P_AnnulerSpec;


PROCEDURE P_ModifierSpec(
    ids INTEGER,
    titr VARCHAR DEFAULT NULL,
    dat DATE DEFAULT NULL,
    h_debutS NUMBER DEFAULT NULL,
    dur NUMBER DEFAULT NULL,
    nbrspec INTEGER DEFAULT NULL,
    idl INTEGER DEFAULT NULL
) IS
    errpar EXCEPTION;
    errd EXCEPTION;
BEGIN
    IF titr IS NULL AND dat IS NULL AND h_debutS IS NULL 
       AND dur IS NULL AND nbrspec IS NULL AND idl IS NULL THEN
        RAISE errpar;
    END IF;


    IF titr IS NOT NULL THEN
        UPDATE SPECTACLE
        SET Titre = titr
        WHERE idSpec = ids;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE errd;
        END IF;
    END IF;

    IF dat IS NOT NULL THEN
        UPDATE SPECTACLE
        SET dateS = dat
        WHERE idSpec = ids;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE errd;
        END IF;
    END IF;

    IF h_debutS IS NOT NULL THEN
        UPDATE SPECTACLE
        SET h_debut = h_debutS
        WHERE idSpec = ids;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE errd;
        END IF;
    END IF;

    IF dur IS NOT NULL THEN
        UPDATE SPECTACLE
        SET dureeS = dur
        WHERE idSpec = ids;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE errd;
        END IF;
    END IF;

    IF nbrspec IS NOT NULL THEN
        UPDATE SPECTACLE
        SET nbrSpectateur = nbrspec
        WHERE idSpec = ids;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE errd;
        END IF;
    END IF;

    IF idl IS NOT NULL THEN
        UPDATE SPECTACLE
        SET idLieu = idl
        WHERE idSpec = ids;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE errd;
        END IF;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Modification réussie');

EXCEPTION
    WHEN errpar THEN
        DBMS_OUTPUT.PUT_LINE('AUCUN DONNEES A MODIFIER');
    WHEN errd OR NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('AUCUN SPECTACLE AVEC L''ID ' || ids);
END P_ModifierSpec;




PROCEDURE P_CherecherSpecID(ids INTEGER)IS
Vspec SPECTACLE%ROWTYPE;
BEGIN
SELECT * INTO Vspec             
FROM SPECTACLE 
WHERE idSpec=ids AND dureeS IS NOT NULL;
DBMS_OUTPUT.PUT_LINE('ids    titre    dates    h_debutS    duree    nbrspec    idl');
DBMS_OUTPUT.PUT_LINE(Vspec.idSpec||'    '||Vspec.Titre||'    '||Vspec.dateS||'    '
||Vspec.h_debut||'    '||Vspec.dureeS||'    '||Vspec.nbrSpectateur||'    '||Vspec.idLieu);
EXCEPTION
 WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('AUCUN SPECTACLE AVEC L''ID '||ids);
END P_CherecherSpecID;



PROCEDURE P_CherecherSpecT(titr VARCHAR)IS
Vspec SPECTACLE%ROWTYPE;
BEGIN
SELECT * INTO Vspec    
FROM SPECTACLE 
WHERE Titre=titr;
DBMS_OUTPUT.PUT_LINE('ids    titre    dates    h_debutS    duree    nbrspec    idl');
DBMS_OUTPUT.PUT_LINE(Vspec.idSpec||'    '||Vspec.Titre||'    '||Vspec.dateS||'    '
||Vspec.h_debut||'    '||Vspec.dureeS||'    '||Vspec.nbrSpectateur||'    '||Vspec.idLieu);
IF (Vspec.Annulee = 'oui') THEN
DBMS_OUTPUT.PUT_LINE('Ce spectacle est anulee!!!');
END IF;
EXCEPTION
 WHEN NO_DATA_FOUND THEN
     DBMS_OUTPUT.PUT_LINE('AUCUN SPECTACLE AVEC LE TITRE '||titr);
END P_CherecherSpecT;





PROCEDURE P_AjouterRub(idSpec INTEGER, idArt INTEGER, H_debutR NUMBER, dureeRub NUMBER,typeR VARCHAR2 )IS
BEGIN
INSERT INTO RUBRIQUE VALUES(SEQ_JOKER.NEXTVAL,idSpec,idArt,H_debutR,dureeRub,typeR);
END P_AjouterRub;

PROCEDURE P_ModifierRub(
    idRubr INTEGER, 
    idArti INTEGER DEFAULT NULL,
    dureRub NUMBER DEFAULT NULL, 
    HdebutR NUMBER DEFAULT NULL
) IS
    errpar EXCEPTION;
    errd EXCEPTION;
BEGIN

    IF idArti IS NULL AND dureRub IS NULL AND HdebutR IS NULL THEN
        RAISE errpar;
    END IF;


    IF idArti IS NOT NULL THEN
        UPDATE RUBRIQUE
        SET idArt = idArti
        WHERE idRub = idRubr;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE errd;
        END IF;
    END IF;

    IF dureRub IS NOT NULL THEN
        UPDATE RUBRIQUE
        SET dureeRub = dureRub
        WHERE idRub = idRubr;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE errd;
        END IF;
    END IF;

    IF HdebutR IS NOT NULL THEN
        UPDATE RUBRIQUE
        SET H_debutR = HdebutR
        WHERE idRub = idRubr;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE errd;
        END IF;
    END IF;


    DBMS_OUTPUT.PUT_LINE('Modification réussie');

EXCEPTION
    WHEN errpar THEN
        DBMS_OUTPUT.PUT_LINE('AUCUN DONNEES A MODIFIER');
    WHEN errd OR NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('AUCUNE RUBRIQUE AVEC L''ID ' || idRubr);
END P_ModifierRub;





PROCEDURE P_SupprimerRub(idRubr INTEGER)IS
BEGIN
DELETE FROM RUBRIQUE WHERE idRub=idRubr;
END P_SupprimerRub;



PROCEDURE P_ChercherRub(ids INTEGER DEFAULT NULL, nomArti VARCHAR2 DEFAULT NULL) IS
 CURSOR CurListRub IS
 SELECT *
 FROM RUBRIQUE
 WHERE (ids IS NULL OR idSpec = ids)
 AND (nomArti IS NULL OR idArt = (SELECT idArt FROM ARTISTE WHERE NomArt = nomArti));
Vcur CurListRub%ROWTYPE;
Vnb NUMBER;
errRub EXCEPTION;
BEGIN
OPEN CurListRub;
DBMS_OUTPUT.PUT_LINE('idRub     idSpec     idArt     H_debutR     dureeRub     typeR');
LOOP
FETCH CurListRub INTO Vcur;
EXIT WHEN CurListRub%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(Vcur.idRub||'     '||Vcur.idSpec||'     '||Vcur.idArt||'      '||Vcur.H_debutR||'     '||Vcur.dureeRub||'     '||Vcur.typeR);
END LOOP;
Vnb:=CurListRub%ROWCOUNT;
CLOSE CurListRub;
IF(Vnb=0)THEN
RAISE errRub;
END IF;
EXCEPTION
WHEN errRub THEN
DBMS_OUTPUT.PUT_LINE('AUCUN RUBRIQUE AVEC CE(S) CRITERE(S)');
END P_ChercherRub;
END Gestion_Spectacles;

/
--------------------------------------------------------
--  Constraints for Table DATE_LIEU
--------------------------------------------------------

  ALTER TABLE "PROJETSGBD"."DATE_LIEU" MODIFY ("IDSPEC" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."DATE_LIEU" MODIFY ("DATELIEU" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."DATE_LIEU" MODIFY ("IDLIEU" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."DATE_LIEU" ADD PRIMARY KEY ("IDDATELIEU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RUBRIQUE
--------------------------------------------------------

  ALTER TABLE "PROJETSGBD"."RUBRIQUE" MODIFY ("IDSPEC" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."RUBRIQUE" MODIFY ("IDART" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."RUBRIQUE" MODIFY ("H_DEBUTR" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."RUBRIQUE" MODIFY ("DUREERUB" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."RUBRIQUE" ADD CONSTRAINT "CONS_TYPE" CHECK (typeR IN('comedie', 'théatre', 'dance', 'imitation', 'magie',
'musique', 'chant')) ENABLE;
  ALTER TABLE "PROJETSGBD"."RUBRIQUE" ADD PRIMARY KEY ("IDRUB")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ARTISTE
--------------------------------------------------------

  ALTER TABLE "PROJETSGBD"."ARTISTE" MODIFY ("NOMART" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."ARTISTE" MODIFY ("PRENOMART" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."ARTISTE" MODIFY ("SPECIALITE" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."ARTISTE" ADD CONSTRAINT "CONS_SPEC" CHECK (specialite IN('danseur','acteur','musicien','imitateur','humoriste','chanteur')) ENABLE;
  ALTER TABLE "PROJETSGBD"."ARTISTE" ADD PRIMARY KEY ("IDART")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CLIENT
--------------------------------------------------------

  ALTER TABLE "PROJETSGBD"."CLIENT" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."CLIENT" MODIFY ("MOTP" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."CLIENT" ADD CONSTRAINT "CONS_EMAIL" CHECK (REGEXP_LIKE(email, '^[^@]+@[^@]+\.[a-zA-Z]{2,}$')) ENABLE;
  ALTER TABLE "PROJETSGBD"."CLIENT" ADD CONSTRAINT "CONS_TEL" CHECK (REGEXP_LIKE(tel, '^[259][0-9]{7}$')) ENABLE;
  ALTER TABLE "PROJETSGBD"."CLIENT" ADD PRIMARY KEY ("IDCLT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BILLET
--------------------------------------------------------

  ALTER TABLE "PROJETSGBD"."BILLET" MODIFY ("PRIX" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."BILLET" MODIFY ("IDSPEC" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."BILLET" MODIFY ("VENDU" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."BILLET" ADD CONSTRAINT "CHK_BILLET_PRIX" CHECK (prix BETWEEN 10 AND 300) ENABLE;
  ALTER TABLE "PROJETSGBD"."BILLET" ADD CONSTRAINT "CHK_BILLET_VENDU" CHECK (vendu IN ('Oui','Non')) ENABLE;
  ALTER TABLE "PROJETSGBD"."BILLET" ADD CONSTRAINT "CONS_CAT" CHECK (categorie IN('gold','silver', 'normale')) ENABLE;
  ALTER TABLE "PROJETSGBD"."BILLET" ADD PRIMARY KEY ("IDBILLET")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table RESERVATION
--------------------------------------------------------

  ALTER TABLE "PROJETSGBD"."RESERVATION" MODIFY ("IDCLT" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."RESERVATION" MODIFY ("IDSPEC" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."RESERVATION" MODIFY ("QTE" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."RESERVATION" ADD PRIMARY KEY ("IDRES")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PROJETSGBD"."RESERVATION" ADD CONSTRAINT "TCKT_CAT" CHECK (categorieTckt IN ('Balcon','Orchestre','Galerie')) ENABLE;
  ALTER TABLE "PROJETSGBD"."RESERVATION" MODIFY ("PAYMENTMETHOD" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."RESERVATION" MODIFY ("PRIXPAYE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SPECTACLE
--------------------------------------------------------

  ALTER TABLE "PROJETSGBD"."SPECTACLE" MODIFY ("TITRE" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."SPECTACLE" MODIFY ("DATES" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."SPECTACLE" MODIFY ("H_DEBUT" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."SPECTACLE" MODIFY ("DUREES" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."SPECTACLE" MODIFY ("NBRSPECTATEUR" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."SPECTACLE" ADD CONSTRAINT "CHK_SPECT_DUREES" CHECK (dureeS BETWEEN 1 AND 4) ENABLE;
  ALTER TABLE "PROJETSGBD"."SPECTACLE" ADD PRIMARY KEY ("IDSPEC")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PROJETSGBD"."SPECTACLE" MODIFY ("ANNULEE" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."SPECTACLE" ADD CONSTRAINT "CHK_ANNULEE" CHECK (annulee IN ('oui', 'non')) ENABLE;
--------------------------------------------------------
--  Constraints for Table LIEU
--------------------------------------------------------

  ALTER TABLE "PROJETSGBD"."LIEU" MODIFY ("NOMLIEU" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."LIEU" MODIFY ("ADRESSE" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."LIEU" MODIFY ("VILLE" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."LIEU" MODIFY ("CAPACITE" NOT NULL ENABLE);
  ALTER TABLE "PROJETSGBD"."LIEU" ADD CONSTRAINT "CHECK_SUP" CHECK (supprimee IN ('non','oui')) ENABLE;
  ALTER TABLE "PROJETSGBD"."LIEU" ADD CONSTRAINT "CHECK_CAP" CHECK (capacite BETWEEN 100 AND 2000) ENABLE;
  ALTER TABLE "PROJETSGBD"."LIEU" ADD PRIMARY KEY ("IDLIEU")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BILLET
--------------------------------------------------------

  ALTER TABLE "PROJETSGBD"."BILLET" ADD CONSTRAINT "FK_BILLET_SPEC" FOREIGN KEY ("IDSPEC")
	  REFERENCES "PROJETSGBD"."SPECTACLE" ("IDSPEC") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DATE_LIEU
--------------------------------------------------------

  ALTER TABLE "PROJETSGBD"."DATE_LIEU" ADD CONSTRAINT "FK_DATELIEU_SPECTACLE" FOREIGN KEY ("IDSPEC")
	  REFERENCES "PROJETSGBD"."SPECTACLE" ("IDSPEC") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PROJETSGBD"."DATE_LIEU" ADD CONSTRAINT "FK_DATELIEU_LIEU" FOREIGN KEY ("IDLIEU")
	  REFERENCES "PROJETSGBD"."LIEU" ("IDLIEU") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESERVATION
--------------------------------------------------------

  ALTER TABLE "PROJETSGBD"."RESERVATION" ADD CONSTRAINT "FK_RES_SPECT" FOREIGN KEY ("IDSPEC")
	  REFERENCES "PROJETSGBD"."SPECTACLE" ("IDSPEC") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PROJETSGBD"."RESERVATION" ADD CONSTRAINT "FK_RES_CLIENT" FOREIGN KEY ("IDCLT")
	  REFERENCES "PROJETSGBD"."CLIENT" ("IDCLT") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PROJETSGBD"."RESERVATION" ADD CONSTRAINT "FK_RES_DATELIEU" FOREIGN KEY ("IDDATELIEU")
	  REFERENCES "PROJETSGBD"."DATE_LIEU" ("IDDATELIEU") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RUBRIQUE
--------------------------------------------------------

  ALTER TABLE "PROJETSGBD"."RUBRIQUE" ADD CONSTRAINT "FK_RUB_SPECT" FOREIGN KEY ("IDSPEC")
	  REFERENCES "PROJETSGBD"."SPECTACLE" ("IDSPEC") ON DELETE CASCADE ENABLE;
  ALTER TABLE "PROJETSGBD"."RUBRIQUE" ADD CONSTRAINT "FK_RUB_ART" FOREIGN KEY ("IDART")
	  REFERENCES "PROJETSGBD"."ARTISTE" ("IDART") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SPECTACLE
--------------------------------------------------------

  ALTER TABLE "PROJETSGBD"."SPECTACLE" ADD CONSTRAINT "FK_SPECT_LIEUX" FOREIGN KEY ("IDLIEU")
	  REFERENCES "PROJETSGBD"."LIEU" ("IDLIEU") ENABLE;
