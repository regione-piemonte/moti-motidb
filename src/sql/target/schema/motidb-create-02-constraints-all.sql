-- alter table
-- drop constraint prima di crearli
ALTER TABLE IF EXISTS moti.moti_t_intervento DROP CONSTRAINT IF EXISTS moti_t_intervento_01_settore_fk;
ALTER TABLE IF EXISTS moti.moti_t_intervento DROP CONSTRAINT IF EXISTS moti_t_intervento_02_tipologia_fk;
ALTER TABLE IF EXISTS moti.moti_t_intervento DROP CONSTRAINT IF EXISTS moti_t_intervento_03_stato_attuazione_fk;
ALTER TABLE IF EXISTS moti.moti_t_intervento DROP CONSTRAINT IF EXISTS moti_t_intervento_04_utente_fk;
ALTER TABLE IF EXISTS moti.moti_t_intervento DROP CONSTRAINT IF EXISTS moti_t_intervento_05_fonte_fk;
ALTER TABLE IF EXISTS moti.moti_t_intervento_dati_oti DROP CONSTRAINT IF EXISTS moti_t_intervento_dati_oti_01_fk;
ALTER TABLE IF EXISTS moti.moti_t_intervento_costi DROP CONSTRAINT IF EXISTS moti_t_intervento_costi_01_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_fase DROP CONSTRAINT IF EXISTS moti_r_intervento_fase_01_intervento_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_fase DROP CONSTRAINT IF EXISTS moti_r_intervento_fase_02_fase_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_fontefin DROP CONSTRAINT IF EXISTS moti_r_intervento_fontefin_01_intervento_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_fontefin DROP CONSTRAINT IF EXISTS moti_r_intervento_fontefin_02_tipo_fonte_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_situazione_criticita DROP CONSTRAINT IF EXISTS moti_r_intervento_situazione_criticita_01_intervento_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_situazione_criticita DROP CONSTRAINT IF EXISTS moti_r_intervento_situazione_criticita_02_situazione_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_situazione_criticita DROP CONSTRAINT IF EXISTS moti_r_intervento_situazione_criticita_03_tipo_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_referente DROP CONSTRAINT IF EXISTS moti_r_intervento_referente_01_intervento_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_referente DROP CONSTRAINT IF EXISTS moti_moti_r_intervento_referente_02_utente_fk;
ALTER TABLE IF EXISTS moti.moti_d_fase DROP CONSTRAINT IF EXISTS moti_d_fase_01_fonte_fk;
ALTER TABLE IF EXISTS moti.moti_t_utente DROP CONSTRAINT IF EXISTS moti_t_utente_01_intervento_fk;
--
ALTER TABLE IF EXISTS moti.moti_t_intervento DROP CONSTRAINT IF EXISTS moti_moti_t_intervento_06_utente_fk;
ALTER TABLE IF EXISTS moti.moti_t_intervento DROP CONSTRAINT IF EXISTS moti_moti_t_intervento_07_utente_fk;
ALTER TABLE IF EXISTS moti.moti_t_intervento_costi DROP CONSTRAINT IF EXISTS moti_moti_t_intervento_costi_02_utente_fk;
ALTER TABLE IF EXISTS moti.moti_t_intervento_costi DROP CONSTRAINT IF EXISTS moti_moti_t_intervento_costi_03_utente_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_fase DROP CONSTRAINT IF EXISTS moti_moti_r_intervento_fase_03_utente_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_fase DROP CONSTRAINT IF EXISTS moti_moti_r_intervento_fase_04_utente_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_fontefin DROP CONSTRAINT IF EXISTS moti_moti_r_intervento_fontefin_03_utente_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_fontefin DROP CONSTRAINT IF EXISTS moti_moti_r_intervento_fontefin_04_utente_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_situazione_criticita DROP CONSTRAINT IF EXISTS moti_moti_r_intervento_situazione_criticita_04_utente_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_situazione_criticita DROP CONSTRAINT IF EXISTS moti_moti_r_intervento_situazione_criticita_05_utente_fk;
--
ALTER TABLE IF EXISTS moti.moti_r_ruolo_permesso DROP CONSTRAINT IF EXISTS moti_moti_r_ruolo_permesso_01_ruolo_fk;
ALTER TABLE IF EXISTS moti.moti_r_ruolo_permesso DROP CONSTRAINT IF EXISTS moti_moti_r_ruolo_permesso_02_permesso_fk;
--
ALTER TABLE IF EXISTS moti.moti_r_intervento_luogo DROP CONSTRAINT IF EXISTS moti_r_intervento_luogo_01_intervento_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_luogo DROP CONSTRAINT IF EXISTS moti_r_intervento_luogo_02_luogo_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_luogo DROP CONSTRAINT IF EXISTS moti_r_intervento_luogo_03_utente_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_luogo DROP CONSTRAINT IF EXISTS moti_r_intervento_luogo_04_utente_fk;
--
ALTER TABLE IF EXISTS moti.moti_r_intervento_situazione_criticita DROP CONSTRAINT IF EXISTS moti_r_intervento_situazione_criticita_06_fonte_dati_fk;
ALTER TABLE IF EXISTS moti.moti_r_intervento_fontefin DROP CONSTRAINT IF EXISTS moti_r_intervento_fontefin_05_fonte_dati_fk;

