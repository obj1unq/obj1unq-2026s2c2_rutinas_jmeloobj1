// gimnasia.wlk
// gimasia.wlk*
class Rutina {
  var property intensidad = 0
  
  method descanso(tiempo) = 0
  
  method caloriasconsumidas(tiempo) = (100 * (tiempo - self.descanso(
    tiempo
  ))) * self.intensidad()
}

class Running inherits Rutina {
  override method descanso(tiempo) = if (tiempo > 20) 5 else 2
}

class Maraton inherits Running {
  override method caloriasconsumidas(tiempo) = super(tiempo) * 2
}

class Remo inherits Rutina {
  override method intensidad() = 1.3
  
  override method descanso(tiempo) = tiempo / 5
}

class Remodecompeticion inherits Remo {
  override method intensidad() = 1.7
  
  override method descanso(tiempo) = (super(tiempo) - 3).max(2)
}

class Persona {
  var property peso = 0
  
  method tiempo()
  
  method aplicaARutina(rutina) {
    if (!self.puedeAplicar(rutina)) self.error(
        "esta rutina no puede ser aplicada a la persona"
      )
    peso -= self.pesoPerdidoEnRutina(rutina)
  }
  
  method pesoPerdidoEnRutina(rutina) = rutina.caloriasconsumidas(
    self.tiempo()
  ) / self.caloriasPorKilo()
  
  method puedeAplicar(rutina)
  
  method caloriasPorKilo()

  method caloriasConsumidasEnRutina(rutina) = rutina.caloriasconsumidas(self.tiempo())

}
 //ARQUETIPOS

class Sedentaria inherits Persona {
  const tiempo 

  override method tiempo()  = tiempo
  
  override method caloriasPorKilo() = 7000
  
  override method puedeAplicar(rutina) = self.peso() > 50
}

class Atleta inherits Persona {
  override method tiempo() = 90
  
  override method caloriasPorKilo() = 8000
  
  override method puedeAplicar(rutina) = self.caloriasConsumidasEnRutina(rutina) > 10000
  
  override method pesoPerdidoEnRutina(rutina) = super(rutina) - 1
}

class Club {
  const property predios = []
  
  method mejorPredio(persona) = predios.max(
    { predio => predio.caloriasPerdidasEnRutinas(persona) }
  )
  
  method prediosTranqui(persona) = predios.filter(
    { predio => predio.rutinaTranqui(persona) }
  )
  
  method rutinasMasExigentes(persona) = predios.map(
    { predio => predio.rutinaMasExigente(persona) }
  )
}

class Predio {
  const property rutinas = []
  
  method caloriasPerdidasEnRutinas(persona) = rutinas.sum(
    { rutina => persona.caloriasConsumidasEnRutina(rutina) }
  )
  
  method rutinaTranqui(persona) = rutinas.any(
    { rutina => persona.caloriasConsumidasEnRutina(rutina) < 500 }
  )
  
  method rutinaMasExigente(persona) = rutinas.max(
    { rutina => persona.caloriasConsumidasEnRutina(rutina) }
  )
}