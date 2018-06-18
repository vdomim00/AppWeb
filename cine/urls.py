from django.urls import  path
from . import views

app_name = 'cine'
urlpatterns = [
    path('', views.index, name='index'),
    path('cartelera', views.cartelera, name='cartelera'),
    path('reservas', views.reservas, name='reservas'),
    path('detalle/<int:id_pelicula>', views.detalle, name='detalle'),
    path('guardarComentario', views.guardarComentario, name='guardar_comentario'),
    path('ajax/cargarAsientos', views.cargarAsientos, name='cargar_asientos')
]