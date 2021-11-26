CREATE TABLE agm_cita (
  id_cita INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY(id_cita)
);

CREATE TABLE hca_antecedente (
  id_antecedente INT NOT NULL AUTO_INCREMENT,
  hca_historia_clinica_agm_cita_id_cita INTEGER UNSIGNED NOT NULL,
  hca_historia_clinica_id_historia_clinica INT NOT NULL,
  id_enfermedad INT NULL DEFAULT 10,
  tipo_antecedente INT NULL DEFAULT 10,
  id_historia_clinica INT NULL DEFAULT 10,
  id_paciente INT NULL DEFAULT 10,
  comentario VARCHAR NULL DEFAULT 100,
  PRIMARY KEY(id_antecedente),
  INDEX hca_antecedente_FKIndex1(hca_historia_clinica_id_historia_clinica, hca_historia_clinica_agm_cita_id_cita)
);

CREATE TABLE hca_diagnostico_paciente (
  id_diagnostico_paciente INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  hca_historia_clinica_agm_cita_id_cita INTEGER UNSIGNED NOT NULL,
  hca_historia_clinica_id_historia_clinica INT NOT NULL,
  id_historia_clinica INT NULL,
  id_paciente INT NULL,
  tipo INT NULL,
  PRIMARY KEY(id_diagnostico_paciente),
  INDEX hca_diagnostico_paciente_FKIndex1(hca_historia_clinica_id_historia_clinica, hca_historia_clinica_agm_cita_id_cita)
);

CREATE TABLE hca_formato (
  id_formato INT NOT NULL AUTO_INCREMENT,
  nombre_formato VARCHAR NULL DEFAULT 100,
  sexo INT NULL,
  edad_inicial INT NULL,
  edad_final INT NULL,
  estado_formato INT NULL,
  PRIMARY KEY(id_formato)
);

CREATE TABLE hca_formato_informacion (
  id_formato_informacion INT NOT NULL AUTO_INCREMENT,
  hca_historia_clinica_agm_cita_id_cita INTEGER UNSIGNED NOT NULL,
  hca_historia_clinica_id_historia_clinica INT NOT NULL,
  id_respuesta INT NULL,
  id_paciente INT NULL,
  id_historia_clinica INT NULL,
  respuesta VARCHAR NULL DEFAULT 100,
  fecha_creacion DATE NULL,
  PRIMARY KEY(id_formato_informacion),
  INDEX hca_formato_informacion_FKIndex1(hca_historia_clinica_id_historia_clinica, hca_historia_clinica_agm_cita_id_cita)
);

CREATE TABLE hca_formato_pregunta (
  id_formato_pregunta INT NOT NULL AUTO_INCREMENT,
  hca_formato_id_formato INT NOT NULL,
  id_formato INT NULL,
  detalle VARCHAR NULL DEFAULT 100,
  tipo_pregunta INT NULL,
  estado_pregunta INT NULL,
  PRIMARY KEY(id_formato_pregunta),
  INDEX hca_formato_pregunta_FKIndex1(hca_formato_id_formato)
);

CREATE TABLE hca_formato_respuesta (
  id_formato_respuesta INT NOT NULL AUTO_INCREMENT,
  hca_formato_informacion_id_formato_informacion INT NOT NULL,
  hca_formato_pregunta_id_formato_pregunta INT NOT NULL,
  id_formato_pregunta INT NULL,
  detalle VARCHAR NULL,
  estado_respuesta INT NULL,
  PRIMARY KEY(id_formato_respuesta),
  INDEX hca_formato_respuesta_FKIndex1(hca_formato_pregunta_id_formato_pregunta),
  INDEX hca_formato_respuesta_FKIndex2(hca_formato_informacion_id_formato_informacion)
);

CREATE TABLE hca_historia_clinica (
  id_historia_clinica INT NOT NULL AUTO_INCREMENT,
  agm_cita_id_cita INTEGER UNSIGNED NOT NULL,
  mae_paciente_agm_cita_id_cita INTEGER UNSIGNED NOT NULL,
  mae_paciente_id_paciente INT NOT NULL,
  fecha DATE NULL,
  id_cita INT NULL,
  id_paciente INT NULL,
  id_medico INT NULL,
  motivo_consulta VARCHAR NULL DEFAULT 1000,
  enfermedad_actual VARCHAR NULL DEFAULT 1000,
  analisis VARCHAR NULL DEFAULT 1000,
  plan VARCHAR NULL DEFAULT 1000,
  estado INT NULL DEFAULT 10,
  tipo INT NULL DEFAULT 10,
  PRIMARY KEY(id_historia_clinica, agm_cita_id_cita),
  INDEX hca_historia_clinica_FKIndex1(agm_cita_id_cita),
  INDEX hca_historia_clinica_FKIndex2(mae_paciente_id_paciente, mae_paciente_agm_cita_id_cita)
);

