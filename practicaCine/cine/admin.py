from django.contrib import admin
from .models import Pelicula, Sala, Comentario, Sesion, Reserva, Asiento

# Register your models here.
admin.site.register(Pelicula)
admin.site.register(Sala)
admin.site.register(Comentario)
admin.site.register(Sesion)
admin.site.register(Reserva)
admin.site.register(Asiento)