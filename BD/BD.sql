-- Tabla Roles
CREATE TABLE Roles (
    IdRol NUMBER PRIMARY KEY,
    nombre VARCHAR2(100)
);

-- Tabla Usuarios
CREATE TABLE Usuarios (
    IdUsuario NUMBER PRIMARY KEY,
    nombreUsuario VARCHAR2(100),
    contraseña VARCHAR2(100),
    IdRol NUMBER,
    FOREIGN KEY (IdRol) REFERENCES Roles(IdRol)
);

-- Tabla Clientes
CREATE TABLE Clientes (
    IdCliente NUMBER PRIMARY KEY,
    nombreCliente VARCHAR2(100),
    apellidos VARCHAR2(100),
    direccion VARCHAR2(150),
    telefono VARCHAR2(15),
    email VARCHAR2(100)
);

-- Tabla Empleados
CREATE TABLE Empleados (
    IdEmpleado NUMBER PRIMARY KEY,
    nombreEmpleado VARCHAR2(100),
    apellidos VARCHAR2(100),
    direccion VARCHAR2(150),
    telefono VARCHAR2(15),
    puesto VARCHAR2(100)
);

-- Tabla Horarios
CREATE TABLE Horarios (
    IdHorario NUMBER PRIMARY KEY,
    IdEmpleado NUMBER,
    dia DATE,
    hora_entrada NUMBER,
    hora_salida NUMBER,
    FOREIGN KEY (IdEmpleado) REFERENCES Empleados(IdEmpleado)
);

-- Tabla Proveedores
CREATE TABLE Proveedores (
    IdProveedor NUMBER PRIMARY KEY,
    nombreProveedor VARCHAR2(100),
    direccion VARCHAR2(150),
    telefono VARCHAR2(15),
    email VARCHAR2(100)
);

-- Tabla Productos
CREATE TABLE Productos (
    IdProducto NUMBER PRIMARY KEY,
    nombreProducto VARCHAR2(100),
    descripcion VARCHAR2(100),
    precio NUMBER(10,2),
    IdProveedor NUMBER,
    FOREIGN KEY (IdProveedor) REFERENCES Proveedores(IdProveedor)
);

-- Tabla Stock
CREATE TABLE Stock (
    IdStock NUMBER PRIMARY KEY,
    cantidad NUMBER,
    Productos NUMBER,
    FOREIGN KEY (Productos) REFERENCES Productos(IdProducto)
);

-- Tabla Pedidos
CREATE TABLE Pedidos (
    IdPedido NUMBER PRIMARY KEY,
    total NUMBER,
    fecha DATE,
    descripcion VARCHAR2(100),
    IdProveedor NUMBER,
    FOREIGN KEY (IdProveedor) REFERENCES Proveedores(IdProveedor)
);

-- Tabla detallePedido
CREATE TABLE detallePedido (
    IdDetalle NUMBER PRIMARY KEY,
    precioUni NUMBER,
    cantidad NUMBER,
    IdProducto NUMBER,
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);

-- Tabla Factura
CREATE TABLE Factura (
    IdFactura NUMBER PRIMARY KEY,
    fecha DATE,
    total NUMBER,
    descripcion VARCHAR2(100),
    IdCliente NUMBER,
    FOREIGN KEY (IdCliente) REFERENCES Clientes(IdCliente)
);

-- Tabla detalleFactura
CREATE TABLE detalleFactura (
    IdDetalle NUMBER PRIMARY KEY,
    precioUni NUMBER,
    cantidad NUMBER,
    IdFactura NUMBER,
    IdProducto NUMBER,
    FOREIGN KEY (IdFactura) REFERENCES Factura(IdFactura),
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto)
);



-- Insertar Roles
INSERT INTO Roles (IdRol, nombre) VALUES (1, 'Administrador');
INSERT INTO Roles (IdRol, nombre) VALUES (2, 'Vendedor');
INSERT INTO Roles (IdRol, nombre) VALUES (3, 'Cliente');

-- Insertar Usuarios
INSERT INTO Usuarios (IdUsuario, nombreUsuario, contraseña, IdRol)
VALUES (1, 'admin', 'admin123', 1);
INSERT INTO Usuarios (IdUsuario, nombreUsuario, contraseña, IdRol)
VALUES (2, 'juanperez', 'venta2025', 2);

