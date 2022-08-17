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