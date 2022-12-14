/* Database schema to keep the structure of entire database. */
CREATE TABLE animals(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name varchar(100)
    name VARCHAR,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL,
    species VARCHAR
);

--  Create a table to store owners.
CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    full_name VARCHAR NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY (id)
)

-- Create a table to store species.
CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    name VARCHAR NOT NULL,
    PRIMARY KEY (id)
);

-- Make sure that id is set as autoincremented PRIMAY KEY
ALTER TABLE animals ADD PRIMARY KEY (id);

-- Edit the animals table to drop the species column.
ALTER TABLE animals DROP COLUMN species;

--Add column species_id which is a foreign key refencing species table
 ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);

 --Add column owner_id which is a foreign key refencing species table
 ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

 -- Create the vets to store vets.
CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    name VARCHAR NOT NULL,
    age INT NOT NULL,
    date_fo_graduation DATE,
    PRIMARY KEY (id)
);

-- Create a join table to store species and vets.
CREATE TABLE specialization(
    species_id INT REFERENCES species(id),
    vet_id INT REFERENCES vets(id)
);

-- Create a join table to store animals and vets.
CREATE TABLE visits(
    animal_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets(id),
    date_of_visit DATE
);

-- Add new column to owners table.
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Alter owners table set age to null.
ALTER TABLE
    owners
ALTER COLUMN
    age DROP NOT NULL;

-- Create Index on animal_id column of visits table.
CREATE INDEX animal_id_asc ON visits(animal_id asc);

-- Create Index on vet_id column of visits table.
CREATE INDEX  vet_id_asc ON visits(vet_id asc);

-- Create Index  owners_email on email column of owners table.
CREATE INDEX  owners_email  ON owners(email);
