<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bd_hospital";
//conexion a la base de datos
$conn = new mysqli($servername, $username, $password, $dbname);

//verifica la conexión
if ($conn->connect_error) {
    die("La conexión a la base de datos falló: ". $connect_error);
}

//crear tablas

$sql = "CREATE TABLE paciente (
        paciente_id INT AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR (100) NOT NULL,
        fecha_nacimiento DATE,
        direccion VARCHAR (255),
        telefono VARCHAR (15)
)";

if ($conn->query($sql)===true) {
    echo "Tabla Paciente creada con éxito";

}else {
    echo "Error al crear la tabla pacientes";
}

$sql = "CREATE TABLE medicos (
    medico_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (100) NOT NULL,
    especialidad VARCHAR (255)
    
)";

if ($conn->query($sql)===true) {
echo "Tabla Medicos creada con éxito";

}else {
echo "Error al crear la tabla medicos";
}

$sql = "CREATE TABLE citas (
    cita_id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_hora DATETIME,
    motivo VARCHAR (50),
    paciente_id INT,
    medico_id INT,
    constraint fk_pacientes foreign key (paciente_id) references paciente (paciente_id),
    constraint fk_medicos foreign key (medico_id) references medicos (medico_id)
)";

if ($conn->query($sql)===true) {
    echo "Tabla Medicos creada con éxito";
    
    }else {
    echo "Error al crear la tabla medicos";
    }

$sql = "CREATE TABLE historialesMédicos (
    historial_id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    fecha DATE,
    diagnostico TEXT,
    tratamiento TEXT,
    foreign key (paciente_id) references paciente (paciente_id)
)";

if ($conn->query($sql)===true) {
    echo "Tabla Historiales Medicos creada con éxito";
    
    }else {
    echo "Error al crear la tabla";
    }

$conn->close();
?>
