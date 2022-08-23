-- creata table called patient with fild id, name and date_of_birth.
CREATE TABLE patient (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR,
    date_of_birth DATE
);

-- creata table called medical histories.
CREATE TABLE medical_histories (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admited_at timestamp NOT NULL,
    patient_id INT NOT NULL,
    status VARCHAR NOT NULL
);