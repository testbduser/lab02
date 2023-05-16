CREATE TABLE IF NOT EXISTS data.city
(
    identidier integer NOT NULL,
    country integer,
    latitude double precision,
    longitude double precision,
    description character varying(50) COLLATE pg_catalog."default",
    dataset character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT pk_city_id PRIMARY KEY (identidier),
    CONSTRAINT country FOREIGN KEY (country)
        REFERENCES data.country (identifier) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS data.city
    OWNER to postgres;
