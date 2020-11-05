USE tienda;
# RETO 1 
#A
SELECT nombre, apellido_paterno
FROM empleado
WHERE id_puesto 
IN (SELECT id_puesto
 FROM puesto 
 WHERE salario > 10000);
 #B 
SELECT id_empleado, min(total_ventas), max(total_ventas)
FROM
 (SELECT clave, id_empleado, count(*) total_ventas
      FROM venta
      GROUP BY clave, id_empleado) AS sq
GROUP BY id_empleado;
 #C 
 SELECT clave, id_articulo FROM venta
 WHERE id_articulo in 
 (SELECT id_articulo FROM articulo 
 WHERE PRECIO > 5000);
 # RETO 2
 #A 
 SELECT clave, nombre, apellido_paterno
 FROM venta AS v
 JOIN empleado AS e
 ON v.id_empleado = e.id_empleado
 ORDER BY clave;
 #B 
 SELECT clave, nombre
 FROM venta AS ven
 JOIN articulo AS art
 ON ven.id_articulo = art.id_articulo 
 ORDER BY clave;
 #C
 SELECT clave, round(sum(precio),2) AS total_ventas
 FROM venta AS vent
 JOIN articulo AS arti
 ON vent.id_articulo = arti.id_articulo 
 GROUP BY clave
 ORDER BY clave;
 # RETO 3
 #A)
 CREATE VIEW puestos_146 AS
 SELECT CONCAT(e.nombre, ' ', e.apellido_paterno), p.nombre
 FROM empleado e
 JOIN puesto p
 ON e.id_puesto = p.id_puesto; 
 SELECT *
 FROM puestos_146;
 #B
CREATE VIEW ea_146 AS
SELECT v.clave, CONCAT(e.nombre, ' ', e.apellido_paterno) nombre, a.nombre articulo
FROM venta v
JOIN empleado e
ON v.id_articulo = e.id_empleado 
JOIN articulo a
ON v.id_articulo = a.id_articulo 
ORDER BY v.clave;
SELECT * 
FROM ea_146;
#C 
CREATE VIEW puesto_ventas_146 AS 
SELECT p.nombre, count(v.clave) total
FROM venta v
JOIN empleado e
ON v.id_empleado = e.id_empleado 
JOIN puesto p
ON e.id_puesto = p.id_puesto 
GROUP BY p.nombre; 
SELECT* 
FROM puesto_ventas_146
ORDER BY total DESC
LIMIT 1;
 
 