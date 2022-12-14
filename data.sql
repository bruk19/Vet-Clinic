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

--Update inserted animals to include owner information(owner_id)
UPDATE animals SET owner_id = 1 WHERE name IN ('Agumon');
UPDATE animals SET owner_id = 2 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 3 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle','Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');

-- Insert new data into vets table.
INSERT INTO
    vets(name, age, date_fo_graduation)
VALUES
    ('William Tatcher', 45, '23/04/2000'),
    ('Maisy Smith', 26, '17/01/2019'),
    ('Stephanie Mendez', 64, '04/05/1981'),
    ('Jack Harkness', 38, '08/06/2008');

-- Insert new data into specialization table.
INSERT INTO
    specialization(vet_id, species_id)
VALUES
    (1, 1),
    (3, 1),
    (4, 2);

-- Insert new data into visits table.
INSERT INTO
    visits(animal_id, vet_id, date_of_visit)
VALUES
    (1, 1, '24/05/2020'),
    (1, 3, '22/07/2020'),
    (2, 4, '02/02/2021'),
    (3, 2, '05/01/2020'),
    (3, 2, '08/03/2020'),
    (3, 2, '14/05/2020'),
    (4, 3, '04/05/2021'),
    (5, 4, '24/02/2021'),
    (6, 2, '21/12/2019'),
    (6, 1, '10/08/2020'),
    (6, 2, '07/04/2021'),
    (7, 3, '29/09/2019'),
    (8, 4, '03/10/2020'),
    (8, 4, '04/11/2020'),
    (9, 2, '24/01/2019'),
    (9, 2, '15/05/2019'),
    (9, 2, '27/02/2020'),
    (9, 2, '03/08/2020'),
    (10, 3, '24/05/2020'),
    (10, 1, '01/01/2021');

-- insert into visits table
INSERT INTO 
  visits (animal_id, vet_id, date_of_visit) 
  SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids,
   generate_series(
    '1980-01-01'::timestamp, '2021-01-01', '4 hours'
   )
    visit_timestamp;

-- insert into owners
INSERT INTO
  owners (full_name, email) select 
  'Owner ' || generate_series(1,2500000),
  'owner_' || generate_series(1,2500000) || '@mail.com';
  