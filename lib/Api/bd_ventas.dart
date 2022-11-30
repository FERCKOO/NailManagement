Map<int, int> costos = {
  1: 120,
  2: 350
};

int totalVentas (){
  var total = 0;
  for (int i = 0; i < costos.length; i++){
    total += costos.values.elementAt(i);
  }

  return total;
}