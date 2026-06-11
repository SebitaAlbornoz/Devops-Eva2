CREATE DATABASE IF NOT EXISTS innovatech_app;
USE innovatech_app;

-- 1. Tabla Ventas basada exactamente en Venta.java
CREATE TABLE IF NOT EXISTS venta (
    id_venta BIGINT AUTO_INCREMENT PRIMARY KEY,
    direccion_compra VARCHAR(255) NOT NULL,
    valor_compra INT NOT NULL,
    fecha_compra DATE NOT NULL,
    despacho_generado BOOLEAN DEFAULT FALSE
);

-- 2. Tabla Despachos basada exactamente en Despacho.java
CREATE TABLE IF NOT EXISTS despacho (
    id_despacho BIGINT AUTO_INCREMENT PRIMARY KEY,
    fecha_despacho DATE,
    patente_camion VARCHAR(50),
    intento INT DEFAULT 0,
    id_compra BIGINT,
    direccion_compra VARCHAR(255),
    valor_compra BIGINT,
    despachado BOOLEAN DEFAULT FALSE
);

-- 3. Datos de prueba iniciales para que el Frontend no parta vacío
INSERT INTO venta (direccion_compra, valor_compra, fecha_compra, despacho_generado) 
VALUES ('Av. Concha y Toro 1340, Puente Alto', 25000, '2026-06-10', FALSE);

INSERT INTO venta (direccion_compra, valor_compra, fecha_compra, despacho_generado) 
VALUES ('Av. Vicuña Mackenna 4860, Macul', 42000, '2026-06-10', FALSE);