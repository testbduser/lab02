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
