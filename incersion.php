<?php
// Conexión a la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$database = "gimnasio";

$conn = new mysqli($servername, $username, $password, $database);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Generar y ejecutar las inserciones aleatorias
for ($i = 0; $i < 100; $i++) {
    $nombre = getRandomName(); // Función para obtener nombres aleatorios
    $estado = getRandomState(); // Función para obtener estados aleatorios
    $ciudad = getRandomCity(); // Función para obtener ciudades aleatorias
    $edad = rand(18, 65); // Edad aleatoria entre 18 y 65 años
    $sexo = rand(0, 1) ? 'Masculino' : 'Femenino'; // Género aleatorio

    $sql = "INSERT INTO personas (nombre, estado, ciudad, edad, sexo) VALUES ('$nombre', '$estado', '$ciudad', $edad, '$sexo')";

    if ($conn->query($sql) !== TRUE) {
        echo "Error al insertar registro: " . $conn->error;
    }
}

echo "Inserción de 100 registros aleatorios completada.";

// Cerrar la conexión
$conn->close();

// Función para obtener nombres aleatorios (puedes personalizarla o usar un generador de nombres)
function getRandomName() {
    $names = ['Juan', 'María', 'Carlos', 'Ana', 'Luis', 'Laura', 'Pedro', 'Sofía', 'Miguel', 'Isabel'];
    return $names[array_rand($names)];
}

// Función para obtener estados aleatorios (puedes personalizarla o usar una lista de estados)
function getRandomState() {
    $states = ['California', 'Texas', 'Florida', 'New York', 'Illinois', 'Arizona', 'Colorado', 'Georgia', 'North Carolina', 'Ohio'];
    return $states[array_rand($states)];
}

// Función para obtener ciudades aleatorias (puedes personalizarla o usar una lista de ciudades)
function getRandomCity() {
    $cities = ['Los Angeles', 'Houston', 'Miami', 'Nueva York', 'Chicago', 'Phoenix', 'Denver', 'Atlanta', 'Charlotte', 'Cleveland'];
    return $cities[array_rand($cities)];
}
?>