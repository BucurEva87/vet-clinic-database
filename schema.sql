/* Database schema to keep the structure of entire database. */

CREATE TABLE IF NOT EXISTS owners (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100),
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS species (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS animals (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    escape_attempts int,
    neutered boolean,
    weight_kg decimal,
    species_id int,
    owner_id int,
    fk_animals_species int,
    fk_animals_owner int,
    PRIMARY KEY(id),
    FOREIGN KEY(species_id) REFERENCES species(id),
    FOREIGN KEY(owner_id) REFERENCES owners(id)
);

CREATE TABLE IF NOT EXISTS vets (
    id SERIAL PRIMARY KEY,
    name varchar(100),
    age int,
    date_of_graduation date
);

CREATE TABLE IF NOT EXISTS specializations (
    vet_id int,
    specie_id int
);

CREATE TABLE IF NOT EXISTS visits (
    vet_id int,
    animal_id int,
    date_of_visit date
);
