from django.db import models

# Create your models here.
class Pelicula(models.Model):
    titulo = models.CharField(max_length=200)
    director = models.CharField(max_length=200)
    genero = models.CharField(max_length=200)
    sinopsis = models.TextField()
    foto = models.ImageField()
    
class Sala(models.Model):
    numeroSala = models.IntegerField()
    numeroFilas = models.IntegerField()
    numeroAsientosFila = models.IntegerField()
    numeroAsientosUltimaFila = models.IntegerField()
    
class Comentario(models.Model):
    pelicula = models.ForeignKey(Pelicula, default="", on_delete=models.CASCADE)
    asunto = models.CharField(max_length=200, null=True, blank=True)
    opinion = models.TextField()
    
class Sesion(models.Model):
    pelicula = models.ForeignKey(Pelicula, default="", on_delete=models.CASCADE)
    sala = models.ForeignKey(Sala, default="", on_delete=models.CASCADE)
    fecha = models.DateField()
    hora = models.TimeField()
    
class Reserva(models.Model):
    sesion = models.ForeignKey(Sesion, default="", on_delete=models.CASCADE)
    numeroEntradas = models.IntegerField()
    
class Asiento(models.Model):
    reserva = models.ForeignKey(Reserva, default="", on_delete=models.CASCADE)
    numeroFila = models.IntegerField()
    numeroAsiento = models.IntegerField()