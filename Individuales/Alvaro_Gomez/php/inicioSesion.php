<?php

    require_once 'conexion.php';

    $username = $conexion->mysqli_real_escape_string( $_POST['user']);
    $password = $conexion->mysqli_real_escape_string( $_POST['passwd']);
    
    $sql = 'SELECT user, passwd FROM administrativo WHERE user = '.$username.'AND passwd ='.$passwd.';';

    $resultado = $conexion->query($sql);

    if ($resultado->num_rows == 1) {
        header('Location: ../html/gestionReservas.html');
    }
    else {
        header('Location: ../html/login.html?$noInicioSesion="Usuario/Contraseña no válidos"');
    }

?>