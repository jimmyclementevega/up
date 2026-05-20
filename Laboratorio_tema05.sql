###################################################################
# Para ejecución en MySQL                                         #
###################################################################

# CReando la base de datos BD_TIENDA
CREATE DATABASE DB_TIENDA;

# Activando la base de datos
USE DB_TIENDA;

# Creando la tabla productos
CREATE TABLE productos
(codProd CHAR(4) PRIMARY KEY,
 descripcion VARCHAR(30) NOT NULL UNIQUE,
 stockInicial TINYINT NOT NULL CHECK(StockInicial >= 0),
 precioProd DECIMAL(8,2) NOT NULL,
 almacen CHAR(1) NOT NULL,
 proveedor VARCHAR(30),
 fechaIngreso DATETIME default NOW() -- EN MYSQL NOW() fecha y hora del sistema, CURDATE() solo fecha del sistema
);

##este es un comentario en mysql
##SELECT NOW(), CURDATE()


# Insertando registros
INSERT INTO productos (codProd, descripcion, stockInicial, precioProd, almacen, proveedor) VALUES
('P001','Cooler Pad Gamer',15,89.90,'A','Colbox Tech'),
('P002','Mouse Inalambrico RGB',25,59.90,'A','LogiPeru'),
('P003','Teclado Mecánico Blue',18,149.90,'B','HyperKeys'),
('P004','Monitor 24 Pulgadas',10,799.00,'C','ViewMax'),
('P005','Audífonos Gamer Pro',20,129.90,'A','SoundTech'),
('P006','Webcam HD USB',30,99.50,'B','VisionCam'),
('P007','Laptop Sleeve 15"',22,45.00,'A','Colbox Accessories'),
('P008','Hub USB 4 Puertos',40,39.90,'A','TechLink'),
('P009','SSD 1TB NVMe',12,349.90,'C','KingData'),
('P010','Memoria RAM 16GB',16,289.90,'B','MemX'),
('P011','Mouse Pad XL RGB',28,69.90,'A','Colbox Gear'),
('P012','Parlante Bluetooth Mini',14,119.90,'B','AudioPlus'),
('P013','Cable HDMI 2 Metros',50,25.90,'A','CableTech'),
('P014','Router WiFi 6',9,459.90,'C','NetWave'),
('P015','Silla Gamer Negra',5,899.00,'D','GameSeat'),
('P016','Base Refrigerante Laptop',19,79.90,'A','Colbox Tech'),
('P017','Microfono Streaming USB',11,249.90,'B','StreamAudio'),
('P018','Tablet 10 Pulgadas',8,699.90,'C','TabWorld'),
('P019','Smartwatch Deportivo',17,299.90,'B','SmartLife'),
('P020','Disco Externo 2TB',13,379.90,'C','DataStore'),
('P021','Teclado Wireless Slim',21,89.90,'A','LogiPeru'),
('P022','Adaptador USB-C HDMI',35,49.90,'A','ConnectPlus'),
('P023','Mochila para Laptop',18,139.90,'B','Colbox Bags'),
('P024','Cargador Portátil 20000mAh',15,159.90,'B','PowerGo'),
('P025','Lector de Tarjetas USB',27,29.90,'A','TechLink'),
('P026','Impresora Multifuncional',6,649.90,'D','PrintMax'),
('P027','Monitor Curvo 27"',7,1299.00,'C','ViewMax'),
('P028','Cámara de Seguridad WiFi',12,219.90,'B','SecureHome'),
('P029','Control Gamer Bluetooth',20,179.90,'A','PlayTech'),
('P030','Soporte Monitor Ajustable',16,109.90,'B','ErgoDesk'),
('P031','Laptop Gamer RTX',4,4899.00,'D','Colbox Gaming'),
('P032','Mini Teclado Numérico',24,39.90,'A','HyperKeys'),
('P033','Memoria USB 128GB',45,59.90,'A','KingData'),
('P034','Cable Tipo C 1 Metro',60,19.90,'A','CableTech'),
('P035','Mouse Gamer Óptico',22,119.90,'B','GameMouse'),
('P036','Tablet Gráfica Digital',9,359.90,'C','DesignPro'),
('P037','UPS 1200VA',8,499.90,'D','EnergySafe'),
('P038','Auriculares Bluetooth',19,149.90,'B','SoundTech'),
('P039','Docking Station USB-C',10,329.90,'C','ConnectPlus'),
('P040','Kit Limpieza Laptop',33,35.50,'A','CleanTech'),
('P041','Ventilador RGB PC',26,79.90,'B','CoolMaster'),
('P042','Procesador Ryzen 7',5,1499.00,'D','AMD Perú'),
('P043','Placa Madre B550',7,899.90,'D','Gigabyte Perú'),
('P044','Fuente Poder 750W',9,459.90,'C','PowerTech'),
('P045','Case Gamer Vidrio Templado',6,549.90,'D','CaseMax'),
('P046','Mouse Vertical Ergonómico',14,99.90,'B','ErgoTech'),
('P047','Extensor WiFi Dual Band',13,139.90,'C','NetWave'),
('P048','Mini Proyector LED',5,799.90,'D','VisionMax'),
('P049','Teclado Gamer RGB',17,199.90,'B','HyperKeys'),
('P050','Combo Oficina Wireless',20,159.90,'A','LogiPeru');

