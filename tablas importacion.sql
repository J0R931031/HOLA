
-- Tabla DETALLE_ORDEN
CREATE TABLE DETALLE_ORDEN (
    RegOrd INT,
    ComidaID INT,
    Cantidad INT NOT NULL,
    FechaHoraOrd DATETIME NOT NULL,
    FechaHoraCon DATETIME,
    Especificaciones TEXT,
    Estado VARCHAR(20) CHECK (Estado IN ('Pendiente', 'En Proceso', 'Completado')),
    ChefID INT,
    FOREIGN KEY (RegOrd) REFERENCES ORDENES(RegOrd),
    FOREIGN KEY (ComidaID) REFERENCES COMIDA(ID_Comida),
    FOREIGN KEY (ChefID) REFERENCES CHEFS(ID_Chef)
);

-- Tabla PEDIDOS
CREATE TABLE PEDIDOS (
    RegPedido INT PRIMARY KEY,
    FechaHoraPedido DATETIME NOT NULL,
    FechaHoraLlegada DATETIME NOT NULL,
    ClienteID INT,
    PrecioTotal DECIMAL(10, 2),
    Estado VARCHAR(20) CHECK (Estado IN ('Pendiente', 'En Proceso', 'Completado', 'Cancelado')),
    FOREIGN KEY (ClienteID) REFERENCES CLIENTES(ID_Cliente)
);

-- Tabla DETALLE_PEDIDO
CREATE TABLE DETALLE_PEDIDO (
    RegPedido INT,
    ComidaID INT,
    Cantidad INT NOT NULL,
    ChefID INT,
    Especificaciones TEXT,
    FOREIGN KEY (RegPedido) REFERENCES PEDIDOS(RegPedido),
    FOREIGN KEY (ComidaID) REFERENCES COMIDA(ID_Comida),
    FOREIGN KEY (ChefID) REFERENCES CHEFS(ID_Chef)
);