// gimnasia.wlk
//gimnasia.wlk*
class Rutina {
  var property intensidad = 0
  var property descanso = 0
  var property tiempo
  
  method caloriasconsumidas() = (100 * (tiempo - descanso)) * intensidad
  
}

class Running inherits Rutina {
  override method descanso() = if (tiempo > 20) 5 else 2
}

class Maraton inherits Running {
  override method caloriasconsumidas() = ((100 * (tiempo - descanso)) * intensidad) * 2
}

class Remo inherits Rutina {
  override method intensidad() = 1.3
  
  override method descanso() = tiempo / 5
}

class Remodecompeticion inherits Remo {
  override method intensidad() = 1.7

  override method descanso() = if (Remo.descanso() - 3 < 2) 2 else Remo.descanso() - 3
}