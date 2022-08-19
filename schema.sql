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