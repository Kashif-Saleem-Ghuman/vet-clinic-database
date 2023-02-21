/* Database schema to keep the structure of entire database. */

CREATE TABLE IF NOT EXISTS public.animals
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    species character varying COLLATE pg_catalog."default",
    CONSTRAINT animals_pkey PRIMARY KEY (id)
)


TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;
