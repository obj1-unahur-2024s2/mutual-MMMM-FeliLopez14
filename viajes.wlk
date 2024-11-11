class Actividad{
    const property idiomas = #{}
    method implicaEsfuerzo()
    method esParaBroncearse() = true
    method diasDeActividad()
    method esInteresante() = idiomas.size() > 1
    method esRecomendadaPara(unSocio) = self.esInteresante() and unSocio.atraeAlSocio(self) and !unSocio.actividades().contains(self)
}


class ViajeDePlaya inherits Actividad{
    const largo
    override method diasDeActividad() = largo / 500
    override method implicaEsfuerzo() = largo > 1200
}


class ExcursionACiudad inherits Actividad{
    const atracciones
    override method diasDeActividad() = atracciones / 2
    override method implicaEsfuerzo() = atracciones.between(5, 8)
    override method esInteresante() = super() or atracciones == 5
    override method esParaBroncearse() = false
}


class ExcursionACiudadTropical inherits ExcursionACiudad{
    override method diasDeActividad() = super() + 1
    override method esParaBroncearse() = true
}


class SalidaDeTrekking inherits Actividad{
    const kmDeSenderos
    const diasDeSol
    override method diasDeActividad() =  kmDeSenderos / 50
    override method implicaEsfuerzo() = kmDeSenderos > 80000
    override method esParaBroncearse() = diasDeSol > 200 or (diasDeSol.between(100, 200) and kmDeSenderos > 120)
    override method esInteresante() = super() and diasDeSol > 140
}

class ClaseDeGimnasia inherits Actividad{

    method initialize(){
        idiomas.clear()
        idiomas.add("Spanish")
    }
    override method diasDeActividad() = 1
    override method implicaEsfuerzo() = true
    override method esParaBroncearse() = false
    override method esRecomendadaPara(unSocio) = unSocio.edad().between(20, 30)
}


class TallerLiterario inherits Actividad{
    const libros = #{}
    method initialize(){
        idiomas.clear()
        idiomas.addAll(libros.map({l => l.idioma()}))
    }
    method idiomasUsados() = libros.map({l => l.idioma()})
    override method diasDeActividad() = libros.size() + 1
    override method implicaEsfuerzo() = libros.any({l => l.paginas() > 500}) or (libros.all({l => l.autor() == libros.first().autor()}) and libros.size() > 1)
    override method esParaBroncearse() = false
    override method esRecomendadaPara(unSocio) = unSocio.idiomas().size() > 1
}


class Libros{
    const property idioma
    const property paginas
    const property autor
}