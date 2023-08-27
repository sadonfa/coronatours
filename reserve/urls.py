from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('reservas/', views.reserve, name="reserve"),
    path('detalles-reservas/', views.det_reserve, name="reserve_detail"),
    path('transporte/', views.transporte, name="transporte")
]
