PARTE 1
 
 CREACIÓN DE ROLES Y ASIGNACIÓN DE PRIVILEGIOS
 
 Creación del Script SQL
 
 Escribe un script SQL que cree los cinco usuarios
 
 Asegúrate de agregar comentarios que expliquen qué puede hacer cada usuario.
 
 Usa contraseñas seguras y personalízalas si es necesario en la creación de usuarios.
 
  ● Inicia sesión con un usuario que tenga privilegios de super administrador (por
  ejemplo, root).
 
 ● CREAR ROLES
 
 ● SuperAdministrador: Crear y eliminar bases de datos.
 
 ● Administrador: Crear usuarios y procesos.
 
 ● CRUD: Insertar, actualizar y eliminar datos.
 
 ● CRU: Insertar y actualizar, pero sin eliminar.
 
 ● SoloLectura: Realizar consultas a las tablas.
 
 Verificación de Permisos
 
 Usa el comando SHOW GRANTS FOR 'usuario'@'localhost'; para verificar qué permisos
 tiene cada usuario.
 
 PARTE 2 TRIGGERS
 
 Objetivo:
 
 Comprender la importancia de los triggers en bases de datos, cómo se aplican en diferentes
 escenarios, y reconocer áreas en las que su uso es crucial para la integridad de los datos y
 el control de los procesos.
 
 Instrucciones:
 
 1. Investigación sobre los Triggers:
 Conceptos clave sobre los Triggers
 
 2. Tipos de triggers:

○ BEFORE:Se ejecuta antes de que se realice una acción en la base de datos
 (INSERT, UPDATE, DELETE). Son útiles para validar datos antes de que se
 efectúe el cambio en la tabla.
 
 ○ AFTER:Se ejecuta después de que la acción se haya realizado (INSERT,
 UPDATE, DELETE). Es útil cuando quieres registrar cambios o ejecutar
 acciones adicionales después de que se haya completado una operación.
 
 ○ INSTEADOF:Se utiliza principalmente en vistas, reemplazando la acción
 que se habría realizado por otra. Por ejemplo, en una vista, puedes usar un
 trigger INSTEAD OF para manejar INSERT, UPDATE o DELETE en lugar de
 modificar directamente las vistas.
 
 3. Eventos que pueden activar un trigger:
 
 ○ INSERT:Cuando se agrega un nuevo registro a la tabla.
 
 ○ UPDATE:Cuando se modifica un registro existente en la tabla.
 
 ○ DELETE:Cuando se elimina un registro de la tabla.
 
 4. Contexto de los triggers:
 
 ○ NEW:En triggers de tipo INSERT o UPDATE, puedes utilizar la palabra clave
 NEW para hacer referencia a los valores que van a insertarse o actualizarse
 en una fila. Es decir, los nuevos valores de una columna.
 
 ○ OLD:En triggers de tipo DELETE o UPDATE, puedes utilizar la palabra clave
 OLD para hacer referencia a los valores anteriores de una fila antes de la
 modificación o eliminación.
 
 AMPLIAR INFORMACIÓN Y ENTENDER
 
 ○ Definición y funcionamiento: Investigar qué son los triggers en bases de
 datos, cómo funcionan, y los diferentes tipos de triggers (por ejemplo,
 BEFORE, AFTER, INSTEAD OF).

 ○ Importancia de su uso: Explicar por qué es importante usar triggers en una
 base de datos y cuáles son los beneficios que aportan, tales como la
automatización de tareas, la integridad referencial, el control de cambios,
 entre otros.
 
 ○ Ventajas y desventajas: Reflexionar sobre las ventajas (por ejemplo, evitar la
 corrupción de datos, asegurar reglas de negocio) y desventajas (por ejemplo,
 sobrecarga en el rendimiento) de utilizar triggers.
 
 5. Aplicaciones de Triggers:
 
 ○ Áreas de aplicación: Identificar en qué áreas de una base de datos se aplican
 triggers. Ejemplos comunes incluyen la validación de datos, la auditoría, el
 seguimiento de cambios y la implementación de reglas de negocio
 automáticas.
 
 ○ Casos de uso específicos: Investigar ejemplos reales de empresas o
 sistemas que utilicen triggers para gestionar procesos como auditorías de
 registros, actualizaciones automáticas de información, control de integridad
 referencial, entre otros.
 
 Enunciado de la Práctica:
 
 Objetivo:
 Crear un trigger que registre todas las operaciones (insert, update, delete) realizadas en
 una tabla de empleados en una tabla de auditoría. El objetivo es llevar un historial detallado
 de las acciones realizadas, incluyendo el tipo de operación, los datos afectados y la fecha y
 hora en que ocurrió cada cambio.
 
 Descripción del Ejercicio:
 Imagina que tienes una empresa que desea llevar un control detallado sobre los cambios
 realizados en los registros de sus empleados. Para ello, se necesita crear una tabla de
 auditoría que registre cualquier acción (inserción, actualización o eliminación) que se realice
en la tabla de Empleados. Cada vez que se realice una operación sobre la tabla de
 empleados, el sistema debe registrar la siguiente información en la tabla de auditoría:
 
 ● Tipo de operación realizada (INSERT, UPDATE, DELETE)
 
 ● ID del empleado afectado
 
 ● Nombre y departamento del empleado
 
 ● Salario del empleado
 
 ● Fecha y hora en que se realizó la operación
 
 Pasos para la práctica:
 
 1. Crear la tabla de empleados con los siguientes campos:
 
 ○ EmpID(IDdel empleado)
 
 ○ Nombre(Nombre del empleado)
 
 ○ Departamento (Departamento en el que trabaja el empleado)
 
 ○ Salario(Salario del empleado)
 
 2. Crear la tabla de auditoría con los siguientes campos:
 
 ○ AudID(IDdel registro de auditoría)
 
 ○ Accion(Tipo de operación: INSERT, UPDATE, DELETE)
 
 ○ EmpID(IDdel empleado afectado)
 
 ○ Nombre(Nombre del empleado)
 
 ○ Departamento (Departamento del empleado)
 
 ○ Salario(Salario del empleado)
 
 ○ Fecha(Fecha y hora de la operación)
 
 3. Crear el trigger:
 
 ○ El trigger debe activarse después de realizar cualquier operación (INSERT,
 UPDATE o DELETE) sobre la tabla de empleados. El trigger debe insertar un
 nuevo registro en la tabla de auditoría cada vez que se realice una de estas
 operaciones.

Requerimientos:
 
 ● El trigger debe registrar correctamente el tipo de operación realizada (INSERT,
 UPDATE, DELETE).
 
 ● El trigger debe almacenar el nombre del empleado, su departamento y salario.
 
 ● El trigger debe capturar la fecha y hora de la operación.
 
 ● Crear el trigger para auditar eliminaciones Y Ver los cambios realizados
 
 PRESENTACIÓN
 
 Compartir el Enlace
 
 ● Comparte el enlace del repositorio de GitHub con el instructor o en la plataforma
 donde se solicite.
 
 Formato de Entrega:

 ● Documento escrito con la investigación y el estudio de caso
