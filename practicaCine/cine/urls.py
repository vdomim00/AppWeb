from django.urls import  path
from . import views

app_name = 'cine'
urlpatterns = [
    path('', views.index, name='index'),
    path('cartelera', views.cartelera, name='cartelera'),
]