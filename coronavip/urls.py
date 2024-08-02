from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('coronavip/', views.coronavip, name="coronavip"),
    path('detallesvip/', views.detail_vip, name='detail_vip'),
    path('transportevip/', views.transvip, name='trans_vip'),
]
