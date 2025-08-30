CREATE DATABASE IF NOT EXISTS TIENDA;

USE TIENDA;

CREATE TABLE IF NOT EXISTS USUARIOS(
    ID_USUARIO  INT(11) AUTO_INCREMENT  NOT NULL,
    NOMBRES     VARCHAR(100)            NOT NULL,
    APELLIDOS   VARCHAR(100)            NOT NULL,
    EMAIL       VARCHAR(200)            NOT NULL,
    PASSWORD    VARCHAR(255)            NOT NULL,
    ROL         VARCHAR(20),
    IMAGEN      VARCHAR(255),
    CONSTRAINT  PK_USUARIO  PRIMARY KEY(ID_USUARIO),
    CONSTRAINT  UQ_IMAIL    UNIQUE(EMAIL)

)ENGINE=InnoDb; 

INSERT INTO USUARIOS VALUES(NULL, 'ADMIN', 'ADMIN', 'ADMIN@ADMIN.COM', '12345', 'ADMIM', 'IMAGEN');

CREATE TABLE IF NOT EXISTS t_categorias(
    id_categoria INT(11) AUTO_INCREMENT NOT NULL,
    nombre_categoria VARCHAR(100)NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY(id_categoria)
)ENGINE=InnoDb;

INSERT INTO t_categorias VALUES(NULL,'Construccion'),(NULL,'Electricos'),(NULL,'pisos');

CREATE TABLE IF NOT EXISTS t_productos(
    id_producto INT(11) AUTO_INCREMENT NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200) NOT NULL,
    precio float(100,2) NOT NULL,
    stock INT(100) NOT NULL,
    oferta VARCHAR(50) NOT NULL,
    fecha date not NULL,
    imagen VARCHAR(255) NOT NULL,
    id_categoria INT(11) NOT NULL,
    CONSTRAINT pk_producto PRIMARY KEY(id_producto),
    CONSTRAINT fk_producto_categoria FOREIGN KEY(id_categoria) REFERENCES t_categorias(id_categoria) 
)ENGINE=InnoDb; 

INSERT INTO t_productos VALUES(NULL,'cemento','gris','25000','10','','310725','','1'),(NULL,'tomacorriente','doble gfci','2000','10','','060525','','2'),(NULL,'baldosa','pared 30x60','30000','10','','110325','','1');

CREATE TABLE IF NOT EXISTS t_pedidos(
    id_pedido INT(11) AUTO_INCREMENT NOT NULL,
    cantidad INT(100) NOT NULL,
    ID_USUARIO INT(11) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    direccion VARCHAR(100) NOT NULL, 
    costo float(100,00) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    fecha datetime NOT NULL,
    CONSTRAINT pk_pedido PRIMARY KEY(id_pedido),
    CONSTRAINT fk_pedido_usuario FOREIGN KEY(ID_USUARIO) REFERENCES USUARIOS(ID_USUARIO)
) ENGINE=InnoDb; 

CREATE TABLE IF NOT EXISTS t_detalle_prdido(
    id_detalle_pedido INT(25) AUTO_INCREMENT NOT NULL,
    id_pedido INT(11) NOT NULL,
    id_producto INT(11) NOT NULL,
    unidades INT(20) NOT NULL,
    CONSTRAINT pk_detalle_pedido PRIMARY KEY(id_detalle_pedido),
    CONSTRAINT fk_detalle_producto FOREIGN KEY(id_producto) REFERENCES t_productos(id_producto),
    CONSTRAINT fk_detalle_pedido FOREIGN KEY(id_pedido) REFERENCES t_pedidos (id_pedido)
) ENGINE=InnoDb;


