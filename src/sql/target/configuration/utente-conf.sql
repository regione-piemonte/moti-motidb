INSERT INTO moti.moti_t_utente (utente_id, utente_nome, utente_cognome, utente_codice_fiscale, utente_creazione, utente_modifica)
SELECT uuid_generate_v5(tun.uuid_namespace_value::uuid, tmp.cf), tmp.nome, tmp.cognome, tmp.cf, 'admin', 'admin'
FROM (VALUES
	('Demo', '20', 'AAAAAA00B77B000F'),
	('Demo', '21', 'AAAAAA00A11B000J'),
	('Demo', '22', 'AAAAAA00A11C000K')
) AS tmp(nome, cognome, cf)
JOIN moti.moti_t_uuid_namespace tun ON (tun.uuid_namespace_table = 'moti_t_utente')
WHERE NOT EXISTS (
	SELECT 1
	FROM moti.moti_t_utente tu
	WHERE tu.utente_codice_fiscale = tmp.cf
);


