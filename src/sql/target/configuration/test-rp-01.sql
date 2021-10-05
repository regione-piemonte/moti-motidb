-- utenti demo
INSERT INTO moti_T_UTENTE (id_utente, codice_fiscale, COGNOME, NOME, fk_id_ruolo, flag_accesso_sistema, DATA_INSERIMENTO, DATA_ULTIMA_MODIFICA) 
SELECT tmp.id_utente, tmp.cf, tmp.cognome, tmp.nome, 1, true, TIMESTAMP '2020-11-03 00:00:00.000000', null
FROM (VALUES
  (10001, 'Demo', '20', 'AAAAAA00B77B000F')
) AS tmp(id_utente, nome, cognome, cf)
WHERE NOT EXISTS (
  SELECT 1
  FROM moti.moti_T_UTENTE tu
  WHERE tu.codice_fiscale = tmp.cf
);

INSERT INTO moti_T_UTENTE (id_utente, codice_fiscale, COGNOME, NOME, fk_id_ruolo, flag_accesso_sistema, DATA_INSERIMENTO, DATA_ULTIMA_MODIFICA) 
SELECT tmp.id_utente, tmp.cf, tmp.cognome, tmp.nome, 1, true, TIMESTAMP '2020-11-03 00:00:00.000000', null
FROM (VALUES
  (10002, 'Demo', '21', 'AAAAAA00A11B000J')
) AS tmp(id_utente, nome, cognome, cf)
WHERE NOT EXISTS (
  SELECT 1
  FROM moti.moti_T_UTENTE tu
  WHERE tu.codice_fiscale = tmp.cf
);

INSERT INTO moti_T_UTENTE (id_utente, codice_fiscale, COGNOME, NOME, fk_id_ruolo, flag_accesso_sistema, DATA_INSERIMENTO, DATA_ULTIMA_MODIFICA) 
SELECT tmp.id_utente, tmp.cf, tmp.cognome, tmp.nome, 1, true, TIMESTAMP '2020-11-03 00:00:00.000000', null
FROM (VALUES
  (10003, 'Demo', '22', 'AAAAAA00A11C000K')
) AS tmp(id_utente, nome, cognome, cf)
WHERE NOT EXISTS (
  SELECT 1
  FROM moti.moti_T_UTENTE tu
  WHERE tu.codice_fiscale = tmp.cf
);

