CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `credicel_mysql_estudiantes_ago24`@`%` 
    SQL SECURITY DEFINER
VIEW `v_destinos_con_facebook` AS
    SELECT 
        `D`.`nombre` AS `Destino`,
        `NRS`.`nombre_red_social` AS `Tipo Red Social`,
        `RS`.`link` AS `Link_Red_Social`
    FROM
        ((`Destinos` `D`
        JOIN `RedesSociales` `RS` ON (`D`.`id_destino` = `RS`.`id_destino`))
        JOIN `NombresRedesSociales` `NRS` ON (`NRS`.`id_nombre_red_social` = `RS`.`id_nombre_red_social`))
    WHERE
        `NRS`.`id_nombre_red_social` = 1