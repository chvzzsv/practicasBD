-- Ejemplo
SELECT * FROM personas WHERE estado = 'california' OR estado = 'colorado';

-- Consulta 1: Encuentra la edad promedio de todas las personas en la tabla.
SELECT AVG (Edad) AS promedio_edad FROM personas;

-- Consulta 2: Identifica a las cinco personas más jóvenes en la tabla, ordenadas por edad de menor a mayor.
SELECT * FROM personas
ORDER BY edad ASC
LIMIT 5;

-- Consulta 3: Encuentra la cantidad de personas de cada género en la tabla y muestra el resultado en una tabla de resumen.
SELECT sexo, COUNT(50) AS cantidad_personas
FROM personas
GROUP BY sexo;

-- Consulta 4: Encuentra la persona de mayor edad en la tabla.
SELECT *
FROM personas
ORDER BY edad DESC
LIMIT 1;

-- Consulta 5: Obtén la lista de nombres únicos de los estados presentes en la tabla.
SELECT DISTINCT estado
FROM personas;

-- Consulta 6: Encuentra la edad promedio de las personas en cada estado y muestra el resultado en una tabla.
SELECT estado, AVG(edad) AS edad_promedio
FROM personas
GROUP BY estado;

-- Consulta 7: Identifica a las personas que tienen exactamente 30 años.
SELECT * FROM personas
WHERE edad = 30;


-- Consulta 8: Encuentra la ciudad más común en la tabla, es decir, la ciudad que aparece con más frecuencia.
SELECT ciudad, COUNT(*) AS frecuencia
FROM personas
GROUP BY ciudad
ORDER BY COUNT(*) DESC
LIMIT 1;


-- Consulta 9: Encuentra las personas que tienen el mismo nombre y muestra cuántas personas comparten el mismo nombre.
SELECT nombre, COUNT(100) as cantidad_personas
FROM personas
GROUP BY nombre
HAVING COUNT(100) > 1;


-- Consulta 10: Encuentra las personas cuyos nombres comienzan con la letra "A" y tienen una edad mayor a 25 años.
SELECT * FROM personas
WHERE nombre LIKE 'A%' AND edad > 25;


-- Consulta 11: Encuentra la cantidad total de personas en la tabla.
SELECT COUNT(*) AS total_personas
FROM personas;


-- Consulta 12: Ordena las personas primero por estado y luego por edad en orden ascendente.
SELECT *
FROM personas
ORDER BY estado ASC, edad ASC;


-- Consulta 13: Encuentra la persona más joven de cada estado y muestra el resultado en una tabla.
SELECT estado, MIN(edad) AS edad_mas_joven
FROM personas 
GROUP BY estado;

-- Consulta 14: Encuentra el estado con la edad promedio más alta entre sus residentes.
SELECT estado, AVG(edad) AS edad_promedio
FROM personas
GROUP BY estado
ORDER BY edad_promedio DESC
LIMIT 1;


-- Consulta 15: Encuentra las personas que tienen la misma edad y muestra cuántas personas comparten cada edad.
SELECT edad, COUNT(*) AS cantidad_personas
FROM personas
GROUP BY edad
HAVING COUNT(*) > 1;