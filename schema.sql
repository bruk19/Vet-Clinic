/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
CREATE TABLE animals(
    name varchar(100)
    id INT,
    name VARCHAR,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL
);
);