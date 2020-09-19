CREATE database id
use id 

CREATE SEQUENCE `seq_id_generator` start with 10000 minvalue 1 maxvalue 9223372036854775806 
increment by 0 cache 1000 nocycle ENGINE=InnoDB;