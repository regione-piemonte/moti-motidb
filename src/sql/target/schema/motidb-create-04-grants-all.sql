
------------
-- GRANTS --
------------
grant usage on schema moti to moti_rw;
--grant usage on schema moti  to moti_ro;
grant select, update on all sequences in schema moti  to moti_rw;
grant select, insert, update, delete on all tables in schema moti  to moti_rw; 
grant execute on all functions in schema moti  to moti_rw;
--grant select on all tables in schema moti to moti_ro; 
