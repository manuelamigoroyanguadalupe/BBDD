ALTER TABLE charlas
ADD CONSTRAINT fk_charlas_sala
FOREIGN KEY (id_sala)
REFERENCES Salas(id_sala);