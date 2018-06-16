from django.shortcuts import render
from django.http import HttpResponse, Http404
from django.db.models import Q
from .models import Pelicula, Sala, Comentario, Sesion, Reserva, Asiento

# Create your views here.

def index(request):
    return render(request, 'cine/index.html')

#Cartelera
def cartelera(request):
    
    query = request.GET.get('q', '')
    if query:
        qset = (
            Q(titulo__icontains=query) |
            Q(director__icontains=query)
        )
        peliculas = Pelicula.objects.filter(qset)
    else:
        peliculas = Pelicula.objects.all().order_by('-titulo')
    
    return render(request, 'cine/cartelera.html', {'peliculas': peliculas, 'query': query})

def reservas(request):
    peliculas = Pelicula.objects.all().order_by('-titulo')
    return render(request, 'cine/reservas.html', {'peliculas': peliculas})

#def detalle(request):
#   peliculas = Pelicula.objects.all().order_by('-titulo')
#  return render(request, 'cine/detalle.html', {'peliculas': peliculas})

def detalle(request, id_pelicula):
    try:
        pelicula = Pelicula.objects.get(pk=id_pelicula)
        comentarios = Comentario.objects.filter(pelicula_id=id_pelicula)
        sesiones = Sesion.objects.filter(pelicula_id=id_pelicula)
    except:
        raise Http404('La pelicula no existe')
    return render(request, 'cine/detalle.html', {'pelicula': pelicula, 'comentarios': comentarios, 'sesiones': sesiones})