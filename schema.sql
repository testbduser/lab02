CREATE SCHEMA IF NOT EXISTS data
    AUTHORIZATION postgres;

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

CREATE TABLE IF NOT EXISTS data.coastine
(
    shape integer,
    segment integer,
    latitude double precision,
    longitude double precision
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS data.coastine
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS data.country
(
    identifier integer NOT NULL,
    region integer,
    description character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT pk_country_id PRIMARY KEY (identifier),
    CONSTRAINT region FOREIGN KEY (region)
        REFERENCES data.region (identifier) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS data.country
    OWNER to postgres;


CREATE INDEX IF NOT EXISTS fki_region
    ON data.country USING btree
    (region ASC NULLS LAST)
    TABLESPACE pg_default;

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

CREATE TABLE IF NOT EXISTS data.region
(
    identifier integer NOT NULL,
    description character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT pk_region_id PRIMARY KEY (identifier)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS data.region
    OWNER to postgres;
