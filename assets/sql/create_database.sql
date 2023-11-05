CREATE TABLE IF NOT EXISTS farms (
    farm_id INTEGER PRIMARY KEY AUTOINCREMENT,
    farm_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS animals (
    animal_id INTEGER PRIMARY KEY AUTOINCREMENT,
    animal_tag TEXT NOT NULL,
    farm_id INTEGER NOT NULL,
    FOREIGN KEY (farm_id) REFERENCES farms(farm_id) 
);

INSERT INTO farms(farm_name) VALUES ('Fazenda Gado Forte');
INSERT INTO farms(farm_name) VALUES ('Fazenda Quinta das Vacas');
INSERT INTO farms(farm_name) VALUES ('Fazenda Terra do Gado');
INSERT INTO farms(farm_name) VALUES ('Fazenda Boiada');


INSERT INTO animals(animal_tag, farm_id) VALUES ('000000000000001', 1);
INSERT INTO animals(animal_tag, farm_id) VALUES ('000000000000002', 2);
INSERT INTO animals(animal_tag, farm_id) VALUES ('000000000000004', 3);
INSERT INTO animals(animal_tag, farm_id) VALUES ('000000000000005', 4);


