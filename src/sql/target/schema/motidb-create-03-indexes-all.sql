-- create index
CREATE INDEX IF NOT EXISTS idx_moti_t_intervento_1 ON moti.moti_t_intervento (fk_settore);
CREATE INDEX IF NOT EXISTS idx_moti_t_intervento_2 ON moti.moti_t_intervento (fk_tipologia);
CREATE INDEX IF NOT EXISTS idx_moti_t_intervento_3 ON moti.moti_t_intervento (fk_stato_attuazione);
CREATE INDEX IF NOT EXISTS idx_moti_t_intervento_4 ON moti.moti_t_intervento (fk_utente_blocco_modifica);
CREATE INDEX IF NOT EXISTS idx_moti_t_intervento_5 ON moti.moti_t_intervento (fk_fonte_dati);
CREATE INDEX IF NOT EXISTS idx_moti_t_intervento_dati_oti_1 ON moti.moti_t_intervento_dati_oti (fk_intervento);
CREATE INDEX IF NOT EXISTS idx_moti_t_intervento_costi_1 ON moti.moti_t_intervento_costi (fk_intervento);
CREATE INDEX IF NOT EXISTS idx_moti_r_intervento_fase_1 ON moti.moti_r_intervento_fase (fk_intervento);
CREATE INDEX IF NOT EXISTS idx_moti_r_intervento_fase_2 ON moti.moti_r_intervento_fase (fk_fase);
CREATE INDEX IF NOT EXISTS idx_moti_r_intervento_fontefin_1 ON moti.moti_r_intervento_fontefin (fk_tipo_fonte);
CREATE INDEX IF NOT EXISTS idx_moti_r_intervento_fontefin_2 ON moti.moti_r_intervento_fontefin (fk_intervento);
CREATE INDEX IF NOT EXISTS idx_moti_r_intervento_situazione_criticita_1 ON moti.moti_r_intervento_situazione_criticita (fk_intervento);
CREATE INDEX IF NOT EXISTS idx_moti_r_intervento_situazione_criticita_2 ON moti.moti_r_intervento_situazione_criticita (fk_situazione_criticita);
CREATE INDEX IF NOT EXISTS idx_moti_r_intervento_situazione_criticita_3 ON moti.moti_r_intervento_situazione_criticita (fk_tipo_criticita);
CREATE INDEX IF NOT EXISTS idx_moti_r_intervento_referente_1 ON moti.moti_r_intervento_referente (fk_intervento); 
CREATE INDEX IF NOT EXISTS idx_moti_r_intervento_referente_2 ON moti.moti_r_intervento_referente (fk_utente); 
CREATE INDEX IF NOT EXISTS idx_moti_d_fase_1 ON moti.moti_d_fase (fk_fonte_dati);
CREATE INDEX IF NOT EXISTS idx_moti_t_utente_1 ON moti.moti_t_utente (fk_id_ruolo);
--
CREATE INDEX IF NOT EXISTS idx_moti_r_intervento_luogo_1 ON moti.moti_r_intervento_luogo (fk_intervento);
CREATE INDEX IF NOT EXISTS idx_moti_r_intervento_luogo_2 ON moti.moti_r_intervento_luogo (fk_luogo);
--
CREATE INDEX IF NOT EXISTS idx_moti_r_intervento_situazione_criticita_4 ON moti.moti_r_intervento_situazione_criticita USING btree (fk_fonte_dati);
CREATE INDEX IF NOT EXISTS idx_moti_r_intervento_fontefin_3 ON moti.moti_r_intervento_fontefin USING btree (fk_fonte_dati);
--

CREATE UNIQUE INDEX IF NOT EXISTS idx_moti_r_ruolo_permesso_1 ON moti.moti_r_ruolo_permesso (fk_id_ruolo,fk_id_permesso);