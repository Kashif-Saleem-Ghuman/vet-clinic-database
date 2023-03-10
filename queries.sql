/*Queries that provide answers to the questions from all projects.*/

select * from table where Name like '%mon'
select name from animals where extract(year from date_of_birth) between '2016' and '2019'
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg>10.5
SELECT name FROM animals WHERE neutered=true
SELECT * FROM animals WHERE name <> 'Gabumon'
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';
SELECT * FROM animals WHERE species = 'unspecified';
ROLLBACK;
SELECT * FROM animals WHERE species <> 'unspecified';


BEGIN TRANSACTION;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;


BEGIN TRANSACTION;
DELETE FROM animals;
SELECT COUNT(*) FROM animals;
ROLLBACK;
SELECT COUNT(*) FROM animals;


BEGIN TRANSACTION;

-- Delete all animals born after Jan 1st, 2022
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction
SAVEPOINT my_savepoint;

-- Update all animals' weight to be their weight multiplied by -1
UPDATE animals
SET weight_kg = -1 * weight_kg;

-- Rollback to the savepoint
ROLLBACK TO my_savepoint;

-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals
SET weight_kg = -1 * weight_kg
WHERE weight_kg < 0;

-- Commit the transaction
COMMIT;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) as avg_weight FROM animals;

SELECT neutered, AVG(escape_attempts) as avg_escape_attempts
FROM animals
GROUP BY neutered;

SELECT species, MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN DATE '1990-01-01' AND DATE '2000-12-31'
GROUP BY species;

SELECT name FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(animals.id) as count
FROM species
LEFT JOIN animals ON species.id = animals.species_id
GROUP BY species.id;

SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Orwell';

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE escape_attempts = 0 AND owners.full_name = 'Dean Winchester'

SELECT owners.full_name, COUNT(animals.id) as count
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.id
ORDER BY count DESC
LIMIT 1;

SELECT a.*
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vet ON vet.id = v.vet_id
WHERE vet.name = 'William Tatcher'
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT a.id) as num_animals
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vet ON vet.id = v.vet_id
WHERE vet.name = 'Stephanie Mendez';

SELECT vets.name, COALESCE(array_to_string(array_agg(s.name), ', '), 'none') AS specialties
FROM vets
LEFT JOIN specializations sp ON vets.id = sp.vet_id
LEFT JOIN species s ON sp.species_id = s.id
GROUP BY vets.id;

SELECT a.*
FROM animals a
JOIN visits v ON a.id = v.animal_id
JOIN vets vet ON vet.id = v.vet_id
WHERE vet.name = 'Stephanie Mendez'
AND v.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT a.name, COUNT(v.*) as num_visits
FROM animals a
JOIN visits v ON a.id = v.animal_id
GROUP BY a.id
ORDER BY num_visits DESC
LIMIT 1;

SELECT a.name, v.visit_date
FROM visits v
INNER JOIN animals a ON v.animal_id = a.id
WHERE v.vet_id IN (SELECT id FROM vets WHERE name = 'Maisy Smith')
ORDER BY v.visit_date ASC
LIMIT 1;

SELECT a.name AS animal_name, vt.name AS vet_name, v.visit_date
FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN vets vt ON v.vet_id = vt.id
WHERE v.visit_date = (SELECT MAX(visit_date) FROM visits);

SELECT COUNT(*) AS num_visits
FROM visits v
INNER JOIN vets vt ON v.vet_id = vt.id
INNER JOIN animals a ON v.animal_id = a.id
LEFT JOIN specializations sp ON vt.id = sp.vet_id AND a.species_id = sp.species_id
WHERE sp.species_id IS NULL;


SELECT s.name
FROM animals a
INNER JOIN visits v ON a.id = v.animal_id
INNER JOIN species s ON a.species_id = s.id
WHERE v.vet_id IN (SELECT id FROM vets WHERE name ILIKE '%maisy smith%')
GROUP BY s.id
ORDER BY COUNT(*) DESC
LIMIT 1;