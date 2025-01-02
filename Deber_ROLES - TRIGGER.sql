-- PARTE 1
-- CREACIÓN DE ROLES Y ASIGNACIÓN DE PRIVILEGIOS
-- Inicia sesión con un usuario que tenga privilegios 
-- de super administrador (por ejemplo, root).


-- CREAR ROLES
-- 1. Super Administrador: Crear y eliminar bases de datos.

-- Crear usuario con el rol 'Super Administrador'
CREATE USER 'Alexander'@'localhost' IDENTIFIED BY 'superadmin123';

-- Asignar rol 'Super_Administrador', donde puede crear y eliminar bases de datos
GRANT CREATE, DROP ON *.* TO 'Alexander'@'localhost';
FLUSH PRIVILEGES;



-- 2. Administrador: Crear usuarios y procesos.

-- Crear usuario con el rol 'Administrador'
CREATE USER 'Brad'@'localhost' IDENTIFIED BY 'admin123';

-- Asignar rol 'Administrador', donde puede crear usuarios y procesos
GRANT CREATE USER, PROCESS, GRANT OPTION ON *.* TO 'Brad'@'localhost';
FLUSH PRIVILEGES;



-- 3. CRUD: Insertar, actualizar y eliminar datos.

-- Crear usuario con el rol 'CRUD'
CREATE USER 'Carlos'@'localhost' IDENTIFIED BY 'crud123';

-- Asignar rol 'CRUD', donde puede seleccionar, insertar, actualizar 
-- y eliminar en todas las tablas de la base de datos "hospital"
GRANT SELECT, INSERT, UPDATE, DELETE ON hospital.* TO 'Carlos'@'localhost';
FLUSH PRIVILEGES;



-- 4. CRU: Insertar y actualizar, pero sin eliminar.

-- Crear usuario con el rol 'CRU'
CREATE USER 'David'@'localhost' IDENTIFIED BY 'cru123';

-- Asignar rol 'CRU', donde puede seleccionar, insertar y actualizar 
-- en todas las tablas de la base de datos "hospital"
GRANT SELECT, INSERT, UPDATE ON hospital.* TO 'David'@'localhost';
FLUSH PRIVILEGES;             



-- 5. Solo Lectura: Realizar consultas a las tablas.

-- Crear usuario con el rol 'Solo Lectura'
CREATE USER 'Rodrigo'@'localhost' IDENTIFIED BY 'read123';

-- Asignar rol 'Solo_Lectura', donde puede seleccionar 
-- en todas las tablas de la base de datos "hospital" 
GRANT SELECT ON hospital.* TO 'Rodrigo'@'localhost';
FLUSH PRIVILEGES;               


-- Verificación de Permisos
-- Usa el comando SHOW GRANTS FOR 'usuario'@'localhost'; 
-- para verificar qué permisos tiene cada usuario.


-- Verificar permisos del usuario 'Super Administrador'
SHOW GRANTS FOR 'Alexander'@'localhost';

-- Verificar permisos del usuario 'Administrador'
SHOW GRANTS FOR 'Brad'@'localhost';

-- Verificar permisos del usuario 'CRUD'
SHOW GRANTS FOR 'Carlos'@'localhost';

-- Verificar permisos del usuario 'CRU'
SHOW GRANTS FOR 'David'@'localhost';

-- Verificar permisos del usuario 'Solo Lectura'
SHOW GRANTS FOR 'Rodrigo'@'localhost';


-- _____________________________________________________

-- PARTE 2 TRIGGERS
-- Crear un trigger que registre todas las operaciones (insert, update, delete) 
-- realizadas en una tabla de empleados en una tabla de auditoría. 
-- El objetivo es llevar un historial detallado de las acciones realizadas, 
-- incluyendo el tipo de operación, los datos afectados 
-- y la fecha y hora en que ocurrió cada cambio.

-- crear la base de datos "practica"
CREATE DATABASE practica;
-- seleccionar la base de datos "practica"
use practica;

-- crear la tabla "empleados"
CREATE TABLE empleados (
    EmpID INT PRIMARY KEY,          
    Nombre VARCHAR(50),            
    Departamento VARCHAR(50),        
    Salario DECIMAL(10, 2)          
);

-- crear la tabla "auditoria"
CREATE TABLE auditoria (
    AudID INT PRIMARY KEY AUTO_INCREMENT ,  
    Accion VARCHAR(10),                     
    EmpID INT,                              
    Nombre VARCHAR(50),                    
    Departamento VARCHAR(50),               
    Salario DECIMAL(10, 2),                 
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);


-- Trigger para INSERT 
DELIMITER //
CREATE TRIGGER auditoria_insert
AFTER INSERT ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('INSERT', NEW.EmpID, NEW.Nombre, NEW.Departamento, NEW.Salario, NOW());
END//
DELIMITER ;


-- Trigger para UPDATE
DELIMITER //
CREATE TRIGGER auditoria_update
AFTER UPDATE ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('UPDATE', NEW.EmpID, NEW.Nombre, NEW.Departamento, NEW.Salario, NOW());
END//
DELIMITER ;


-- Trigger para DELETE
DELIMITER //
CREATE TRIGGER auditoria_delete
AFTER DELETE ON empleados
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (Accion, EmpID, Nombre, Departamento, Salario, Fecha)
    VALUES ('DELETE', OLD.EmpID, OLD.Nombre, OLD.Departamento, OLD.Salario, NOW());
END//
DELIMITER ;



-- Insertar registro en la tabla "empleados"
INSERT INTO empleados (EmpID, Nombre, Departamento, Salario) 
VALUES 
(1, 'Fernando', 'Ventas', 4500.00),
(2, 'Marco', 'Mantenimiento', 8000.00),
(3, 'Santiago', 'Contabilidad', 2000.00);

-- Visualizar registro en la tabla "auditoria"
SELECT * FROM auditoria;



-- Actualizar registro en la tabla "empleados"
UPDATE empleados 
SET Salario = 6445.00 
WHERE EmpID = 3;

-- Visualizar registro en la tabla "auditoria"
SELECT * FROM auditoria;


-- Eliminar registro en la "tabla empleados"
DELETE FROM empleados 
WHERE EmpID = 2;

-- Visualizar registro en la tabla "auditoria"
SELECT * FROM auditoria;












