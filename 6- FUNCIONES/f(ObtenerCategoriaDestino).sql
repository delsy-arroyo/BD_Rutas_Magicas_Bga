CREATE DEFINER=`credicel_mysql_estudiantes_ago24`@`%` FUNCTION `ObtenerCategoriaDestino`(nombre_destino VARCHAR(255)) RETURNS varchar(50) CHARSET utf8mb4 COLLATE utf8mb4_spanish_ci
    DETERMINISTIC
BEGIN
    DECLARE categoria_destino VARCHAR(50);

    -- Consulta para obtener la categoría del destino
    SELECT c.nombre
    INTO categoria_destino
    FROM Destinos d
    JOIN CategoriasDestinos c ON d.id_categoria = c.id_categoria
    WHERE d.nombre LIKE CONCAT('%', nombre_destino, '%')
    LIMIT 1;

    -- Si no se encuentra el destino, devolver un valor por defecto
    IF categoria_destino IS NULL THEN
        RETURN 'No disponible';
    ELSE
        RETURN categoria_destino;
    END IF;
END