class Socio{
    const property actividades = []
    const limiteDeActividades
    const property idiomas = #{}
    const property edad 
    
    method adoraElSol() = actividades.all({a => a.esParaBroncearse()})
    method actividadesEsforzadas() = actividades.filter({a => a.implicaEsfuerzo()})
    method registrarActividad(unaActividad) {
        if(limiteDeActividades == actividades.size()){
            self.error("Alcanzo el maximo de actividades")
        }
            actividades.add(unaActividad)
    }
    method atraeAlSocio(unaActividad)
}


class SocioTranquilo inherits Socio{
    override method atraeAlSocio(unaActividad) = unaActividad.diasDeActividad() >= 4
}


class SocioCoherente inherits Socio{
    override method atraeAlSocio(unaActividad) = if(self.adoraElSol()) unaActividad.esParaBroncearse() else unaActividad.implicaEsfuerzo()
}


class SocioRelajado inherits Socio{
    override method atraeAlSocio(unaActividad) {
        return !idiomas.intersection(unaActividad.language()).isEmpty()
    }
}