-- change 2021-02-22 - attuatore
ALTER TABLE moti.moti_d_attuatore DROP CONSTRAINT IF EXISTS moti_d_attuatore_01_utente_fk;
ALTER TABLE moti.moti_t_intervento DROP CONSTRAINT IF EXISTS moti_t_intervento_06_attuatore_fk;

-- creo constraint
ALTER TABLE moti.moti_t_intervento ADD CONSTRAINT moti_t_intervento_01_settore_fk FOREIGN KEY (fk_settore) REFERENCES moti_d_settore (id_settore) ;
ALTER TABLE moti.moti_t_intervento ADD CONSTRAINT moti_t_intervento_02_tipologia_fk FOREIGN KEY (fk_tipologia) REFERENCES moti_d_tipologia (id_tipologia);
ALTER TABLE moti.moti_t_intervento ADD CONSTRAINT moti_t_intervento_03_stato_attuazione_fk FOREIGN KEY (fk_stato_attuazione) REFERENCES moti_d_stato_attuaz (id_stato_attuaz);
ALTER TABLE moti.moti_t_intervento ADD CONSTRAINT moti_t_intervento_04_utente_fk FOREIGN KEY (fk_utente_blocco_modifica) REFERENCES moti_t_utente (id_utente);
ALTER TABLE moti.moti_t_intervento ADD CONSTRAINT moti_t_intervento_05_fonte_fk FOREIGN KEY (fk_fonte_dati) REFERENCES moti_d_fonte_dati (id_fonte_dati);
ALTER TABLE moti.moti_t_intervento_dati_oti ADD CONSTRAINT moti_t_intervento_dati_oti_01_fk FOREIGN KEY (fk_intervento) REFERENCES moti_t_intervento (id_intervento);
ALTER TABLE moti.moti_t_intervento_costi ADD CONSTRAINT moti_t_intervento_costi_01_fk FOREIGN KEY (fk_intervento) REFERENCES moti_t_intervento (id_intervento);
ALTER TABLE moti.moti_r_intervento_fase ADD CONSTRAINT moti_r_intervento_fase_01_intervento_fk FOREIGN KEY (fk_intervento) REFERENCES moti_t_intervento (id_intervento);
ALTER TABLE moti.moti_r_intervento_fase ADD CONSTRAINT moti_r_intervento_fase_02_fase_fk FOREIGN KEY (fk_fase) REFERENCES moti_d_fase (id_fase);
ALTER TABLE moti.moti_r_intervento_fontefin ADD	CONSTRAINT moti_r_intervento_fontefin_01_intervento_fk FOREIGN KEY (fk_intervento) REFERENCES moti_t_intervento (id_intervento); 	  
ALTER TABLE moti.moti_r_intervento_fontefin ADD	CONSTRAINT moti_r_intervento_fontefin_02_tipo_fonte_fk FOREIGN KEY (fk_tipo_fonte) REFERENCES moti_d_fonte_finanziamento (id_fonte_fin);
ALTER TABLE moti.moti_r_intervento_situazione_criticita ADD CONSTRAINT moti_r_intervento_situazione_criticita_01_intervento_fk FOREIGN KEY (fk_intervento) REFERENCES moti_t_intervento (id_intervento);
ALTER TABLE moti.moti_r_intervento_situazione_criticita ADD CONSTRAINT moti_r_intervento_situazione_criticita_02_situazione_fk FOREIGN KEY (fk_situazione_criticita) REFERENCES moti_d_situazione_criticita (id_situazione);
ALTER TABLE moti.moti_r_intervento_situazione_criticita ADD CONSTRAINT moti_r_intervento_situazione_criticita_03_tipo_fk FOREIGN KEY (fk_tipo_criticita) REFERENCES moti_d_tipo_criticita (id_tipo_criticita);
ALTER TABLE moti.moti_r_intervento_referente ADD CONSTRAINT moti_r_intervento_referente_01_intervento_fk FOREIGN KEY (fk_intervento) REFERENCES moti_t_intervento (id_intervento); 
ALTER TABLE moti.moti_r_intervento_referente ADD CONSTRAINT moti_moti_r_intervento_referente_02_utente_fk FOREIGN KEY (fk_utente) REFERENCES moti_t_utente (id_utente);
ALTER TABLE moti.moti_d_fase ADD CONSTRAINT moti_d_fase_01_fonte_fk FOREIGN KEY (fk_fonte_dati) REFERENCES moti_d_fonte_dati (id_fonte_dati);
ALTER TABLE moti.moti_t_utente ADD CONSTRAINT moti_t_utente_01_intervento_fk FOREIGN KEY (fk_id_ruolo) REFERENCES moti_d_ruolo (id_ruolo);
--
ALTER TABLE moti.moti_t_intervento ADD CONSTRAINT moti_moti_t_intervento_06_utente_fk FOREIGN KEY (fk_utente_inserimento) REFERENCES moti_t_utente (id_utente);
ALTER TABLE moti.moti_t_intervento ADD CONSTRAINT moti_moti_t_intervento_07_utente_fk FOREIGN KEY (fk_utente_ultima_modifica) REFERENCES moti_t_utente (id_utente);
ALTER TABLE moti.moti_t_intervento_costi ADD CONSTRAINT moti_moti_t_intervento_costi_02_utente_fk FOREIGN KEY (fk_utente_inserimento) REFERENCES moti_t_utente (id_utente);
ALTER TABLE moti.moti_t_intervento_costi ADD CONSTRAINT moti_moti_t_intervento_costi_03_utente_fk FOREIGN KEY (fk_utente_ultima_modifica) REFERENCES moti_t_utente (id_utente);
ALTER TABLE moti.moti_r_intervento_fase ADD CONSTRAINT moti_moti_r_intervento_fase_03_utente_fk FOREIGN KEY (fk_utente_inserimento) REFERENCES moti_t_utente (id_utente);
ALTER TABLE moti.moti_r_intervento_fase ADD CONSTRAINT moti_moti_r_intervento_fase_04_utente_fk FOREIGN KEY (fk_utente_ultima_modifica) REFERENCES moti_t_utente (id_utente);
ALTER TABLE moti.moti_r_intervento_fontefin ADD CONSTRAINT moti_moti_r_intervento_fontefin_03_utente_fk FOREIGN KEY (fk_utente_inserimento) REFERENCES moti_t_utente (id_utente);
ALTER TABLE moti.moti_r_intervento_fontefin ADD CONSTRAINT moti_moti_r_intervento_fontefin_04_utente_fk FOREIGN KEY (fk_utente_ultima_modifica) REFERENCES moti_t_utente (id_utente);
ALTER TABLE moti.moti_r_intervento_situazione_criticita ADD CONSTRAINT moti_moti_r_intervento_situazione_criticita_04_utente_fk FOREIGN KEY (fk_utente_inserimento) REFERENCES moti_t_utente (id_utente);
ALTER TABLE moti.moti_r_intervento_situazione_criticita ADD CONSTRAINT moti_moti_r_intervento_situazione_criticita_05_utente_fk FOREIGN KEY (fk_utente_ultima_modifica) REFERENCES moti_t_utente (id_utente);
--
ALTER TABLE moti.moti_r_ruolo_permesso ADD CONSTRAINT moti_moti_r_ruolo_permesso_01_ruolo_fk FOREIGN KEY (fk_id_ruolo) REFERENCES moti_d_ruolo (id_ruolo);
ALTER TABLE moti.moti_r_ruolo_permesso ADD CONSTRAINT moti_moti_r_ruolo_permesso_02_permesso_fk FOREIGN KEY (fk_id_permesso) REFERENCES moti_d_permesso (id_permesso);
--
ALTER TABLE moti.moti_r_intervento_luogo ADD CONSTRAINT moti_r_intervento_luogo_01_intervento_fk FOREIGN KEY (fk_intervento) REFERENCES moti.moti_t_intervento (id_intervento);
ALTER TABLE moti.moti_r_intervento_luogo ADD CONSTRAINT moti_r_intervento_luogo_02_luogo_fk FOREIGN KEY (fk_luogo) REFERENCES moti.moti_t_luogo(id_luogo);
ALTER TABLE moti.moti_r_intervento_luogo ADD CONSTRAINT moti_r_intervento_luogo_03_utente_fk FOREIGN KEY (fk_utente_inserimento) REFERENCES moti.moti_t_utente (id_utente);
ALTER TABLE moti.moti_r_intervento_luogo ADD CONSTRAINT moti_r_intervento_luogo_04_utente_fk FOREIGN KEY (fk_utente_ultima_modifica) REFERENCES moti.moti_t_utente (id_utente);
--
alter table moti.moti_r_intervento_situazione_criticita add CONSTRAINT moti_r_intervento_situazione_criticita_06_fonte_dati_fk FOREIGN KEY (fk_fonte_dati) REFERENCES moti_d_fonte_dati(id_fonte_dati);
alter table moti.moti_r_intervento_fontefin add CONSTRAINT moti_r_intervento_fontefin_05_fonte_dati_fk FOREIGN KEY (fk_fonte_dati) REFERENCES moti_d_fonte_dati(id_fonte_dati);
--

-- change attuatore
ALTER TABLE moti.moti_d_attuatore ADD CONSTRAINT moti_d_attuatore_01_utente_fk FOREIGN KEY (fk_utente_inserimento) REFERENCES moti_t_utente (id_utente);
ALTER TABLE moti.moti_t_intervento ADD CONSTRAINT moti_t_intervento_06_attuatore_fk FOREIGN KEY (fk_attuatore) REFERENCES moti_d_attuatore (id_attuatore);

