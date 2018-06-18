from django.shortcuts import render
from django.http import HttpResponse, Http404, JsonResponse
from django.db.models import Q
from .models import Pelicula, Sala, Comentario, Sesion, Reserva, Asiento
import datetime
from django.utils import timezone
import json

# Create your views here.

def index(request):
    return render(request, 'cine/index.html')

#Cartelera
def cartelera(request):
    
    # Comprobamos los filtros, primero el de género y luego el de título y autor
    gen = request.GET.get('filtroG')
    if gen:
        if gen!='todo':
            peliculas = Pelicula.objects.filter(genero=gen)
            query = request.GET.get('q', '')
            if query:
                qset = (
                    Q(titulo__icontains=query) |
                    Q(director__icontains=query)
                )
                peliculas = peliculas.filter(qset)
            else:
                peliculas = peliculas.all().order_by('-titulo')
        else:
            query = request.GET.get('q', '')
            if query:
                qset = (
                    Q(titulo__icontains=query) |
                    Q(director__icontains=query)
                )
                peliculas = Pelicula.objects.filter(qset)
            else:
                peliculas = Pelicula.objects.all().order_by('-titulo')
    else:
        query = request.GET.get('q', '')
        if query:
            qset = (
                Q(titulo__icontains=query) |
                Q(director__icontains=query)
            )
            peliculas = Pelicula.objects.filter(qset)
        else:
            peliculas = Pelicula.objects.all().order_by('-titulo')
            
    # Aquí tendríamos las películas que cumplen ambos filtros, ahora tenemos que obtener las que tienen sesiones posteriores
    # Primero extraemos las sesiones que están relacionadas con alguna de las películas ya filtradas
    sesiones = Sesion.objects.none()
    for pelicula in peliculas:
        sesiones = sesiones | Sesion.objects.filter(pelicula_id=pelicula.id)
    
    # Filtramos las sesiones de manera que todas tengan una fecha con día igual o posterior, y hora posterior al momento de búsqueda
    sesiones = sesiones.filter(fecha__gte=datetime.date.today()).exclude(
        fecha=datetime.date.today(),
        hora__lte=datetime.datetime.now().strftime('%H:%M:%S')
        )
        
    # Comprobamos las películas que tienen sesiones en el conjunto anterior, y las añadimos al conjunto de películas final
    peliculas_final = Pelicula.objects.none()
    for sesion in sesiones: 
        if not peliculas_final.filter(pk=sesion.pelicula_id):
            peliculas_final = peliculas_final | peliculas.filter(pk=sesion.pelicula_id)
    
    # Devolvemos el conjunto final de películas, junto con la query y el filtro anterior
    return render(request, 'cine/cartelera.html', {'peliculas': peliculas_final, 'query': query, 'filtroG': gen})

def reservas(request):
    peliculas = Pelicula.objects.none()
    sesiones = Sesion.objects.none()
    salas = Sala.objects.none()
    peli = request.GET.get('filtroPeli')
    sesi = request.GET.get('filtroSesion')
    sal = request.GET.get('filtroSala')
    
    # Primero extraemos las sesiones que están relacionadas con alguna de las películas ya filtradas
    peliculas = Pelicula.objects.all().order_by('-titulo')
    for pelicula in peliculas:
        sesiones = sesiones | Sesion.objects.filter(pelicula_id=pelicula.id)
    
    # Filtramos las sesiones de manera que todas tengan una fecha con día igual o posterior, y hora posterior al momento de búsqueda
    sesiones = sesiones.filter(fecha__gte=datetime.date.today()).exclude(
        fecha=datetime.date.today(),
        hora__lte=datetime.datetime.now().strftime('%H:%M:%S')
        )
        
    # Comprobamos las películas que tienen sesiones en el conjunto anterior, y las añadimos al conjunto de películas final
    peliculas_final = Pelicula.objects.none()
    for sesion in sesiones: 
        if not peliculas_final.filter(pk=sesion.pelicula_id):
            peliculas_final = peliculas_final | peliculas.filter(pk=sesion.pelicula_id)
            
    # Si hay una película seleccionada
    if peli:
        pelicul = peliculas_final.filter(titulo=peli)
        sesiones = Sesion.objects.filter(pelicula_id=pelicul.first().id) 
        
        # Si hay una sesión seleccionada
        if sesi:
            fechaS, horaS = sesi.split('_')
            sesions = sesiones.filter(fecha=fechaS, hora=horaS)
            if sesions:
                salas = Sala.objects.none()
                for sesion in sesions:
                    salas = salas | Sala.objects.all().filter(pk=sesion.sala_id)
        else:
            salas = Sala.objects.none()
    else:
        sesiones = Sesion.objects.none()
        salas = Sala.objects.none()
    
    return render(request, 'cine/reservas.html', {'peliculas': peliculas_final, 'sesiones': sesiones, 'salas': salas, 'filtroPeli': peli, 'filtroSesion': sesi, 'filtroSala': sal})

def detalle(request, id_pelicula):
    try:
        pelicula = Pelicula.objects.get(pk=id_pelicula)
        comentarios = Comentario.objects.filter(pelicula_id=id_pelicula).order_by('-id')[:3]
        sesiones = Sesion.objects.filter(pelicula_id=id_pelicula)
    except:
        raise Http404('La pelicula no existe')
    return render(request, 'cine/detalle.html', {'pelicula': pelicula, 'comentarios': comentarios, 'sesiones': sesiones})

def guardarComentario(request):
    try:
        if request.POST["pelicula_id"] and request.POST["asunto"] and request.POST["opinion"]:
            Comentario.objects.create(asunto=request.POST["asunto"], opinion=request.POST["opinion"], pelicula_id=request.POST["pelicula_id"])
            pelicula = Pelicula.objects.get(pk=request.POST["pelicula_id"])
            comentarios = Comentario.objects.filter(pelicula_id=request.POST["pelicula_id"]).order_by('-id')[:3]
            sesiones = Sesion.objects.filter(pelicula_id=request.POST["pelicula_id"])
            return render(request, 'cine/detalle.html', {'pelicula': pelicula, 'comentarios': comentarios, 'sesiones': sesiones})
    except:
        raise Http404('Error al crear el comentario')
    return render(request, 'cine/cartelera.html')

def cargarAsientos(request):
    sala = request.GET.get('sala')
    miSala = Sala.objects.all().filter(pk=sala).first()
    data = {
        'filas': miSala.numeroFilas,
        'asientosFila': miSala.numeroAsientosFila,
        'asientosUltimaFila': miSala.numeroAsientosUltimaFila,
    }
    print (miSala.numeroFilas)
    print (miSala.numeroAsientosFila)
    print (miSala.numeroAsientosUltimaFila)
    
    return JsonResponse(data)