CREATE TABLE hca_orden_laboratorio (
  id_orden_laboratorio INT NOT NULL AUTO_INCREMENT,
  hca_historia_clinica_agm_cita_id_cita INTEGER UNSIGNED NOT NULL,
  hca_historia_clinica_id_historia_clinica INT NOT NULL,
  id_historia_clinica INT NULL,
  fecha DATE NULL,
  id_paciente VARCHAR NULL DEFAULT 100,
  estado INT NULL DEFAULT 10,
  id_medico INT NULL,
  PRIMARY KEY(id_orden_laboratorio),
  INDEX hca_orden_laboratorio_FKIndex1(hca_historia_clinica_id_historia_clinica, hca_historia_clinica_agm_cita_id_cita)
);

CREATE TABLE hca_orden_laboratorio_det (
  id_orden_laboratorio_det INT NOT NULL AUTO_INCREMENT,
  hca_orden_laboratorio_id_orden_laboratorio INT NOT NULL,
  id_orden_laboratorio INT NULL,
  id_laboratorio INT NULL,
  cantidad INT NULL DEFAULT 10,
  comentario VARCHAR NULL,
  PRIMARY KEY(id_orden_laboratorio_det),
  INDEX hca_orden_laboratorio_det_FKIndex1(hca_orden_laboratorio_id_orden_laboratorio)
);

CREATE TABLE hca_orden_medicamento (
  id_orden_medicamento INT NOT NULL AUTO_INCREMENT,
  hca_historia_clinica_agm_cita_id_cita INTEGER UNSIGNED NOT NULL,
  hca_historia_clinica_id_historia_clinica INT NOT NULL,
  Id_historia_clinica INT NULL DEFAULT 100,
  fecha DATETIME NULL,
  id_paciente INT NULL DEFAULT 10,
  estado INT NULL DEFAULT 10,
  id_medico INT NULL DEFAULT 10,
  PRIMARY KEY(id_orden_medicamento),
  INDEX hca_orden_medicamento_FKIndex1(hca_historia_clinica_id_historia_clinica, hca_historia_clinica_agm_cita_id_cita)
);

CREATE TABLE hca_orden_medicamento_det (
  id_orden_medicamento_det INT NOT NULL AUTO_INCREMENT,
  hca_orden_medicamento_id_orden_medicamento INT NOT NULL,
  id_orden_medicamento INT NULL,
  id_producto INT NULL,
  dosis DOUBLE NULL,
  unidad VARCHAR NULL,
  id_via INT NULL,
  frecuencia VARCHAR NULL DEFAULT 100,
  dias INT NULL,
  cantidad INT NULL,
  PRIMARY KEY(id_orden_medicamento_det),
  INDEX hca_orden_medicamento_det_FKIndex1(hca_orden_medicamento_id_orden_medicamento)
);

CREATE TABLE hca_orden_procedimiento (
  id_orden_procedimiento INT NOT NULL AUTO_INCREMENT,
  hca_historia_clinica_agm_cita_id_cita INTEGER UNSIGNED NOT NULL,
  hca_historia_clinica_id_historia_clinica INT NOT NULL,
  id_historia_clinica INT NULL DEFAULT 100,
  fecha DATETIME NULL,
  id_paciente INT NULL DEFAULT 100,
  estado INT NULL DEFAULT 100,
  id_medico INT NULL DEFAULT 100,
  PRIMARY KEY(id_orden_procedimiento),
  INDEX hca_orden_procedimiento_FKIndex1(hca_historia_clinica_id_historia_clinica, hca_historia_clinica_agm_cita_id_cita)
);

CREATE TABLE hca_orden_procedimiento_det (
  id_orden_procedimiento_det INT NOT NULL AUTO_INCREMENT,
  hca_orden_procedimiento_id_orden_procedimiento INT NOT NULL,
  id_orden_procedimiento INT NULL,
  id_procedimiento INT NULL,
  cantidad INT NULL,
  comentario VARCHAR NULL,
  PRIMARY KEY(id_orden_procedimiento_det),
  INDEX hca_orden_procedimiento_det_FKIndex1(hca_orden_procedimiento_id_orden_procedimiento)
);

CREATE TABLE hca_resolucion (
  id_resolucion INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR NULL,
  Estado INTEGER NULL DEFAULT 10,
  fecha_creacion DATE NULL,
  usuario_creacion VARCHAR NULL DEFAULT 100,
  PRIMARY KEY(id_resolucion)
);

