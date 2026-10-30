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

class Persona {
  var property peso = 0

  var property rutina = Rutina
  
  method aplicaARutina() {
    if (!self.puedeAplicar()) self.error(
        "esta rutina no puede ser aplicada a la persona por su peso"
      )
    peso = (peso - self.pesoPerdidoEnRutina()) 
  }

  method pesoPerdidoEnRutina() = rutina.caloriasconsumidas() / self.caloriasPorKilo()

  method puedeAplicar() 

  method caloriasPorKilo()  
  }



//ARQUETIPOS
class Sedentaria inherits Persona{
  var property tiempo = 0
  
  override method caloriasPorKilo() = 7000
  
  override method puedeAplicar() = self.peso() > 50
}

class Atleta inherits Persona{
  const property tiempo = 90 
   
  override method rutina(_rutina){
  rutina = _rutina
  rutina.tiempo(tiempo)
  }

  override method caloriasPorKilo() = 8000
  
  override method puedeAplicar() = rutina.caloriasconsumidas() > 10000

  override method pesoPerdidoEnRutina() =  super() - 1
}