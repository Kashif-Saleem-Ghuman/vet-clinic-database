/* Database schema to keep the structure of entire database. */

CREATE TABLE IF NOT EXISTS public.animals
(
    id integer,
    name character varying COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric
)


TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;
