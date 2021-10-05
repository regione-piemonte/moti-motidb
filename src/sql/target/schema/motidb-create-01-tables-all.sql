---------------
----- DDL -----
---------------

/*
-- (prima si crea utente postgres in locale) dopodichè eseguire
 CREATE USER moti WITH PASSWORD 'moti';
DROP DATABASE IF EXISTS moti;
CREATE DATABASE moti OWNER moti; */

-- DROP TABLE IF EXISTS moti_d_fase CASCADE;
-- DROP TABLE IF EXISTS moti_d_fonte_dati CASCADE;
-- DROP TABLE IF EXISTS moti_d_fonte_finanziamento CASCADE;
-- DROP TABLE IF EXISTS moti_d_ruolo CASCADE;
-- DROP TABLE IF EXISTS moti_d_settore CASCADE;
-- DROP TABLE IF EXISTS moti_d_situazione_criticita CASCADE;
-- DROP TABLE IF EXISTS moti_d_stato_attuaz CASCADE;
-- DROP TABLE IF EXISTS moti_d_tipologia CASCADE;
-- DROP TABLE IF EXISTS moti_d_permesso CASCADE;
-- DROP TABLE IF EXISTS moti_d_tipo_criticita CASCADE;
-- DROP TABLE IF EXISTS moti_t_intervento CASCADE;
-- DROP TABLE IF EXISTS moti_t_intervento_dati_oti CASCADE;
-- DROP TABLE IF EXISTS moti_t_intervento_costi CASCADE;
-- DROP TABLE IF EXISTS moti_t_utente CASCADE;
-- DROP TABLE IF EXISTS moti_r_intervento_fase CASCADE;
-- DROP TABLE IF EXISTS moti_r_intervento_fontefin CASCADE;
-- DROP TABLE IF EXISTS moti_r_intervento_referente CASCADE;
-- DROP TABLE IF EXISTS moti_r_intervento_situazione_criticita CASCADE;
-- DROP TABLE IF EXISTS moti_r_ruolo_permesso CASCADE;
-- DROP TABLE IF EXISTS moti_t_luogo;
-- DROP TABLE IF EXISTS moti_r_intervento_luogo;


/* AO tab nuova */
CREATE TABLE IF NOT EXISTS moti.moti_d_ruolo (
   id_ruolo SERIAL,
   cod_ruolo VARCHAR(10),
   descrizione_ruolo VARCHAR(100),
   accesso_sistema boolean,
   CONSTRAINT pk_moti_d_ruolo PRIMARY KEY (id_ruolo));

CREATE TABLE IF NOT EXISTS moti.moti_d_situazione_criticita 
   (id_situazione SERIAL, 
	descrizione VARCHAR(200) NOT NULL, 
	ordine numeric(6,0), 
	elem_default numeric(1,0) DEFAULT 0, 
	CONSTRAINT pk_moti_d_criticita_interv PRIMARY KEY (id_situazione));

CREATE TABLE IF NOT EXISTS moti.moti_d_fonte_dati
   (id_fonte_dati SERIAL, 
	descrizione VARCHAR(200) NOT NULL, 
	ordine numeric(6,0), 
	elem_default numeric(1,0) DEFAULT 0, 
	CONSTRAINT pk_moti_d_fonte_dati PRIMARY KEY (id_fonte_dati));
		
CREATE TABLE IF NOT EXISTS moti.moti_d_fase 
   (id_fase SERIAL, 
	descrizione VARCHAR(200) NOT NULL, 
	tipologia VARCHAR(20) NOT NULL,
	fk_fonte_dati integer,
	ordine numeric(6,0),  
	CONSTRAINT pk_moti_d_fase PRIMARY KEY (id_fase));


CREATE TABLE IF NOT EXISTS moti.moti_d_settore
   (id_settore SERIAL, 
	descrizione VARCHAR(200) NOT NULL, 
	ordine numeric(6,0), 
	elem_default numeric(1,0) DEFAULT 0, 
	CONSTRAINT pk_moti_d_settore PRIMARY KEY (id_settore));

