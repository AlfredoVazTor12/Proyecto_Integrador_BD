CREATE DATABASE IF NOT EXISTS control_estudios;
USE control_estudios;

DROP TABLE IF EXISTS documento;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS categoria;
DROP TABLE IF EXISTS ministerio;
DROP TABLE IF EXISTS rol;

CREATE TABLE rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
) ENGINE=InnoDB;

CREATE TABLE ministerio (
    id_ministerio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_ministerio VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    id_rol INT NOT NULL,
    CONSTRAINT fk_usuario_rol FOREIGN KEY (id_rol)
        REFERENCES rol(id_rol) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE documento (
    id_documento INT AUTO_INCREMENT PRIMARY KEY,
    nombre_doc VARCHAR(255) NOT NULL,
    tipo_archivo VARCHAR(10) NOT NULL,
    fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ruta_fisica VARCHAR(500) NOT NULL,
    id_usuario INT NOT NULL,
    id_ministerio INT NOT NULL,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_documento_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_documento_ministerio FOREIGN KEY (id_ministerio)
        REFERENCES ministerio(id_ministerio) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_documento_categoria FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;
