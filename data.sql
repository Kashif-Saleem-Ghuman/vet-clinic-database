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