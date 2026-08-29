# Uso de la base de datos
USE Veterinaria_Mi_mejor_amigo;

# Creación de tabla apartir de otra
CREATE TABLE Perros
AS 
SELECT M.idMascota, M.Nombre, R.raza
FROM Mascota M, Raza R
Where M.idEspecie = 1 AND M.idRaza = R.idRaza

# Cantidad de Clientes con Gatos
SELECT COUNT(*) AS 'Cantidad Clientes con Gatos' 
FROM Mascota M  
WHERE M.idEspecie = 2;

# Promedio de Mascotas Vacunadas
SELECT ROUND(AVG(M.vacunada), 2                                                         ) as 'Promedio de Mascotas Vacunadas'
FROM Mascota M; 

# Primera fecha de Visita
SELECT MIN(V.fecha) as 'Primer Visita Registrada'
FROM Visita V;

# Última fecha de Visita
SELECT MAX(V.fecha) as 'Última Visita Registrada'
FROM Visita V;

# Veterinarios que atendieron a las Mascotas
SELECT CONCAT('El Veterinario: ', VE.nombre_completo, ', atendió a: ', M.nombre) AS 'Atenciones'
FROM Visita V, Veterinario VE, Mascota M
WHERE V.idVeterinario = VE.idVeterinario AND V.idMascota = M.idMascota;

# Dueños de las mascotas
SELECT CONCAT('El cliente: ', C.nombre_completo, ' es dueño de: ', M.nombre) AS 'Dueños de las mascotas'
FROM Mascota M
INNER JOIN Cliente C ON M.idCliente = C.idCliente;

# Cantidad de Dueños de Hámsters y Conejos
SELECT COUNT(M.idCliente) AS 'Cantidad de Dueños de Hámster y Conejos'
FROM Mascota M
INNER JOIN Especie E ON M.idEspecie = E.idEspecie
WHERE E.especie IN ('Conejo', 'Hámster');

# Indicación de que mascota esta vacunada y cual no
SELECT CONCAT(M.nombre, " ",IF(M.vacunada = True, "Esta Vacunada", "No esta Vacunada")) AS 'Mascotas Vacunadas'
FROM Mascota M

# Mostrar pago (precio) por visita
SELECT V.idVisita, V.fecha, S.precio_base AS Pago
FROM Visita V
INNER JOIN Servicio S ON V.idServicio = S.idServicio;

# Cantidad de mascotas por especie
SELECT E.especie, COUNT(*) AS cantidad
FROM Mascota M
INNER JOIN Especie E ON M.idEspecie = E.idEspecie
GROUP BY E.especie;

# Clientes con más de una mascota
SELECT C.nombre_completo, COUNT(*) AS cantidad_mascotas
FROM Cliente C
INNER JOIN Mascota M ON C.idCliente = M.idCliente
GROUP BY C.idCliente, C.nombre_completo
HAVING COUNT(*) > 1;

# Mascotas vacunadas
SELECT M.nombre, M.vacunada
FROM Mascota M
WHERE M.vacunada = TRUE;

# Historial de visitas con veterinario y servicio
SELECT V.fecha, M.nombre AS mascota, VE.nombre_completo AS veterinario, S.nombre AS servicio
FROM Visita V
INNER JOIN Mascota M ON V.idMascota = M.idMascota
INNER JOIN Veterinario VE ON V.idVeterinario = VE.idVeterinario
INNER JOIN Servicio S ON V.idServicio = S.idServicio;

# Promedio de precio por servicio
SELECT AVG(CAST(S.precio_base AS DECIMAL(10,2))) AS promedio_precio
FROM Servicio S;

