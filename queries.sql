/*Queries that provide answers to the questions from all projects.*/
select *
from animals
WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
select * from animals
WHERE date_of_birth 
BETWEEN '01/01/2016' AND '31/12/2019';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
select name from animals
WHERE neutered=TRUE 
AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth from animals
WHERE name='Agumon' 
OR name='Pikachu';

-- List name and escape attempts of animals that weight more than 10.5kg
SELECT name,escape_attempts 
FROM animals
WHERE weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT *
FROM animals
WHERE neutered=TRUE;


