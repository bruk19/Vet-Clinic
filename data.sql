/* Populate database with sample data. */
INSERT INTO
    animals(
        id,
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (1, 'Agumon', '03/02/2020', 0, TRUE, 10.23),
    (2, 'Gabumon', '15/11/2018', 2, TRUE, 8),
    (3, 'Pikachu', '07/01/2021', 1, FALSE, 15.04),
    (4, 'Devimon', '12/05/2017', 5, TRUE, 11);

-- Instert new data into animals table.
INSERT INTO
    animals(
        id,
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    (5, 'Charmander', '08/02/2020', 0, FALSE, -11.0),
    (6, 'Plantmon', '15/11/2021', 2, TRUE, -5.7),
    (7, 'Squirtle', '02/04/1993', 3, FALSE, -12.13),
    (8, 'Angemon', '12/06/205', 1, TRUE, -45.0),
    (9, 'Boarmon', '07/06/2005', 7, TRUE, 20.4),
    (10, 'Blossom', '13/10/1998', 3, TRUE, 17.0),
    (11, 'Ditto', '14/05/2022', 4, TRUE, 22.0);

-- Instert new data into owners table.
INSERT INTO
    owners(
        full_name, 
        age
        )
VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Wincheste', 14),
    ('Jodie Whittaker', 38);

-- Instert new data into species table.
INSERT INTO
    species(
        name
    )
VALUES
    ('Pokemon'),
    ('Digimon');

-- modify inserted animals it includes species_id with ends in 'mon' values
UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

-- modify inserted animals it includes species_id the other lefts
UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;