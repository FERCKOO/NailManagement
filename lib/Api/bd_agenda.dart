
/**
 * Base de datos local para la app dinamica
 */

// Servicio hecho
Map<int,String> servicio = {
  1:'Gel',
  2: 'Soft gel'
};

// Nombre de clientes
Map<int, String> cliente = {
  1: 'Carmen',
  2: 'Josefa'
};

//Fecha y hra del servicio agendado
Map<int, String> fechaHoraCita = {
  1: '15/09/2022 14:0',
  2: '15/09/2022 13:0'
};

// Variables globales para extrare fecha y hora de la cita
String fechaCita = '';
String horaCita = '';

// Variable global para el tipo de servicio solicitado
String TipoServicio = '';