-- Insertar Clientes
INSERT INTO Clientes (IdCliente, nombreCliente, apellidos, direccion, telefono, email)
VALUES (1, 'Yuliana', 'Aguilar', 'Calle 123, San José', '22223344', 'yuliana.a@example.com');
INSERT INTO Clientes (IdCliente, nombreCliente, apellidos, direccion, telefono, email)
VALUES (2, 'Frank', 'Mora', 'Avenida 45, Heredia', '22334455', 'frank.m@example.com');

-- Insertar Empleados
INSERT INTO Empleados (IdEmpleado, nombreEmpleado, apellidos, direccion, telefono, puesto)
VALUES (1, 'Pablo', 'Santamaria', 'Barrio Los Ángeles', '22445566', 'Cajero');
INSERT INTO Empleados (IdEmpleado, nombreEmpleado, apellidos, direccion, telefono, puesto)
VALUES (2, 'Steven', 'Estrada', 'Col. Central', '22556677', 'Reponedor');

-- Insertar Horarios
INSERT INTO Horarios (IdHorario, IdEmpleado, dia, hora_entrada, hora_salida)
VALUES (1, 1, TO_DATE('2025-07-18','YYYY-MM-DD'), 8, 16);
INSERT INTO Horarios (IdHorario, IdEmpleado, dia, hora_entrada, hora_salida)
VALUES (2, 2, TO_DATE('2025-07-18','YYYY-MM-DD'), 10, 18);

-- Insertar Proveedores
INSERT INTO Proveedores (IdProveedor, nombreProveedor, direccion, telefono, email)
VALUES (1, 'Ferretería Industrial S.A.', 'Ruta 32 km 5', '22667788', 'ventas@insumos.cr');
INSERT INTO Proveedores (IdProveedor, nombreProveedor, direccion, telefono, email)
VALUES (2, 'ElectroDistribuidores', 'Zona Industrial', '22778899', 'contacto@electrodist.cr');

-- Insertar Productos (de ferretería)
INSERT INTO Productos (IdProducto, nombreProducto, descripcion, precio, IdProveedor)
VALUES (1, 'Martillo 16oz', 'Martillo de carpintero con mango de fibra', 8.75, 1);
INSERT INTO Productos (IdProducto, nombreProducto, descripcion, precio, IdProveedor)
VALUES (2, 'Taladro Eléctrico 600W', 'Taladro percutor con velocidad variable', 49.99, 1);
INSERT INTO Productos (IdProducto, nombreProducto, descripcion, precio, IdProveedor)
VALUES (3, 'Cable Eléctrico 2mm', 'Bobina de cable eléctrico 100m', 45.00, 2);
INSERT INTO Productos (IdProducto, nombreProducto, descripcion, precio, IdProveedor)
VALUES (4, 'Conector RJ45', 'Pack de 10 conectores para red', 12.00, 2);

-- Insertar Stock
INSERT INTO Stock (IdStock, cantidad, Productos)
VALUES (1, 150, 1);
INSERT INTO Stock (IdStock, cantidad, Productos)
VALUES (2, 60, 2);
INSERT INTO Stock (IdStock, cantidad, Productos)
VALUES (3, 25, 3);
INSERT INTO Stock (IdStock, cantidad, Productos)
VALUES (4, 300, 4);

-- Insertar Pedidos
INSERT INTO Pedidos (IdPedido, total, fecha, descripcion, IdProveedor)
VALUES (1, 500.00, TO_DATE('2025-07-10','YYYY-MM-DD'), 'Pedido de herramientas y equipos', 1);
INSERT INTO Pedidos (IdPedido, total, fecha, descripcion, IdProveedor)
VALUES (2, 1200.00, TO_DATE('2025-07-12','YYYY-MM-DD'), 'Compra de material eléctrico', 2);

-- Insertar detallePedido
INSERT INTO detallePedido (IdDetalle, precioUni, cantidad, IdProducto)
VALUES (1, 8.75, 50, 1);
INSERT INTO detallePedido (IdDetalle, precioUni, cantidad, IdProducto)
VALUES (2, 45.00, 20, 3);

-- Insertar Factura
INSERT INTO Factura (IdFactura, fecha, total, descripcion, IdCliente)
VALUES (1, TO_DATE('2025-07-15','YYYY-MM-DD'), 132.50, 'Compra de herramientas', 1);

-- Insertar detalleFactura
INSERT INTO detalleFactura (IdDetalle, precioUni, cantidad, IdFactura, IdProducto)
VALUES (1, 8.75, 10, 1, 1);
INSERT INTO detalleFactura (IdDetalle, precioUni, cantidad, IdFactura, IdProducto)
VALUES (2, 49.99, 1, 1, 2);

-- Confirmar cambios
COMMIT;