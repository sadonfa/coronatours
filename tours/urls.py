from django.urls import path
from . import views

urlpatterns = [
    path('toures/', views.tours, name="tours"),
    path('tour/<int:id>/', views.tour, name="tour"),
]
