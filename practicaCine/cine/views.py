from django.shortcuts import render
from django.http import HttpResponse
from .models import Pelicula, Sala, Comentario, Sesion, Reserva, Asiento

# Create your views here.

def index(request):
    return render(request, 'cine/index.html')

#Cartelera
def cartelera(request):
    peliculas = Pelicula.objects.all().order_by('-titulo')
    return render(request, 'cine/cartelera.html', {'peliculas': peliculas})

def reservas(request):
    peliculas = Pelicula.objects.all().order_by('-titulo')
    return render(request, 'cine/reservas.html', {'peliculas': peliculas})

def detalle(request):
    peliculas = Pelicula.objects.all().order_by('-titulo')
    return render(request, 'cine/detalle.html', {'peliculas': peliculas})