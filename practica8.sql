
-- Ejercicio 1
SELECT id_producto, COUNT(*) AS cantidad_ventas
FROM ventas
GROUP BY id_producto;

-- Ejercicio 2
SELECT id_producto, AVG(monto) AS promedio_monto
FROM ventas
GROUP BY id_producto;

-- Ejercicio 3
SELECT id_producto, MAX(monto) AS monto_maximo
FROM ventas
GROUP BY id_producto;

-- Ejercicio 4
SELECT id_producto, MIN(monto) AS monto_minimo
FROM ventas
GROUP BY id_producto;

-- Ejercicio 5
SELECT MONTH(fecha_venta) AS mes, COUNT(*) AS cantidad_ventas
FROM ventas
GROUP BY mes;

-- Ejercicio 6
SELECT YEAR(fecha_venta) AS anio, MONTH(fecha_venta) AS mes, SUM(monto) AS total_ventas
FROM ventas
GROUP BY anio, mes
ORDER BY anio, mes;

-- Ejercicio 7
SELECT id_producto, COUNT(*) AS cantidad_vendida
FROM ventas
GROUP BY id_producto
ORDER BY cantidad_vendida DESC
LIMIT 5;

-- Ejercicio 8
SELECT DAYNAME(fecha_venta) AS dia_semana, SUM(monto) AS total_ventas
FROM ventas
GROUP BY dia_semana;