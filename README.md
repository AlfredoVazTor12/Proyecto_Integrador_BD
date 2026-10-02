# Sistema de Gestión de Documentos y Ministerios
**Asignatura:** Diseño de Bases de Datos - UADY Virtual  
**Alumno:** Jorge Alfredo Vázquez Torres

## Descripción
Aplicación en Java con conexión JDBC a una base de datos MySQL normalizada hasta la 3FN. Permite gestionar usuarios, roles, ministerios, categorías y documentos, implementando operaciones CRUD completas y consultas relacionales (JOIN).

## Requisitos previos
- Docker y Docker Compose instalados.
- Java Development Kit (JDK) 11 o superior.
- Controlador JDBC de MySQL (`mysql-connector-j`).

## Instrucciones de Ejecución
1. **Levantar la base de datos:**
   Abre una terminal en la raíz del proyecto y ejecuta:
   `docker-compose up -d`
2. **Cargar el esquema DDL:**
   El archivo `db/esquema_ddl.sql` se ejecuta automáticamente al iniciar el contenedor (si está mapeado en `docker-compose.yml`) o puede ejecutarse manualmente en el gestor de base de datos (ej. DBeaver).
3. **Ejecutar la aplicación:**
   Compila y ejecuta el archivo principal en la carpeta `/app/src`.
