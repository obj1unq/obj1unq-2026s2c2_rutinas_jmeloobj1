// gimnasia.wlk
// gimasia.wlk*
class Rutina {
  var property intensidad = 0
  var property descanso = 0
  var property tiempo = 0
  
  method caloriasconsumidas() = (100 * (tiempo - descanso)) * intensidad
}

class Running inherits Rutina {
  override method descanso() = if (tiempo > 20) 5 else 2
  
  override method caloriasconsumidas() = (100 * (tiempo - self.descanso())) * intensidad
}

class Maraton inherits Running {
   override method caloriasconsumidas() = super() * 2
}

class Remo inherits Rutina {
  override method intensidad() = 1.3
  
  override method descanso() = tiempo / 5
  
  override method caloriasconsumidas() = (100 * (tiempo - self.descanso())) * self.intensidad()
}

class Remodecompeticion inherits Remo {
  override method intensidad() = 1.7
  
  override method descanso() = (super() - 3).max(2)
  
  override method caloriasconsumidas() = (100 * (tiempo - self.descanso())) * self.intensidad()
}

class Persona{
 const property rutina = Rutina 
 const property arquetipoPersona


}