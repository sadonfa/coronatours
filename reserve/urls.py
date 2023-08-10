from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('reservas/', views.reserve, name="reserve"),
    path('transporte/<int:id>/', views.transporte, name="transporte")
]
