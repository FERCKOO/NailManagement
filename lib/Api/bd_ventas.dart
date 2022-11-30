/**
 * Base de datos local para la app dinamica
 */

// Costos de las ventas que se han hecho
Map<int, int> costos = {
  1: 120,
  2: 350
};

// Sumatoria total de las ventas hechas
int totalVentas (){
  var total = 0;
  for (int i = 0; i < costos.length; i++){
    total += costos.values.elementAt(i);
  }

  return total;
}