CREATE TABLE IF NOT EXISTS moti.moti_d_fonte_finanziamento 
   (id_fonte_fin SERIAL,
	descrizione VARCHAR(200) NOT NULL, 
	ordine numeric(6,0), 
	elem_default numeric(1,0) DEFAULT 0, 
	CONSTRAINT pk_moti_d_fonte_fin PRIMARY KEY (id_fonte_fin));

CREATE TABLE IF NOT EXISTS moti.moti_d_stato_attuaz 
   (id_stato_attuaz SERIAL, 
	descrizione VARCHAR(200) NOT NULL, 
	ordine numeric(6,0), 
    CONSTRAINT pk_moti_d_stato_attuaz PRIMARY KEY (id_stato_attuaz)); 

	
CREATE TABLE IF NOT EXISTS moti.moti_d_tipologia
   (id_tipologia SERIAL, 
	descrizione VARCHAR(200) NOT NULL, 
	ordine numeric(6,0), 
	elem_default numeric(1,0) DEFAULT 0, 
	CONSTRAINT pk_moti_d_tipologia PRIMARY KEY (id_tipologia));
   
 -- fare una select --> POLITICHE, ECONOMICO-FINANZIARIE, 
 -- TECNICO-PROCEDURALI
CREATE TABLE IF NOT EXISTS moti.moti_d_tipo_criticita ( 
 id_tipo_criticita SERIAL,
 descrizione_tipo_criticita VARCHAR(200) NOT NULL,
 CONSTRAINT pk_moti_d_tipo_criticita PRIMARY KEY (id_tipo_criticita));   
   
-- lasciamo qua anche le anagrafiche referenti
-- aggiungiamo il campo accede a sistema si/no  
CREATE TABLE IF NOT EXISTS moti.moti_t_utente 
   (id_utente  integer NOT NULL, --
	codice_fiscale VARCHAR(16) NOT NULL, 
	cognome VARCHAR(100) NOT NULL, 
	nome VARCHAR(100), 
	email VARCHAR(100), 
	telefono VARCHAR(100), 
	--RUOLO VARCHAR(100),  -- variato AO 21/09/2020
	fk_id_ruolo integer,
	flag_accesso_sistema boolean,
	data_inserimento DATE NOT NULL, 
	data_ultima_modifica DATE,
    --fk_utente_inserimento integer,	
	--fk_utente_ultima_modifica integer, 
	data_cancellazione DATE, 
	CONSTRAINT pk_moti_t_utente PRIMARY KEY (id_utente));
	
CREATE TABLE IF NOT EXISTS moti.moti_t_luogo 
   (id_luogo SERIAL,
    luogo_istat VARCHAR(6) NOT NULL, 
	denom_luogo VARCHAR(255) NOT NULL, 
	sigla CHAR(2), 
	regione_istat VARCHAR(2), 
	denom_regione VARCHAR(255), 
	flag_provincia boolean,
	CONSTRAINT pk_moti_t_luogo PRIMARY KEY (id_luogo));

CREATE TABLE IF NOT EXISTS moti.moti_t_intervento 
   (id_intervento SERIAL, 
	cod_intervento VARCHAR(10) NOT NULL, 
	titolo VARCHAR(200) NOT NULL, 
	fk_settore integer, 
	fk_tipologia integer NOT NULL, 
	fk_stato_attuazione integer NOT NULL,	
	fk_fonte_dati  integer NOT NULL,
	cup VARCHAR(15),  -- presi da moti_t_inquadramento
	cig VARCHAR (10),-- presi da moti_t_inquadramento
	attuatore VARCHAR (200),-- presi da moti_t_inquadramento
	--costo_previsto numeric(14,2), 	
	descr_tecnica TEXT, 	
	note_programmazione VARCHAR(4000),   -- presi da moti_t_attuazione
	note_realizzazione VARCHAR(4000),    -- presi da moti_t_attuazione
	fonte_dati_programmazione VARCHAR(500), -- presi da moti_t_attuazione
	fonte_dati_realizzazione VARCHAR(500), -- presi da moti_t_attuazione
	--data_prossimo_monit DATE, 
	fk_utente_blocco_modifica integer, --da mod a modifica per uniformità
	data_blocco_modifica DATE, 
	data_inserimento DATE NOT NULL, 
	data_ultima_modifica DATE,
	fk_utente_inserimento integer,
	fk_utente_ultima_modifica integer, 
	data_cancellazione DATE, 
	id_intervento_old numeric,
	optlock UUID NOT NULL DEFAULT uuid_generate_v4(),
	CONSTRAINT pk_moti_t_intervento PRIMARY KEY (id_intervento));
	
