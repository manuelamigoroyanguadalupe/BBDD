/* CREAR BASE DE DATOS*/
CREATE DATABASE Potencia_Digitalcc;
USE Potencia_Digitalcc;

/* TABLA CHARLAS */
CREATE TABLE Charlas (
    Id_charla SMALLINT IDENTITY(1,1) PRIMARY KEY, /*Identificador único de la charla*/
    Nombre_Eventos VARCHAR(255) NOT NULL, /*Nombre del evento o charla*/
    Informacion_adicional VARCHAR(MAX) NULL /*Informacion_adicional que se quiera añadir (no obligatorio por eso es NULL)*/
);


/* TABLA FECHAS_CHARLAS */
CREATE TABLE Fechas_Charlas (
    Id_charla SMALLINT NOT NULL,
    Fecha DATE NOT NULL,  /*Fecha en la que se realiza la charla*/
    Hora TIME NOT NULL,

    PRIMARY KEY (Id_charla, Fecha, Hora),

    FOREIGN KEY (Id_charla) REFERENCES Charlas(Id_charla),
    FOREIGN KEY (Fecha) REFERENCES Fechas(Fecha)
);


/* TABLA USUARIO */
CREATE TABLE Usuario (
    Id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    N_Telefono CHAR(13) NOT NULL UNIQUE
);

/* TABLA PONENTE  */
CREATE TABLE Ponente (
    Id_ponente TINYINT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL
);


/* TABLA CHARLA_PONENTE */
CREATE TABLE Charla_Ponente (
    Id_charla SMALLINT NOT NULL,
    Id_ponente TINYINT NOT NULL,

    PRIMARY KEY (Id_charla, Id_ponente),

    FOREIGN KEY (Id_charla) REFERENCES Charlas(Id_charla),
    FOREIGN KEY (Id_ponente) REFERENCES Ponente(Id_ponente)
);


/* TABLA VALORACION_USUARIO */
CREATE TABLE Valoracion_Usuario (
    Id_usuario INT NOT NULL,
    Id_charla SMALLINT NOT NULL,
    Valoracion DECIMAL(4,2) NOT NULL,

    PRIMARY KEY (Id_usuario, Id_charla),

    FOREIGN KEY (Id_usuario) REFERENCES Usuario(Id_usuario),
    FOREIGN KEY (Id_charla) REFERENCES Charlas(Id_charla)
);

/* TABLA COSTE_PONENTE */
CREATE TABLE Coste_Ponente (
    Id_ponente TINYINT NOT NULL,
    Id_charla SMALLINT NOT NULL,
    Costo_charla SMALLMONEY NULL,

    PRIMARY KEY (Id_ponente, Id_charla),

    FOREIGN KEY (Id_ponente) REFERENCES Ponente(Id_ponente),
    FOREIGN KEY (Id_charla) REFERENCES Charlas(Id_charla),

    CHECK (Costo_charla > 0)
);

