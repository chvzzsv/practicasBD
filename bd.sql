CREATE TABLE pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre_paciente VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    direccion VARCHAR(100)
);
CREATE TABLE medico (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    nombre_medico VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50)
);
CREATE TABLE consultaMedica (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    diagnostico VARCHAR(50),
    id_paciente INT,
    id_medico INT,
    constraint fk_paciente Foreign Key (id_paciente) REFERENCES pacientes (id_paciente),
    constraint fk_medico Foreign Key (id_medico) REFERENCES medico (id_medico)
);
CREATE TABLE medicamentos (
    id_medicamentos INT AUTO_INCREMENT PRIMARY KEY,
    nombre_medicamento VARCHAR(50) NOT NULL
);
CREATE TABLE receta (
    id_receta INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    id_medico INT,
    id_medicamentos INT,
    constraint fk_pacientes Foreign Key (id_paciente) REFERENCES pacientes (id_paciente),
    constraint fk_medicos Foreign Key (id_medico) REFERENCES medico (id_medico),
    constraint fk_medicamentos Foreign Key (id_medicamentos) REFERENCES medicamentos (id_medicamentos)
);