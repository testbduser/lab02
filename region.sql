CREATE TABLE IF NOT EXISTS data.region
(
    identifier integer NOT NULL,
    description character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT pk_region_id PRIMARY KEY (identifier)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS data.region
    OWNER to postgres;
