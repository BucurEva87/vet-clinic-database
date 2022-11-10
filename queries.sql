/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2018-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gaubumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

SELECT COUNT(id) FROM animals;
SELECT COUNT(id) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;

SELECT name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 1;
SELECT owners.full_name,animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;
SELECT species.name, COUNT(animals.name) FROM animals JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Jennifer Orwell';
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;
SELECT owners.full_name, COUNT(animals.name) FROM owners LEFT JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(animals.name) DESC;

SELECT animals.name FROM animals INNER JOIN visits ON animals.id = visits.animal_id INNER JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(*) FROM (SELECT vets.name FROM visits JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Maisy Smith' GROUP BY vets.name, visits.animal_id) AS table_of_visits;
SELECT v.name, s2.name FROM vets AS v LEFT JOIN specializations AS s1 ON v.id = s1.vet_id LEFT JOIN species AS s2 ON s1.specie_id = s2.id ORDER BY v.id;
SELECT DISTINCT animals.name FROM vets JOIN visits ON vets.id = visits.vet_id JOIN animals ON animals.id = visits.animal_id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
SELECT animals.name FROM visits JOIN animals ON visits.animal_id = animals.id GROUP BY animals.name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT animals.name FROM vets JOIN visits ON vets.id = visits.vet_id JOIN animals ON visits.animal_id = animals.id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit LIMIT 1;
SELECT a.id AS animal_id, a.name AS animal_name, date_of_birth, neutered, weight_kg, v.id AS vet_id, v.name AS vet_name, age, date_of_graduation FROM animals AS a JOIN visits ON a.id = visits.animal_id JOIN vets AS v ON visits.vet_id = v.id;
SELECT COUNT(*) FROM vets AS ve JOIN visits AS vi ON ve.id = vi.vet_id FULL JOIN specializations AS sz ON ve.id = sz.vet_id JOIN animals AS a ON vi.animal_id = a.id WHERE sz.specie_id IS NULL OR sz.specie_id != a.species_id;
SELECT sp.name FROM vets AS ve JOIN visits AS vi ON ve.id = vi.vet_id JOIN animals AS a ON vi.animal_id = a.id JOIN species AS sp ON a.species_id = sp.id WHERE ve.name = 'Maisy Smith' GROUP BY sp.name ORDER BY COUNT(sp.name) DESC LIMIT 1;
