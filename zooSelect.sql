Select * from Zoologico;
Select * from Especie;
Select * from Animal;


--Select all zoos in a particular country:

SELECT * FROM Zoologico WHERE Pais = 'Pais A';


-- Select all animals in a particular zoo:
SELECT Animal.*, Especie.NombreComun, Especie.Familia 
FROM Animal 
JOIN Especie ON Animal.IdEspecie = Especie.IdEspecie 
WHERE Animal.IdZoo = 1;

-- Select all zoos that have at least one animal from a particular species:
SELECT DISTINCT Zoologico.* FROM Zoologico
JOIN Animal ON Zoologico.IdZoo = Animal.IdZoo
WHERE Animal.IdEspecie = 1;

--Select all animals from a particular family that are currently in a zoo:
SELECT Animal.*, Especie.NombreComun, Zoologico.Nombre AS NombreZoo 
FROM Animal 
JOIN Especie ON Animal.IdEspecie = Especie.IdEspecie 
JOIN Zoologico ON Animal.IdZoo = Zoologico.IdZoo 
WHERE Especie.Familia = 'Felidae';


--Select all animals in a particular zoo from a particular species:
SELECT Animal.*, Especie.NombreComun 
FROM Animal 
JOIN Especie ON Animal.IdEspecie = Especie.IdEspecie 
WHERE Animal.IdZoo = 1 AND Especie.NombreComun = 'León';

