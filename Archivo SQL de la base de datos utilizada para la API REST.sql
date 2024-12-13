-- Creamos la base de datos
CREATE DATABASE db_api;

-- Creamos la tabla 'videojuegos'
CREATE TABLE IF NOT EXISTS public.videojuegos (
    id SERIAL PRIMARY KEY,         -- ID autoincremental, tipo SERIAL para que PostgreSQL lo maneje automáticamente
    nombre VARCHAR(255) NOT NULL,   -- Nombre del videojuego
    genero VARCHAR(100) NOT NULL,   -- Género del videojuego
    precio INTEGER           -- Precio del videojuego
);

-- Creamos la tabla 'usuarios'
CREATE TABLE IF NOT EXISTS public.usuarios (
    id SERIAL PRIMARY KEY,         -- ID autoincremental, tipo SERIAL para que PostgreSQL lo maneje automáticamente
    nombreC VARCHAR(100) NOT NULL,   -- Nombre del usuario
    correo VARCHAR(100) NOT NULL,   -- Correo electrónico del usuario
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Fecha de registro del usuario
);

-- Insertamos 3 registros de ejemplo en la tabla 'videojuegos'
INSERT INTO public.videojuegos (nombre, genero, precio)
VALUES
    ('The Legend of Zelda: Breath of the Wild', 'Aventura', 60),
    ('Super Mario Odyssey', 'Plataforma', 50),
    ('Red Dead Redemption 2', 'Acción', 70);

-- Insertamos 3 registros de ejemplo en la tabla 'usuarios'
INSERT INTO public.usuarios (nombreC, correo)
VALUES
	('Juan Pérez', 'juan.perez@example.com'),
	('María López', 'maria.lopez@example.com'),
	('Carlos García', 'carlos.garcia@example.com');
	
SELECT * FROM public.videojuegos
SELECT * FROM public.usuarios


// Endpoints para los controladores de la tabla 'videojuegos'
$routes->get('/consultar', 'Home::consultar');        // Obtener todos los videojuegos
$routes->get('/consultar/(:num)', 'Home::obtener/$1'); // Obtener un videojuego por ID
$routes->post('/crear', 'Home::crear');                // Crear un nuevo videojuego
$routes->put('/actualizar/(:num)', 'Home::actualizar/$1'); // Actualizar un videojuego
$routes->delete('/eliminar/(:num)', 'Home::eliminar/$1'); // Eliminar un videojuego

// Endpoints para los controladores de la tabla 'usuarios'

$routes->get('/usuarios/consultar', 'Usuarios::consultar');        // Obtener todos los usuarios
$routes->get('/usuarios/consultar/(:num)', 'Usuarios::obtener/$1'); // Obtener un usuario por ID
$routes->post('/usuarios/crear', 'Usuarios::crear');                // Registrar nuevo usuario
$routes->put('/usuarios/actualizar/(:num)', 'Usuarios::actualizar/$1'); // Actualizar los datos de un usuario
$routes->delete('/usuarios/eliminar/(:num)', 'Usuarios::eliminar/$1'); // Eliminar a un usuario