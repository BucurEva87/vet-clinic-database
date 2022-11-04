/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal,
    PRIMARY KEY(id)
);

ALTER TABLE animals ADD COLUMN species varchar(100);

CREATE TABLE owners (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100),
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    PRIMARY KEY(id)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_animals_species FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT;

ALTER TABLE animals ADD CONSTRAINT fk_animals_owner FOREIGN KEY (owner_id) REFERENCES owners(id);
