from django.db import models
from ckeditor.fields import RichTextField 
from djmoney.models.fields import MoneyField

# Create your models here.
class Inclusiones(models.Model):  
    description = models.CharField(max_length=250, verbose_name="Descripcion")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Creado el")
    update_at = models.DateTimeField(auto_now=True, verbose_name="Editado el")

    def __str__(self):
        return f'{self.description}' 
    
class Exclusiones(models.Model):  
    description = models.CharField(max_length=250, verbose_name="Descripcion")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Creado el")
    update_at = models.DateTimeField(auto_now=True, verbose_name="Editado el")

    def __str__(self):
        return f'{self.description}'    


class Tours(models.Model):
    name = models.CharField(max_length=200, verbose_name="Nombre")
    description = models.CharField(max_length=250, verbose_name="Descripcion")
    image1 =  models.ImageField(default="null", upload_to="Imagen 1")
    image2 =  models.ImageField(default="null", upload_to="Imagen 2")
    image3 =  models.ImageField(default="null", upload_to="Imagen 3")
    image4 =  models.ImageField(default="null", upload_to="Imagen 4")
    info = RichTextField(verbose_name="Info")
    include = models.ManyToManyField(Inclusiones, blank=True, verbose_name="Incluye")
    noinclude = models.ManyToManyField(Exclusiones, blank=True, verbose_name="No Incluye")
    cash = models.IntegerField(verbose_name="Valor", default=0)
    # cash = MoneyField(max_digits=14, decimal_places=2, default_currency='COP', default=0)
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Creado el")
    update_at = models.DateTimeField(auto_now=True, verbose_name="Editado el")

    def __str__(self):
        return f'{self.name}' 
    


    
