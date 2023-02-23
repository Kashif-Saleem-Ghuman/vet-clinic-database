/* Populate database with sample data. */


insert into animals (name, date_of_birth, escape_attempts ,  neutered, weight_kg )
values ('Agumon', '2020-02-03', 0, true, 10.23)

insert into animals (name, date_of_birth, escape_attempts ,  neutered, weight_kg )
values ('Gabumon', '2018-11-15', 2, true, 8) 

insert into animals (name, date_of_birth, escape_attempts ,  neutered, weight_kg )
values ('Pikachu', '2021-01-07', 1, false, 15.0) 

insert into animals (name, date_of_birth, escape_attempts ,  neutered, weight_kg )
values ('Devimon', '2017-06-12', 5, true, 11)

insert into animals (name, date_of_birth, escape_attempts ,  neutered, weight_kg)
values ('Charmander', '2020-02-08', 0, False, 11);

insert into animals (name, date_of_birth, escape_attempts ,  neutered, weight_kg)
values ('Plantmon', '2021-11-15', 2, True, 5.7);

insert into animals (name, date_of_birth, escape_attempts ,  neutered, weight_kg)
values ('Squirtle', '1993-04-02', 3, False, 12.13);

insert into animals (name, date_of_birth, escape_attempts ,  neutered, weight_kg)
values ('Angemon', '2005-06-12', 1, True, 45);

insert into animals (name, date_of_birth, escape_attempts ,  neutered, weight_kg)
values ('Boarmon', '2005-06-07', 7, True, 20.4)

insert into animals (name, date_of_birth, escape_attempts ,  neutered, weight_kg)
values ('Blossom', '1998-10-13', 3, True, 17);

insert into animals (name, date_of_birth, escape_attempts ,  neutered, weight_kg)
values ('Ditto', '2022-05-14', 4, True, 22)

-- correct wightt of Angemon 
UPDATE animals
SET weight_kg = -45
WHERE name = 'Angemon';

-- correct wightt of Charmander
UPDATE animals
SET weight_kg = -11
WHERE name = 'Charmander';

-- correct wightt of Plantmon
UPDATE animals
SET weight_kg = -5.7
WHERE name = 'Plantmon';

-- correct wightt of Squirtle
UPDATE animals
SET weight_kg = -12.13
WHERE name = 'Squirtle';

INSERT INTO owners (full_name, age)
VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

  INSERT INTO species (name)
  VALUES
  ('Pokemon'),
  ('Digimon');

UPDATE animals
SET species_id = CASE
  WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
  ELSE (SELECT id FROM species WHERE name = 'Pokemon')
END;

SET owner_id = CASE 
  WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name = 'Sam Smith')
  WHEN (name = 'Gabumon' OR name = 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
  WHEN (name = 'Devimon' OR name = 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
  WHEN (name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
  WHEN (name = 'Angemon' OR name = 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
END;

INSERT INTO vets (name, age, date_of_graduation) 
VALUES 
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations (vet_id, species_id)
VALUES 
  (1, (SELECT id FROM species WHERE name = 'Pokemon')),
  (3, (SELECT id FROM species WHERE name = 'Digimon')),
  (3, (SELECT id FROM species WHERE name = 'Pokemon')),
  (4, (SELECT id FROM species WHERE name = 'Digimon'));  

INSERT INTO visits (animal_id, vet_id, visit_date)
VALUES
  ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24'),
  ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),
  ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14'),
  ((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),
  ((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07'),
  ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
  ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03'),
  ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03'),
  ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
  ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');
