CREATE TABLE Proveedores (
    proveedor_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(255),
    numero_contacto VARCHAR(15)
);

CREATE TABLE Medicamentos (
    medicamento_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    cantidad_stock INT,
    fecha_vencimiento DATE,
    proveedor_id INT,
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id)
);

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

CREATE TABLE Ventas (
    id_ventas INT PRIMARY KEY,
    fecha DATE,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Detalles_de_ventas (
    id_detalle_ventas INT PRIMARY KEY,
    id_ventas INT,
    medicamento_id INT,
    cantidad_vendida INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_ventas) REFERENCES Ventas(id_ventas),
    FOREIGN KEY (medicamento_id) REFERENCES Medicamentos(medicamento_id)
);

--Consultas para insertar datos...

INSERT INTO Medicamentos (medicamento_id, nombre, descripcion, precio, cantidad_stock, fecha_vencimiento, proveedor_id)
VALUES
    (1, 'Acetaminofen', 'Fiebre', 10.99, 100, '2023-12-31', 1),
    (2, 'Novalgina', 'Dolor de cabeza', 7.49, 50, '2023-10-15', 2),
    (3, 'Komilón', 'Apetito', 15.25, 75, '2023-11-20', 1),
    (4, 'Ana-Dent', 'Dolor de dientes', 7.49, 50, '2023-10-15', 3),
    (5, 'Novalgina', 'Dolor de cabeza', 7.49, 50, '2023-10-15', 2);

INSERT INTO Proveedores (proveedor_id, nombre, direccion, numero_contacto)
VALUES
    (1, 'Javier Chávez', 'San Miguel', '6423-7653'),
    (2, 'Pedro Picapiedra', 'Piedra dura', '8899-7837'),
    (3, 'Javier Chávez', 'San Miguel', '6423-7653'),
    (4, 'Andres Parra', 'Colombia', '6545-4565'),
    (5, 'Ana Paula', 'San Miguel', '6423-6454');

INSERT INTO Clientes (id_cliente, nombre, direccion, telefono)
VALUES
    (1, 'Chepe loco', 'San Salvador', '2433-5654'),
    (2, 'Carlos Villagrán', 'San Vicente', '2525-2525'),
    (3, 'Chepe loco', 'San Salvador', '2567-8929'),
    (4, 'Roberto Perez', 'México', '6754-3467'),
    (5, 'Pedro Lopez', 'San Salvador', '4567-2398');

INSERT INTO Ventas (id_ventas, fecha, id_cliente)
VALUES
    (1, '2023-09-20', 1),
    (2, '2023-09-14', 2);

INSERT INTO Detalles_de_ventas (id_detalle_ventas, id_ventas, medicamento_id, cantidad_vendida, precio_unitario)
VALUES
    (1, 1, 1, 3, 10.99),
    (2, 1, 2, 2, 7.49),
    (3, 2, 3, 1, 15.25);

SELECT Medicamentos.nombre
FROM Medicamentos
JOIN Detalles_de_ventas ON Medicamentos.medicamento_id = Detalles_de_ventas.medicamento_id
JOIN Ventas ON Detalles_de_ventas.id_ventas = Ventas.id_ventas
WHERE Ventas.id_cliente = 1;

SELECT Proveedores.nombre
FROM Proveedores
JOIN Medicamentos ON Proveedores.proveedor_id = Medicamentos.proveedor_id
WHERE Medicamentos.nombre = 'Acetaminofen';