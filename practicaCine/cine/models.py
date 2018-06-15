from django.db import models

# Create your models here.

class Comentario(models.Model):
    titulo = models.CharField(max_length=200)
    opinion = models.CharField(max_length=200)
    
class Pelicula(models.Model):
    titulo = models.CharField(max_length=200)
    director = models.CharField(max_length=200)
    genero = models.CharField(max_length=200)
    sinopsis = models.CharField(max_length=200)
    foto = models.ImageField()
    comentario = models.ForeignKey(Comentario, on_delete= models.CASCADE)