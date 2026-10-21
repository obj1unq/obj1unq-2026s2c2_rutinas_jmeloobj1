class Rutina {
  var property intensidad = 0
  var property descanso = 0
  var property tiempo = 0
  
  method caloriasconsumidas() = (100 * (tiempo - descanso)) * intensidad
}

class Running inherits Rutina {
  override method descanso() = if (tiempo > 20) 5 else 2
}

class Maratón inherits Rutina {
  
}

class Remo inherits Rutina {
  
}

class Remodecompetición inherits Rutina {
  
}