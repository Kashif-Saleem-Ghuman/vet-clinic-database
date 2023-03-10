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


 CREATE TABLE IF NOT EXISTS public.owners
(
    id integer NOT NULL DEFAULT 'nextval('owners_id_seq'::regclass)',
    full_name character varying COLLATE pg_catalog."default",
    age integer,
    CONSTRAINT owners_pkey PRIMARY KEY (id)
)

CREATE TABLE IF NOT EXISTS public.species
(
    id integer NOT NULL DEFAULT 'nextval('species_id_seq'::regclass)',
    name character varying COLLATE pg_catalog."default",
    CONSTRAINT species_pkey PRIMARY KEY (id)
)

ALTER TABLE animals
  DROP COLUMN IF EXISTS species,
  ADD COLUMN species_id INTEGER,
  ADD COLUMN owner_id INTEGER,
  ADD CONSTRAINT fk_animals_species FOREIGN KEY (species_id) REFERENCES species(id),
  ADD CONSTRAINT fk_animals_owners FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE IF NOT EXISTS public.vets
(
    id integer NOT NULL DEFAULT 'nextval('vets_id_seq'::regclass)',
    name character varying(50) COLLATE pg_catalog."default",
    age integer,
    date_of_graduation date,
    CONSTRAINT vets_pkey PRIMARY KEY (id)
)

CREATE TABLE specializations (
  vet_id INTEGER,
  species_id INTEGER,
  PRIMARY KEY (vet_id, species_id),
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE visits (
  vet_id INTEGER,
  animal_id INTEGER,
  visit_date DATE,
  PRIMARY KEY (vet_id, animal_id, visit_date),
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (animal_id) REFERENCES animals(id)
);

  