#################################################################
#    En esta sección realizamos consultas a la base de datos    #
#################################################################

#consultando la tabla productos
SELECT * FROM productos;

# Usando columnas especificas codProd, descripcion, precioProd
SELECT codProd, descripcion, precioProd  
FROM productos;


# usando alias
SELECT codProd as codigo , descripcion as nombre_producto, precioProd as precio  
FROM productos;

SELECT PROD.codProd as codigo , PROD.descripcion as nombre_producto, PROD.precioProd as precio  
FROM productos PROD;

# Usando distinct
SELECT descripcion,almacen FROM productos;

SELECT  distinct(almacen) FROM productos;

# Ordenando los datos
	select * from productos
    order by precioProd desc

	select * from productos
	order by stockInicial asc

# Doble ordenamiento

	select * from productos
    order by almacen asc, precioProd desc
    
# Clausula WHERE
# Mostrar los productos del almacen A
	select * from productos
	where almacen ='A';
# Crear	un	script	que	permita	mostrar	todos	los	productos	que	sus
# stock sean igual a 19
	select * from productos
	where stockInicial = 19;
    
    
#Crear	un	script	que	permita	mostrar	todos	los	productos	con pecios  mayores que 100
	select descripcion, precioProd, proveedor 
    from productos
	where precioProd > 100
    ORDER BY 2 DESC;
    
    
    
# Operadores lógicos AND , OR
# Crear un script que permita mostrar todos los productos que sean del almacén C y que el
# stock inicial sea mayor a 10
	select * from productos
	where almacen ='C' AND stockInicial > 10;
    
    
    
# Crear un script que permita mostrar todos los productos que sean del almacén C o que el
# stock inicial sea mayor a 10
	select * from productos
	where almacen ='C' or stockInicial > 10;
    

# Operador Like (patrones)
#Crear un script que permita mostrar todos los productos que su descripción comience con D.
select * from productos
where descripcion like 'D%';

select * from productos
where descripcion like '%A';

select * from productos
where descripcion like '%USE%';

# Operador Between (Intervalos)
# Crear un script que permita mostrar todos los productos que su stock inicial este entre 20 y  40.
select * from productos
where stockInicial between 20 and 40;

# Operador IN (Lista de valores)
# Crear un script que permita mostrar todos los productos que su precio sea 45, 899, 129.9
select * from productos
where precioProd in(45,899, 129.9);

# Funciones agregadas SUM, MIN , MAX, AVG
# Muestre la suma de todos los precios, Luego el MIN, MAX y AVG
SELECT sum(precioProd) as suma, min(precioProd) as minimo,
max(precioProd) as maximo, avg(precioProd) promedio 
FROM productos;
# Muestre la cantidad de registros de la tabla productos

select count(*)
from productos;

select count(*)
from productos
where almacen ='A';


# Usando el agrupamiento GROUP BY
# Mostrar la el promedio de precios agrupados por almacen

select almacen, sum(precioProd) from productos
group by almacen;
#----------------------------------
select almacen, count(*) cantidad  from productos
group by almacen
order by cantidad asc;

# Usando HAVING (Similar a WHERE pero para funciones agregadas)
# Mostrar la el promedio de precios agrupados por almacen, pero solo mantener los promedios que superen los 80 y ordenar por promedios de forma descendente
select almacen, avg(precioProd) from productos
group by almacen
having avg(precioProd) > 80

# Mostrar el proveedor que me vende más de 1 producto

