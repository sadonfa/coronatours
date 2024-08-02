from django.urls import path
from . import views

urlpatterns = [
    path('laborsocial/', views.laborsocial, name="laborsocial"),
]