COMMENT ON COLUMN moti_t_intervento.cig IS 'Codice Identificativo Gara, più codici sono inseriti separati da uno spazio';


CREATE TABLE IF NOT EXISTS moti.moti_t_intervento_dati_oti (
    id_dati_oti SERIAL,   
    fk_intervento integer NOT NULL, 
	data_ultimo_aggiornamento DATE,
	soggetti_coinvolti VARCHAR(1000), 
	anno_inizio_lavori numeric,
	anno_prossima_fase numeric,
	anno_ultimazione_opera numeric,
	rispetto_tempi TEXT,
	dettagli_prossima_fase TEXT,
	url_da_richiamare VARCHAR(200),
	finanziamenti_disponibili numeric(14,2),
	finanziamenti_non_disponibili numeric (14,2),
	--DETTAGLIO_FINANZIAMENTI_DISPONIBILI TEXT 500 --note economiche di moti_T_COSTI_INTEVENTO 
	--STATO_AVANZAMENTO_PROGETTO --> fk_stato_attuazione
	descrizione_progettazione TEXT,
	dettaglio_costi	TEXT,
	optlock UUID NOT NULL DEFAULT uuid_generate_v4(),
	CONSTRAINT pk_moti_t_dati_oti PRIMARY KEY (id_dati_oti));
	

CREATE TABLE IF NOT EXISTS moti.moti_t_intervento_costi 
   (id_costi_intervento SERIAL,
    fk_intervento integer NOT NULL, 
	costo_previsto numeric(14,2), 
	fonte_riferimento VARCHAR(500), 
	note VARCHAR(4000), -- note sul costo
	data_ultima_liquidazione DATE, 
	note_economiche VARCHAR(4000), 
	fonte_dati VARCHAR(500), 
	data_inserimento DATE NOT NULL, 
	data_ultima_modifica DATE,
    fk_utente_inserimento  integer,	
	fk_utente_ultima_modifica integer, 
	data_cancellazione DATE,
    optlock UUID NOT NULL DEFAULT uuid_generate_v4(),	
	CONSTRAINT pk_moti_t_intervento_costi PRIMARY KEY (id_costi_intervento));
	  

CREATE TABLE IF NOT EXISTS moti.moti_r_intervento_luogo 
   (id_intervento_luogo SERIAL, 
    fk_intervento integer NOT NULL, 
	fk_luogo integer NOT NULL, 
	data_inserimento DATE NOT NULL, 
	data_ultima_modifica DATE,
    fk_utente_inserimento  integer,	
	fk_utente_ultima_modifica integer, 
	data_cancellazione DATE, 
	CONSTRAINT pk_moti_r_intervento_luogo PRIMARY KEY (id_intervento_luogo));

CREATE TABLE IF NOT EXISTS moti.moti_r_intervento_fase --> ex moti_r_fase_attuaz
   (id_intervento_fase SERIAL,
    fk_intervento integer NOT NULL, 
	fk_fase integer NOT NULL, 
	data_prevista DATE, 
	data_effettiva DATE, 
	data_inserimento DATE NOT NULL, 
	data_ultima_modifica DATE,
    fk_utente_inserimento  integer,	
	fk_utente_ultima_modifica integer, 
	data_cancellazione DATE, 
	CONSTRAINT pk_moti_r_intervento_fase PRIMARY KEY (id_intervento_fase));

	  
