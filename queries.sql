/*Queries that provide answers to the questions from all projects.*/

select * from table where Name like '%mon'
select name from animals where extract(year from date_of_birth) between '2016' and '2019'
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg>10.5
SELECT name FROM animals WHERE neutered=true
SELECT * FROM animals WHERE name <> 'Gabumon'
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
