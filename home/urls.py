from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="home"),
    path('inicio/', views.index, name="index"),
    path('nosotros/', views.about, name="about"),
    path('contacto/', views.contact, name="contact"),
    # path('', views.suspended, name="suspend")
]
