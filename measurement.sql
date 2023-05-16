CREATE TABLE IF NOT EXISTS data.measurement
(
    city integer,
    mark timestamp with time zone,
    temperature double precision,
    CONSTRAINT city FOREIGN KEY (city)
        REFERENCES data.city (identidier) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS data.measurement
    OWNER to postgres;
