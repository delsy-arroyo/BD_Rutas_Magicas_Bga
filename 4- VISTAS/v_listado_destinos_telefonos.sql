CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `credicel_mysql_estudiantes_ago24`@`%` 
    SQL SECURITY DEFINER
VIEW `v_listado_destinos_telefonos` AS
    SELECT 
        `D`.`nombre` AS `Nombre del Destino`,
        `T`.`telefono` AS `Telefono`
    FROM
        (`Destinos` `D`
        JOIN `Telefonos` `T` ON (`D`.`id_destino` = `T`.`id_destino`))