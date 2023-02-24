-- In case tables exists already

-- Drop the Animal table
IF OBJECT_ID('dbo.Animal', 'U') IS NOT NULL
DROP TABLE dbo.Animal;

-- Drop the Especie table
IF OBJECT_ID('dbo.Especie', 'U') IS NOT NULL
DROP TABLE dbo.Especie;

-- Drop the Zoologico table
IF OBJECT_ID('dbo.Zoologico', 'U') IS NOT NULL
DROP TABLE dbo.Zoologico;

-- Create the Zoologico table
CREATE TABLE Zoologico (
  IdZoo INT PRIMARY KEY IDENTITY(1,1),
  Nombre VARCHAR(50) NOT NULL,
  Ciudad VARCHAR(50) NOT NULL,
  Pais VARCHAR(50) NOT NULL,
  Tamano INT NOT NULL,
  PresupuestoAnual DECIMAL(18,2) NOT NULL
);

-- Create the Especie table
CREATE TABLE Especie (
  IdEspecie INT PRIMARY KEY IDENTITY(1,1),
  NombreComun VARCHAR(50) NOT NULL,
  NombreCientifico VARCHAR(50) NOT NULL,
  Familia VARCHAR(50) NOT NULL,
  NivelConservacion VARCHAR(50) NOT NULL
);

-- Create the Animal table
CREATE TABLE Animal (
  IdAnimal INT PRIMARY KEY IDENTITY(1,1),
  IdZoo INT NOT NULL,
  IdEspecie INT NOT NULL,
  Sexo VARCHAR(10) NOT NULL,
  Edad INT NOT NULL,
  PaisOrigen VARCHAR(50) NOT NULL,
  ContinenteOrigen VARCHAR(50) NOT NULL,
  Cantidad INT NOT NULL,
  CONSTRAINT FK_Animal_Zoo FOREIGN KEY (IdZoo) REFERENCES Zoologico(IdZoo),
  CONSTRAINT FK_Animal_Especie FOREIGN KEY (IdEspecie) REFERENCES Especie(IdEspecie)
);


-- Insert 10 zoos
INSERT INTO Zoologico (Nombre, Ciudad, Pais, Tamano, PresupuestoAnual) 
VALUES 
('Zoo A', 'Ciudad A', 'Pais A', 100, 1000000.00),
('Zoo B', 'Ciudad B', 'Pais B', 200, 2000000.00),
('Zoo C', 'Ciudad C', 'Pais C', 300, 3000000.00),
('Zoo D', 'Ciudad D', 'Pais D', 400, 4000000.00),
('Zoo E', 'Ciudad E', 'Pais E', 500, 5000000.00),
('Zoo F', 'Ciudad F', 'Pais F', 600, 6000000.00),
('Zoo G', 'Ciudad G', 'Pais G', 700, 7000000.00),
('Zoo H', 'Ciudad H', 'Pais H', 800, 8000000.00),
('Zoo I', 'Ciudad I', 'Pais I', 900, 9000000.00),
('Zoo J', 'Ciudad J', 'Pais J', 1000, 10000000.00);

-- Insert 10 species
INSERT INTO Especie (NombreComun, NombreCientifico, Familia, NivelConservacion)
VALUES 
('León', 'Panthera leo', 'Felidae', 'Preocupación menor'),
('Jirafa', 'Giraffa camelopardalis', 'Giraffidae', 'Preocupación menor'),
('Elefante africano', 'Loxodonta africana', 'Elephantidae', 'Vulnerable'),
('Cebra', 'Equus quagga', 'Equidae', 'Preocupación menor'),
('Rinoceronte negro', 'Diceros bicornis', 'Rhinocerotidae', 'En peligro crítico'),
('Hipopótamo', 'Hippopotamus amphibius', 'Hippopotamidae', 'Vulnerable'),
('Gorila', 'Gorilla beringei', 'Hominidae', 'En peligro crítico'),
('Orangután', 'Pongo pygmaeus', 'Hominidae', 'En peligro crítico'),
('Tigre', 'Panthera tigris', 'Felidae', 'En peligro de extinción'),
('Oso polar', 'Ursus maritimus', 'Ursidae', 'Vulnerable');

-- Insert 100 animals, 10 for each zoo
DECLARE @i INT = 1;
DECLARE @j INT;

WHILE @i <= 10
BEGIN
  SET @j = 1;
  WHILE @j <= 10
  BEGIN
    INSERT INTO Animal (IdZoo, IdEspecie, Sexo, Edad, PaisOrigen, ContinenteOrigen, Cantidad)
    VALUES (@i, @j, 'Macho', FLOOR(RAND()*(10-1+1)+1), 'PaisOrigen', 'ContinenteOrigen', 1);
    SET @j = @j + 1;
  END
  SET @i = @i + 1;
END
