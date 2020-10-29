#RETO 1#
USE tienda;
SELECT * FROM articulo WHERE nombre LIKE '%PASTA%';
SELECT * FROM articulo WHERE nombre LIKE '%Cannelloni%';
SELECT * FROM articulo WHERE nombre LIKE '% - %';
SELECT * FROM puesto WHERE nombre LIKE "%Designer%";
SELECT * FROM puesto WHERE nombre LIKE "%Developer%";
#RETO 2#
SELECT avg(salario) FROM puesto; 
SELECT count(*) FROM articulo WHERE nombre LIKE '%pasta%';
SELECT min(salario), max(salario) FROM puesto;
SELECT max(id_puesto) - 5 FROM puesto;
SELECT sum(salario) FROM puesto WHERE id_puesto > 995;
#RETO 3#
SELECT nombre, count(*) FROM puesto GROUP BY nombre;
SELECT nombre, sum(salario) FROM puesto GROUP BY nombre;
SELECT id_empleado, count(*) AS Ventas FROM venta GROUP BY id_empleado;
SELECT id_articulo, count(*) FROM venta GROUP BY id_articulo; 
