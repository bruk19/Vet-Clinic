/*Queries that provide answers to the questions from all projects.*/
SELECT *from animals
WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.
SELECT * from animals
WHERE date_of_birth 
BETWEEN '01/01/2016' AND '31/12/2019';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name from animals
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
SELECT *FROM animals
WHERE neutered=TRUE;

-- Find all animals not named Gabumon.
SELECT *FROM animals
WHERE name!='Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT *FROM animals
WHERE weight_kg 
BETWEEN 10.4 AND 17.3;

-- Update the animals table by setting the species column to 'unspecified'
BEGIN;
SAVEPOINT sp1;
UPDATE animals 
SET species = 'unspecified';

-- Verify changes by
select * from animals

-- Roll back the change
ROLLBACK TO sp1;
-- verify the species columns went back to the state before the transaction

select * from animals
-- Commit the change 
COMMIT;

-- NEW TRANSACTION
BEGIN;
-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
SAVEPOINT sp1;
UPDATE animals 
SET species = 'digimon'
WHERE name LIKE '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
SAVEPOINT sp2;
UPDATE animals 
SET species = 'pokemon '
WHERE species IS NULL;

-- Commit the transaction.
COMMIT;
-- Verify that change was made and persists after commit.
SELECT * FROM animals;
-- Commit the transaction.
COMMIT;

-- NEW TRANSACTION
BEGIN;
SAVEPOINT sp1;
--  delete all records in the animals table
DELETE FROM animals;
-- Roll back the transaction
ROLLBACK TO sp1;
-- Verify that the table is not empty
SELECT * FROM animals;
-- Commit the transaction.
COMMIT;

-- NEW TRANSACTION
BEGIN;
DELETE FROM animals WHERE date_of_birth > '01/01/2022';

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg  = (weight_kg * (-1));
-- Rollback to the savepoint
ROLLBACK TO sp1;
-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg  = (weight_kg * (-1)) WHERE weight_kg < 0;
-- Commit the transaction.
COMMIT;

/*QUESTIIONS QUERIES*/

-- How many animals are there? => 11
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape? => 2
SELECT COUNT(*) FROM animals where escape_attempts = 0;

-- What is the average weight of animals? => 16.1363636363636364
SELECT AVG(weight_kg) FROM animals; 

-- Who escapes the most, neutered or not neutered animals? => neutered
SELECT neutered, AVG(escape_attempts) as AVG_escape
FROM animals
GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal? => pokemon [MAX : 22kg, MIN : 11kg], digimon [MAX : 45kg, MIN : 5.7kg]
SELECT MAX(weight_kg),MIN(weight_kg), species
FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000? => pokemon [AVG : 3], digimon : NULL
SELECT species,AVG(escape_attempts)
FROM animals
WHERE date_of_birth 
BETWEEN '01/01/1990' AND '31/12/2000'
GROUP BY species;
