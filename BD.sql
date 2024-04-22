CREATE DATABASE IF NOT EXISTS dolmentdb;

USE dolmentdb;

CREATE TABLE Categorias (
    id INT AUTO_INCREMENT NOT NULL,
    Nombre_Categoria VARCHAR(100) NOT NULL,
    Detalles VARCHAR(500),
    PRIMARY KEY (id)
);

CREATE TABLE cEstado (
    id INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Entradas (
    id INT AUTO_INCREMENT NOT NULL,
    fecha VARCHAR(20) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    idEstado INT NOT NULL,
    valorDolar DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (idEstado) REFERENCES cEstado(id)
);

CREATE TABLE Perdida (
    id INT AUTO_INCREMENT NOT NULL,
    Fecha VARCHAR(20) NOT NULL,
    idEstado INT NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (idEstado) REFERENCES cEstado(id)
);

CREATE TABLE Productos (
    id INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(500) NOT NULL,
    Codigo VARCHAR(50) UNIQUE NOT NULL,
    SKU VARCHAR(50) NOT NULL,
    ID_Categoria INT NOT NULL,
    idcEstado INT NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    Costo DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    fechaCreacion VARCHAR(20) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(id),
    FOREIGN KEY (idcEstado) REFERENCES cEstado(id)
);

CREATE TABLE Ventas (
    id INT AUTO_INCREMENT NOT NULL,
    Fecha VARCHAR(20) NOT NULL,
    idEstado INT NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (idEstado) REFERENCES cEstado(id)
);

CREATE TABLE Detalle_Entradas (
    id INT AUTO_INCREMENT NOT NULL,
    idEntrada INT NOT NULL,
    idProducto INT NOT NULL,
    cantidad INT NOT NULL,
    precioUnitario DECIMAL(10, 2) NOT NULL,
    costoUnitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (idEntrada) REFERENCES Entradas(id),
    FOREIGN KEY (idProducto) REFERENCES Productos(id)
);

CREATE TABLE Detalle_perdida (
    id INT AUTO_INCREMENT NOT NULL,
    idPerdida INT NOT NULL,
    costo_unitario DECIMAL(10, 2) NOT NULL,
    idProducto INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (idPerdida) REFERENCES Perdida(id),
    FOREIGN KEY (idProducto) REFERENCES Productos(id)
);

CREATE TABLE Detalle_Ventas (
    id INT AUTO_INCREMENT NOT NULL,
    idProducto INT NOT NULL,
    idVentas INT NOT NULL,
    Cantidad INT NOT NULL,
    precioUnitario DECIMAL(10, 2) NOT NULL,
    costoUnitario DECIMAL(10, 2) NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (idProducto) REFERENCES Productos(id),
    FOREIGN KEY (idVentas) REFERENCES Ventas(id)
);

-- CREACIONES NECESARIAS
INSERT INTO Categorias (Nombre_Categoria) VALUES
('Sin Categoria');

-- Inserciones para la tabla cEstado
INSERT INTO cEstado (Nombre) VALUES
('Activo'),
('Inactivo');