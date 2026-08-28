# Creación de la base de datos
CREATE DATABASE IF NOT EXISTS Veterinaria_Mi_mejor_amigo;

# Uso de la base de datos
USE Veterinaria_Mi_mejor_amigo;

# Creación de tablas
-- Datos Externos

CREATE TABLE IF NOT EXISTS Cliente (
    idCliente INT AUTO_INCREMENT,
    cedula VARCHAR(10) UNIQUE NOT NULL,
    nombre_completo VARCHAR(45) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    PRIMARY KEY (idCliente)
);

CREATE TABLE IF NOT EXISTS Especie (
    idEspecie INT AUTO_INCREMENT,
    especie VARCHAR(45) NOT NULL,
    PRIMARY KEY (idEspecie)
);

CREATE TABLE IF NOT EXISTS Raza (
    idRaza INT AUTO_INCREMENT,
    raza VARCHAR(45) NOT NULL,
    PRIMARY KEY (idRaza)
);

CREATE TABLE IF NOT EXISTS Sexo (
    idSexo INT AUTO_INCREMENT,
    sexo VARCHAR(45) UNIQUE NOT NULL,
    PRIMARY KEY (idSexo)
);

CREATE TABLE IF NOT EXISTS Mascota (
    idMascota INT AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    vacunada BOOLEAN NOT NULL,
    idCliente INT NOT NULL,
    idEspecie INT NOT NULL,
    idRaza INT NOT NULL,
    idSexo INT NOT NULL,
    PRIMARY KEY (idMascota),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN Key (idEspecie) REFERENCES Especie(idEspecie),
    FOREIGN KEY (idRaza) REFERENCES Raza(idRaza),
    FOREIGN KEY (idSexo) REFERENCES Sexo(idSexo)
);

-- Datos Internos

CREATE TABLE IF NOT EXISTS Veterinario (
    idVeterinario INT AUTO_INCREMENT,
    cedula VARCHAR(10) UNIQUE NOT NULL,
    nombre_completo VARCHAR(45) NOT NULL,
    telefono VARCHAR(10) NOT NULL,
    correo_electronico VARCHAR(50) UNIQUE NOT NULL,
    PRIMARY KEY (idVeterinario)
);

CREATE TABLE IF NOT EXISTS Servicio (
    idServicio INT AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    precio_base VARCHAR(45) NOT NULL,
    PRIMARY KEY (idServicio)
);

CREATE TABLE IF NOT EXISTS Visita (
    idVisita INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    idMascota INT NOT NULL,
    idVeterinario INT NOT NULL,
    idServicio INT NOT NULL,
    PRIMARY KEY (idVisita),
    FOREIGN KEY (idMascota) REFERENCES Mascota(idMascota),
    FOREIGN KEY (idVeterinario) REFERENCES Veterinario(idVeterinario),
    FOREIGN KEY (idServicio) REFERENCES Servicio(idServicio)
);

CREATE TABLE IF NOT EXISTS Tratamiento (
    idTratamiento INT AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    observaciones VARCHAR(100) NOT NULL,
    idVisita INT NOT NULL,
    PRIMARY KEY (idTratamiento),
    FOREIGN KEY (idVisita) REFERENCES Visita(idVisita)
);

