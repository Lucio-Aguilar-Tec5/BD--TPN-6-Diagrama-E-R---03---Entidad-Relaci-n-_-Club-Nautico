DROP TABLE IF EXISTS socio;
DROP TABLE IF EXISTS Método_Pago;
DROP TABLE IF EXISTS salidas ;
DROP TABLE IF EXISTS barcos;
DROP TABLE IF EXISTS cuotas;
DROP TABLE IF EXISTS detalles_salidas;
DROP TABLE IF EXISTS nro_socio;


CREATE TABLE socio (
id_socio INT PRIMARY KEY NOT NULL,
nombre VARCHAR(30) NOT NULL,
apellido  VARCHAR(30) NOT NULL,
dni INT NOT NULL,
teléfono  VARCHAR(20) NOT NULL,
dirección  VARCHAR(50) NOT NULL);

CREATE TABLE Método_Pago (
id_metodo INT PRIMARY KEY NOT NULL,
id_socio INT NOT NULL,
método  VARCHAR(30) NOT NULL,
fecha_pago DATE NOT NULL,
monto DECIMAL NOT NULL);

CREATE TABLE salidas  (
id_salida INT NOT NULL,
id_barco INT NOT NULL);

CREATE TABLE barcos (
id_barco INT PRIMARY KEY NOT NULL,
id_socio INT NOT NULL,
matrícula  VARCHAR(20) NOT NULL,
nombre VARCHAR(30) NOT NULL,
amarre INT NOT NULL,
cuota DECIMAL NOT NULL);

CREATE TABLE cuotas (
id_cuotas INT PRIMARY KEY NOT NULL,
id_socio INT NOT NULL,
id_metodo INT NOT NULL,
fecha_pago DATE NOT NULL,
monto DECIMAL NOT NULL);

CREATE TABLE detalles_salidas (
id_salida INT PRIMARY KEY NOT NULL,
fecha_salida DATE NOT NULL,
hora_salida TIME NOT NULL,
destino VARCHAR(20) NOT NULL,
patron_nombre TEXT NOT NULL,
patron_apellido TEXT NOT NULL,
patron_dni INT NOT NULL);

CREATE TABLE nro_socio (
id_nro_socio INT PRIMARY KEY NOT NULL,
patron_nombre TEXT NOT NULL,
patron_apellido TEXT NOT NULL,
patron_dni INT NOT NULL,
telefono VARCHAR(20) NOT NULL,
dirreccion VARCHAR(30) NOT NULL,
fecha_salida DATE NOT NULL,
hora_salida TIME NOT NULL,
destino VARCHAR(30) NOT NULL,
id_barco INT NOT NULL,
id_salida INT NOT NULL);

ALTER TABLE Método_Pago ADD CONSTRAINT Método_Pago_id_socio_socio_id_socio FOREIGN KEY (id_socio) REFERENCES socio(id_socio);
ALTER TABLE salidas  ADD CONSTRAINT salidas _id_salida_detalles_salidas_id_salida FOREIGN KEY (id_salida) REFERENCES detalles_salidas(id_salida);
ALTER TABLE salidas  ADD CONSTRAINT salidas _id_barco_socio_id_socio FOREIGN KEY (id_barco) REFERENCES socio(id_socio);
ALTER TABLE barcos ADD CONSTRAINT barcos_id_socio_socio_id_socio FOREIGN KEY (id_socio) REFERENCES socio(id_socio);
ALTER TABLE cuotas ADD CONSTRAINT cuotas_id_socio_socio_id_socio FOREIGN KEY (id_socio) REFERENCES socio(id_socio);
ALTER TABLE cuotas ADD CONSTRAINT cuotas_id_metodo_socio_id_socio FOREIGN KEY (id_metodo) REFERENCES socio(id_socio);
ALTER TABLE nro_socio ADD CONSTRAINT nro_socio_id_barco_barcos_id_barco FOREIGN KEY (id_barco) REFERENCES barcos(id_barco);
ALTER TABLE nro_socio ADD CONSTRAINT nro_socio_id_salida_detalles_salidas_id_salida FOREIGN KEY (id_salida) REFERENCES detalles_salidas(id_salida);