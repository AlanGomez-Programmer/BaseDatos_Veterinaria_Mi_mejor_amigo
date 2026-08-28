# Uso de la base de datos
USE Veterinaria_Mi_mejor_amigo;

-- Ingreso de datos

# Datos de dueños
INSERT INTO Cliente(cedula, nombre_completo, telefono, direccion) VALUES
('1234375687', 'José Gónzales', '3456723139', 'carrera 1, 2da. ave.'),
('52841930', 'Valentina Bermúdez', '3158920147', 'Calle 127 # 19-45, Bogotá'),
('1020738492', 'Mateo Ospina', '3104528193', 'Carrera 43A # 11-30, Medellín'),
('1143829104', 'Camilo Salcedo', '3006214859', 'Carrera 53 # 75-120, Barranquilla'),
('31984025', 'Daniela Restrepo', '3183049218', 'Calle 9 # 38-25, Cali');

# Datos de Veterinarios
INSERT INTO Veterinario(cedula, nombre_completo, telefono, correo_electronico) VALUES
('1018492031', 'Carlos Mendoza', '3118492015', 'carlos.mendoza@veterinaria.com'),
('52930418', 'Andrea Villamizar', '3164029183', 'andrea.villamizar@veterinaria.com'),
('1128473920', 'Felipe Montoya', '3015938204', 'felipe.montoya@veterinaria.com'),
('31849203', 'Camila Cárdenas', '3173019482', 'camila.cardenas@veterinaria.com'),
('1032849102', 'Alejandro Quintero', '3209182347', 'alejandro.quintero@veterinaria.com');
-- Datos para registro de mascota 

# Datos Especie
INSERT INTO Especie(especie) VALUES
('Perro'),
('Gato'),
('Conejo'),
('Hámster');

# Datos Raza
INSERT INTO Raza(raza) VALUES
('Criollo'), 
('Shih Tzu'),
('Golden Retriever'), 
('Beagle'), 
('Bulldog Francés'),
('Siamés'), 
('Persa'),
('Maine Coon'), 
('Bengala'), 
('Belier'), 
('Enano Holandés'), 
('Sirio'), 
('Ruso'); 

# Datos Sexo
INSERT INTO Sexo(sexo) VALUES
('Macho'),
('Hembra');

# Registro Mascota
INSERT INTO Mascota(nombre, vacunada, idCliente, idEspecie, idRaza, idSexo) VALUES
('Bruno', TRUE, 1, 1, 4, 1),
('Mia', TRUE, 2, 2, 6, 2),
('Copito', FALSE, 3, 3, 10, 1),
('Luna', FALSE, 4, 1, 1, 1),
('Nube', FALSE, 5, 4, 12, 1);

# Registro de Servicios
INSERT INTO Servicio(nombre, descripcion, precio_base) VALUES
('Baño', 'Higiene completa con champú especializado, secado y cepillado general.', '45.000'),
('Corte de uñas', 'Recorte seguro de uñas y limado para evitar lesiones o encarnamientos.', '15.000'),
('Consulta médica', 'Evaluación clínica de signos vitales, examen físico general y diagnóstico inicial.', '60.000'),
('Desparasitación', 'Administración de antiparasitario según el peso para control de parásitos internos.', '30.000'),
('Vacunación', 'Aplicación de biológico según el esquema de vacunación y registro en carné.', '70.000');

# Registro de Visitas
INSERT INTO Visita(fecha, idMascota, idVeterinario, idServicio) VALUES 
('2026-08-29', 1, 2, 3),
('2026-08-31', 2, 4, 4),
('2026-09-01', 3, 1, 2),
('2026-09-02', 4, 3, 5),
('2026-09-03', 5, 5, 1);

# Regisro de Tratamientos
INSERT INTO Tratamiento(nombre, observaciones, idVisita) VALUES
('Baño dermatológico medicado', 'Se utilizó champú hipoalergénico con clorhexidina para aliviar irritación leve en piel y eliminar malos olores.', 5),
('Recorte de garras preventivo', 'Se realizó corte con alicate profesional para pequeñas especies, aplicando polvo hemostático en una uña para evitar sangrado.', 3),
('Chequeo preventivo general', 'Se revisaron mucosas, constantes vitales y auscultación cardíaca; se formuló suplemento vitamínico.', 1),
('Desparasitación de amplio espectro', 'Suministro de suspensión oral con fenbendazol según peso corporal exacto; sin reacciones adversas registradas.', 2),
('Inmunización con vacuna quintuple', 'Aplicación de dosis subcutánea del biológico; se recomienda reposo de 24 horas y monitoreo de temperatura.', 4);

/* Después de ingresar los datos, 
a una mascoata se debe de cambiar la vacuna a 1 (TRUE)
por el servicio de vacunación en la visita */

UPDATE Mascota M 
SET vacunada = TRUE 
WHERE M.idMascota IN (SELECT V.idMascota FROM Visita V WHERE V.idServicio = 5);
