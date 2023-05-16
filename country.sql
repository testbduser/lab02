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
