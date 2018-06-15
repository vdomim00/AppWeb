from django.shortcuts import render
from django.http import HttpResponse
from .models import Pelicula
from .models import Comentario

# Create your views here.

def index(request):
    return render(request, 'cine/index.html')

#Cartelera
def cartelera(request):
    peliculas = Pelicula.objects.all().order_by('-titulo')
    return render(request, 'cine/cartelera.html', {'peliculas': peliculas})