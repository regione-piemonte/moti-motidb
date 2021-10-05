
---------------
-- SEQUENCES --
---------------
SELECT setval('moti_d_fase_id_fase_seq', COALESCE((SELECT MAX(id_fase)+1 
FROM moti_d_fase), 1), true);

SELECT setval('moti_d_fonte_dati_id_fonte_dati_seq', COALESCE((SELECT MAX(id_fonte_dati)+1 
FROM moti_d_fonte_dati), 1), true);

SELECT setval('moti_d_fonte_finanziamento_id_fonte_fin_seq', COALESCE((SELECT MAX(id_fonte_fin)+1 
FROM moti_d_fonte_finanziamento), 1), true);

SELECT setval('moti_d_permesso_id_permesso_seq', COALESCE((SELECT MAX(id_permesso)+1 
FROM moti_d_permesso), 1), true);

SELECT setval('moti_d_ruolo_id_ruolo_seq', COALESCE((SELECT MAX(id_ruolo)+1 
FROM moti_d_ruolo), 1), true);

SELECT setval('moti_d_settore_id_settore_seq', COALESCE((SELECT MAX(id_settore)+1 
FROM moti_d_settore), 1), true);

SELECT setval('moti_d_situazione_criticita_id_situazione_seq', COALESCE((SELECT MAX(id_situazione)+1 
FROM moti_d_situazione_criticita), 1), true);

SELECT setval('moti_d_stato_attuaz_id_stato_attuaz_seq', COALESCE((SELECT MAX(id_stato_attuaz)+1 
FROM moti_d_stato_attuaz), 1), true);

SELECT setval('moti_d_tipo_criticita_id_tipo_criticita_seq', COALESCE((SELECT MAX(id_tipo_criticita)+1 
FROM moti_d_tipo_criticita), 1), true);

SELECT setval('moti_d_tipologia_id_tipologia_seq', COALESCE((SELECT MAX(id_tipologia)+1 
FROM moti_d_tipologia), 1), true);

SELECT setval('moti_r_intervento_fase_id_intervento_fase_seq', COALESCE((SELECT MAX(id_intervento_fase)+1 
FROM moti_r_intervento_fase), 1), true);

SELECT setval('moti_r_intervento_fontefin_id_intervento_fontefin_seq', COALESCE((SELECT MAX(id_intervento_fontefin)+1 
FROM moti_r_intervento_fontefin), 1), true);

SELECT setval('moti_r_intervento_luogo_id_intervento_luogo_seq', COALESCE((SELECT MAX(id_intervento_luogo)+1 
FROM moti_r_intervento_luogo), 1), true);

SELECT setval('moti_r_intervento_referente_id_referente_intervento_seq', COALESCE((SELECT MAX(id_referente_intervento)+1 
FROM moti_r_intervento_referente), 1), true);

SELECT setval('moti_r_intervento_situazione_criticita_id_criticita_seq', COALESCE((SELECT MAX(id_criticita)+1 
FROM moti_r_intervento_situazione_criticita), 1), true);

SELECT setval('moti_r_ruolo_permesso_id_ruolo_permesso_seq', COALESCE((SELECT MAX(id_ruolo_permesso)+1 
FROM moti_r_ruolo_permesso), 1), true);

SELECT setval('moti_t_intervento_costi_id_costi_intervento_seq', COALESCE((SELECT MAX(id_costi_intervento)+1 
FROM moti_t_intervento_costi), 1), true);

SELECT setval('moti_t_intervento_dati_oti_id_dati_oti_seq', COALESCE((SELECT MAX(id_dati_oti)+1 
FROM moti_t_intervento_dati_oti), 1), true);

SELECT setval('moti_t_intervento_id_intervento_seq', COALESCE((SELECT MAX(id_intervento)+1 
FROM moti_t_intervento), 1), true);

SELECT setval('moti_t_luogo_id_luogo_seq', COALESCE((SELECT MAX(id_luogo)+1 
FROM moti_t_luogo), 1), true);

-- change attuatore
SELECT setval('moti_d_attuatore_id_attuatore_seq', COALESCE((SELECT MAX(id_attuatore)+1 
FROM moti_d_attuatore), 1), true);

