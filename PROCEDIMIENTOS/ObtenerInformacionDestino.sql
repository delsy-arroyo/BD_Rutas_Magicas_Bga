--Procedimiento para retornar la informacion de un destino, introduciendo el nombre del destino. Si este no existe se retornara No se encontró un destino con ese nombre.

CREATE DEFINER=`credicel_mysql_estudiantes_ago24`@`%` PROCEDURE `ObtenerInformacionDestino`(
    IN nombre_destino VARCHAR(255)
)
BEGIN
    -- Definir las variables locales para almacenar los resultados
    DECLARE destino_nombre VARCHAR(255);
    DECLARE destino_categoria VARCHAR(50);
    DECLARE destino_telefono VARCHAR(20);
    DECLARE destino_direccion TEXT;
    DECLARE destino_redes_sociales TEXT;
    DECLARE mensaje_error VARCHAR(255);

    -- Inicializar la variable de error
    SET mensaje_error = '';

    -- Buscar el destino por nombre en la tabla Destinos y obtener su categoría
    SELECT d.nombre, c.nombre
    INTO destino_nombre, destino_categoria
    FROM Destinos d
    JOIN CategoriasDestinos c ON d.id_categoria = c.id_categoria
    WHERE d.nombre LIKE CONCAT('%', nombre_destino, '%')
    LIMIT 1;

    -- Si no se encuentra el destino, asignar un mensaje de error
    IF destino_nombre IS NULL THEN
        SET mensaje_error = 'No se encontró un destino con ese nombre.';
    END IF;

    -- Si hay error, devolver el mensaje de error y no continuar
    IF mensaje_error != '' THEN
        SELECT mensaje_error AS Error;
    ELSE
        -- Si el destino existe, obtener el teléfono del destino
        SELECT t.telefono
        INTO destino_telefono
        FROM Telefonos t
        JOIN Destinos d ON t.id_destino = d.id_destino
        WHERE d.nombre LIKE CONCAT('%', nombre_destino, '%')
        LIMIT 1;

        -- Obtener la dirección del destino
        SELECT dir.direccion
        INTO destino_direccion
        FROM Direcciones dir
        JOIN Destinos d ON dir.id_destino = d.id_destino
        WHERE d.nombre LIKE CONCAT('%', nombre_destino, '%')
        LIMIT 1;

        -- Obtener las redes sociales del destino
        SELECT GROUP_CONCAT(rs.link SEPARATOR ', ') INTO destino_redes_sociales
        FROM RedesSociales rs
        JOIN Destinos d ON rs.id_destino = d.id_destino
        WHERE d.nombre LIKE CONCAT('%', nombre_destino, '%');

        -- Devolver los resultados: nombre, categoría, teléfono, dirección y redes sociales
        SELECT
            destino_nombre AS 'Destino',
            destino_categoria AS 'Categoría',
            IFNULL(destino_telefono, 'No disponible') AS 'Teléfono',
            IFNULL(destino_direccion, 'No disponible') AS 'Dirección',
            IFNULL(destino_redes_sociales, 'No disponible') AS 'Redes Sociales';
    END IF;

END