-- Crear la base de datos
CREATE DATABASE GestionProyectos;
GO

-- Usar la base de datos
USE GestionProyectos;
GO

-- Tabla de Categorías
CREATE TABLE Categoria (
    CategoriaID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL UNIQUE
);
GO

-- Insertar categorías iniciales (verificar si no existen)
IF NOT EXISTS (SELECT 1 FROM Categoria WHERE Nombre = 'Administrador')
    INSERT INTO Categoria (Nombre) VALUES ('Administrador');
IF NOT EXISTS (SELECT 1 FROM Categoria WHERE Nombre = 'Operario')
    INSERT INTO Categoria (Nombre) VALUES ('Operario');
IF NOT EXISTS (SELECT 1 FROM Categoria WHERE Nombre = 'Peón')
    INSERT INTO Categoria (Nombre) VALUES ('Peón');
GO

-- Tabla de Empleados
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY IDENTITY(1,1),
    NumeroCarnet NVARCHAR(50) NOT NULL UNIQUE,
    Nombre NVARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    CategoriaID INT NOT NULL,
    Salario DECIMAL(10,2) CHECK (Salario BETWEEN 250000 AND 500000) NOT NULL DEFAULT 250000,
    Direccion NVARCHAR(150) DEFAULT 'San José',
    Telefono NVARCHAR(20) NOT NULL,
    Correo NVARCHAR(100) NOT NULL UNIQUE,
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);
GO

-- Tabla de Proyectos
CREATE TABLE Proyectos (
    ProyectoID INT PRIMARY KEY IDENTITY(1,1),
    Codigo NVARCHAR(50) NOT NULL UNIQUE,
    Nombre NVARCHAR(100) NOT NULL UNIQUE,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL
);
GO

-- Tabla de Asignaciones
CREATE TABLE Asignaciones (
    AsignacionID INT PRIMARY KEY IDENTITY(1,1),
    EmpleadoID INT NOT NULL,
    ProyectoID INT NOT NULL,
    FechaAsignacion DATE NOT NULL DEFAULT GETDATE(),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID) ON DELETE CASCADE,
    FOREIGN KEY (ProyectoID) REFERENCES Proyectos(ProyectoID) ON DELETE CASCADE
);
GO

-- Procedimientos para la tabla Categoría
CREATE PROCEDURE InsertarCategoria
    @Nombre NVARCHAR(50)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Categoria WHERE Nombre = @Nombre)
    BEGIN
        INSERT INTO Categoria (Nombre) VALUES (@Nombre);
    END;
END;
GO

CREATE PROCEDURE ConsultarCategorias
AS
BEGIN
    SELECT * FROM Categoria;
END;
GO

-- Procedimientos para la tabla Empleados
CREATE PROCEDURE InsertarEmpleado
    @NumeroCarnet NVARCHAR(50),
    @Nombre NVARCHAR(100),
    @FechaNacimiento DATE,
    @CategoriaID INT,
    @Salario DECIMAL(10,2),
    @Direccion NVARCHAR(150),
    @Telefono NVARCHAR(20),
    @Correo NVARCHAR(100)
AS
BEGIN
    INSERT INTO Empleados (NumeroCarnet, Nombre, FechaNacimiento, CategoriaID, Salario, Direccion, Telefono, Correo)
    VALUES (@NumeroCarnet, @Nombre, @FechaNacimiento, @CategoriaID, @Salario, @Direccion, @Telefono, @Correo);
END;
GO

CREATE PROCEDURE ConsultarEmpleados
AS
BEGIN
    SELECT E.EmpleadoID, E.NumeroCarnet, E.Nombre, E.FechaNacimiento, C.Nombre AS Categoria, 
           E.Salario, E.Direccion, E.Telefono, E.Correo
    FROM Empleados E
    INNER JOIN Categoria C ON E.CategoriaID = C.CategoriaID;
END;
GO

CREATE PROCEDURE EliminarEmpleado
    @EmpleadoID INT
AS
BEGIN
    DELETE FROM Empleados WHERE EmpleadoID = @EmpleadoID;
END;
GO

-- Procedimientos para la tabla Proyectos
CREATE PROCEDURE InsertarProyecto
    @Codigo NVARCHAR(50),
    @Nombre NVARCHAR(100),
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    INSERT INTO Proyectos (Codigo, Nombre, FechaInicio, FechaFin)
    VALUES (@Codigo, @Nombre, @FechaInicio, @FechaFin);
END;
GO

CREATE PROCEDURE ConsultarProyectos
AS
BEGIN
    SELECT ProyectoID, Codigo, Nombre, FechaInicio, FechaFin FROM Proyectos;
END;
GO

CREATE PROCEDURE EliminarProyecto
    @ProyectoID INT
AS
BEGIN
    DELETE FROM Proyectos WHERE ProyectoID = @ProyectoID;
END;
GO

-- Procedimientos para la tabla Asignaciones
CREATE PROCEDURE InsertarAsignacion
    @EmpleadoID INT,
    @ProyectoID INT
AS
BEGIN
    INSERT INTO Asignaciones (EmpleadoID, ProyectoID, FechaAsignacion)
    VALUES (@EmpleadoID, @ProyectoID, GETDATE());
END;
GO

CREATE PROCEDURE ConsultarAsignaciones
AS
BEGIN
    SELECT A.AsignacionID, E.Nombre AS Empleado, P.Nombre AS Proyecto, A.FechaAsignacion
    FROM Asignaciones A
    INNER JOIN Empleados E ON A.EmpleadoID = E.EmpleadoID
    INNER JOIN Proyectos P ON A.ProyectoID = P.ProyectoID;
END;
GO

CREATE PROCEDURE EliminarAsignacion
    @AsignacionID INT
AS
BEGIN
    DELETE FROM Asignaciones WHERE AsignacionID = @AsignacionID;
END;
GO
