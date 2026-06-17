CREATE TABLE IF NOT EXISTS venta (
    id_venta BIGINT AUTO_INCREMENT PRIMARY KEY,
    direccion_compra VARCHAR(255) NOT NULL,
    valor_compra INT,
    fecha_compra DATE NOT NULL,
    despacho_generado BOOLEAN DEFAULT FALSE
);