CREATE TABLE hca_resolucion_diagnostico (
  id_resolucion_diagnostico INT NOT NULL AUTO_INCREMENT,
  hca_resolucion_id_resolucion INT NOT NULL,
  id_resolucion INT NULL,
  id_diagnostico INT NULL,
  estado INT NULL,
  PRIMARY KEY(id_resolucion_diagnostico),
  INDEX hca_resolucion_diagnostico_FKIndex1(hca_resolucion_id_resolucion)
);

CREATE TABLE hca_resolucion_informacion (
  i_resolucion_informacion INT NOT NULL AUTO_INCREMENT,
  mae_paciente_agm_cita_id_cita INTEGER UNSIGNED NOT NULL,
  mae_paciente_id_paciente INT NOT NULL,
  hca_resolucion_respueta_id_resolucion_respueta INT NOT NULL,
  id_resolucion_respuesa INT NULL,
  id_paciente INT NULL,
  respuesta VARCHAR NULL DEFAULT 100,
  fecha_registro DATE NULL,
  PRIMARY KEY(i_resolucion_informacion),
  INDEX hca_resolucion_informacion_FKIndex1(hca_resolucion_respueta_id_resolucion_respueta),
  INDEX hca_resolucion_informacion_FKIndex2(mae_paciente_id_paciente, mae_paciente_agm_cita_id_cita)
);

CREATE TABLE hca_resolucion_pregunta (
  id_resolucion_preguntas INT NOT NULL AUTO_INCREMENT,
  hca_resolucion_id_resolucion INT NOT NULL,
  id_resolucion INT NULL,
  titulo_pregunta VARCHAR NULL,
  tipo_pregunta INT NULL,
  estado_pregunta INT NULL,
  PRIMARY KEY(id_resolucion_preguntas),
  INDEX hca_resolucion_pregunta_FKIndex1(hca_resolucion_id_resolucion)
);

CREATE TABLE hca_resolucion_respueta (
  id_resolucion_respueta INT NOT NULL AUTO_INCREMENT,
  hca_resolucion_pregunta_id_resolucion_preguntas INT NOT NULL,
  id_resolucion_pregunta INT NULL,
  detalle VARCHAR NULL,
  estado INT NULL,
  PRIMARY KEY(id_resolucion_respueta),
  INDEX hca_resolucion_respueta_FKIndex1(hca_resolucion_pregunta_id_resolucion_preguntas)
);

CREATE TABLE mae_diagnostico (
  id_diagnostico INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  cod_cie VARCHAR NULL DEFAULT 10,
  nombre VARCHAR NULL DEFAULT 100,
  alto_costo INT NULL DEFAULT 10,
  tipo_cie INT NULL DEFAULT 10,
  id_resolucion INT NULL DEFAULT 10,
  id_grupo_diagnostico INT NULL DEFAULT 10,
  ets INT NULL DEFAULT 10,
  estado_diagnostico INT NULL DEFAULT 10,
  PRIMARY KEY(id_diagnostico)
);

CREATE TABLE mae_especialidad (
  id_especialidad INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR NULL DEFAULT 100,
  id_procedimiento_int INT NULL DEFAULT 10,
  id_procedimiento_ext INT NULL DEFAULT 10,
  id_procedimiento_urg INT NULL DEFAULT 10,
  estado_especialidad INT NULL DEFAULT 10,
  PRIMARY KEY(id_especialidad)
);

CREATE TABLE mae_medico (
  id_medico INT NOT NULL AUTO_INCREMENT,
  firma VARCHAR NOT NULL DEFAULT 100,
  id_empleado INT NULL DEFAULT 10,
  id_usuario INT NULL DEFAULT 10,
  estado_medico INT NULL DEFAULT 10,
  tercero_asistencial INT NULL DEFAULT 10,
  multiple_pacientes INT NULL DEFAULT 10,
  PRIMARY KEY(id_medico)
);

CREATE TABLE mae_medico_especialidad (
  id_medico_especialidad INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  mae_medico_id_medico INT NOT NULL,
  mae_especialidad_id_especialidad INT NOT NULL,
  id_medico INT NULL DEFAULT 10,
  id_especialidad INT NULL DEFAULT 10,
  estado INT NULL DEFAULT 10,
  PRIMARY KEY(id_medico_especialidad),
  INDEX mae_medico_especialidad_FKIndex1(mae_especialidad_id_especialidad),
  INDEX mae_medico_especialidad_FKIndex2(mae_medico_id_medico)
);

CREATE TABLE mae_paciente (
  id_paciente INT NOT NULL AUTO_INCREMENT,
  agm_cita_id_cita INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(id_paciente, agm_cita_id_cita),
  INDEX mae_paciente_FKIndex1(agm_cita_id_cita)
);