CREATE TABLE IF NOT EXISTS moti.moti_r_intervento_fontefin
   (id_intervento_fontefin SERIAL,
	fk_intervento integer NOT NULL, 
	fk_tipo_fonte integer NOT NULL, 
	descrizione VARCHAR(500), 
	importo_liquidato numeric(14,2), 
	data_inserimento DATE NOT NULL, 
	data_ultima_modifica DATE,
    fk_utente_inserimento  integer,	
	fk_utente_ultima_modifica integer, 
	data_cancellazione DATE,
    fk_fonte_dati int4 NOT NULL,	
	CONSTRAINT pk_moti_r_intervento_fontefin PRIMARY KEY (id_intervento_fontefin));	 

-- ci sono più referenti per interventi
CREATE TABLE IF NOT EXISTS moti.moti_r_intervento_referente 
   (id_referente_intervento SERIAL,
    fk_utente integer NOT NULL, 
	fk_intervento integer NOT NULL, 
	CONSTRAINT pk_moti_r_intervento_referente PRIMARY KEY (id_referente_intervento));
	

-- ex (moti_t_criticita_interv )
CREATE TABLE IF NOT EXISTS moti.moti_r_intervento_situazione_criticita
   (id_criticita SERIAL, 
	fk_intervento integer NOT NULL, 
	fk_situazione_criticita integer NOT NULL, 
	descrizione VARCHAR(4000) NOT NULL, 
	fk_tipo_criticita integer,  -- fare una select --> POLITICHE, ECONOMICO-FINANZIARIE, TECNICO-PROCEDURALI
	data_inserimento DATE NOT NULL, 
	data_ultima_modifica DATE,
    fk_utente_inserimento  integer,	
	fk_utente_ultima_modifica integer, 
	data_cancellazione DATE,
    fk_fonte_dati int4 NOT NULL,	
	CONSTRAINT pk_moti_r_intervento_situazione_criticita PRIMARY KEY (id_criticita));
	
CREATE TABLE IF NOT EXISTS moti.moti_d_permesso 
   (id_permesso serial,
    desc_breve_permesso varchar(255) not null,
    desc_permesso varchar(255) not null,
    dt_inizio_validita DATE NOT NULL, 
    dt_fine_validita DATE,   -- se validata, il permesso si disattiva per tutti i ruoli
    constraint pk_moti_d_permesso primary key (id_permesso));
	
CREATE TABLE IF NOT EXISTS moti.moti_r_ruolo_permesso
(id_ruolo_permesso serial,
 fk_id_ruolo integer NOT NULL,
 fk_id_permesso integer NOT NULL,
 dt_inizio_validita DATE NOT NULL,
 dt_fine_validita DATE, -- se validata, il permesso si disattiva solo per uno specifico ruolo
 constraint pk_moti_r_ruolo_permesso primary key (id_ruolo_permesso));
 

-- change importo stanziato
ALTER TABLE IF EXISTS moti.moti_r_intervento_fontefin 
 	ADD COLUMN IF NOT EXISTS importo_stanziato numeric(14,2)
;

-- change attuatore
CREATE TABLE IF NOT EXISTS moti.moti_d_attuatore (
   id_attuatore SERIAL,
   descrizione VARCHAR(256),
   codice_fiscale VARCHAR(16),
   data_inserimento DATE NOT NULL,
   fk_utente_inserimento integer,
   CONSTRAINT pk_moti_d_attuatore PRIMARY KEY (id_attuatore));
 
ALTER TABLE IF EXISTS moti.moti_t_intervento
 	ADD COLUMN IF NOT EXISTS fk_attuatore integer
;
    
-- change note sui singoli finanziamenti
ALTER TABLE IF EXISTS moti.moti_r_intervento_fontefin 
 	ADD COLUMN IF NOT EXISTS note VARCHAR(4000)
;

