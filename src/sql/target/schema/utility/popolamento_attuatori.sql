-- inserisco gli attuatori non presenti prendendoli dal vecchio campo attuatore dell'intervento
insert into moti_d_attuatore (descrizione, data_inserimento)
select distinct attuatore, now()
from moti_t_intervento i
where i.attuatore is not null
and not exists (
	select *
	from moti_d_attuatore a
	where a.descrizione = i.attuatore 
)

-- aggiorno il nuovo campo fk_attuatore
update moti_t_intervento
set fk_attuatore = (
	select id_attuatore
	from moti_d_attuatore a
	where a.descrizione = moti_t_intervento.attuatore
)
where moti_t_intervento.fk_attuatore is null
and moti_t_intervento.attuatore is not null
