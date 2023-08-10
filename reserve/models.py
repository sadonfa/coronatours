from django.db import models
from django.contrib.auth.models import User

# Create your models here.
# Modelo para la lista de hoteles
class HotelList(models.Model):
    title = models.CharField(max_length=200, verbose_name="Titulo")
    value = models.CharField(max_length=300, verbose_name="Valor")
    price1 = models.CharField(max_length=300, verbose_name="Valor de Auto estandar", null=True, blank=True)
    price2 = models.CharField(max_length=300, verbose_name="Valor de Van estandar", null=True, blank=True)
    address_url = models.URLField(verbose_name="URL a Google Maps", max_length=400)
    order = models.IntegerField(default=0, verbose_name="Orden")
    user = models.ForeignKey(User, editable=False, verbose_name="Usuario", on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Creado el")
    update_at = models.DateTimeField(auto_now=True, verbose_name="Editado el")

    class Meta:
        verbose_name ="Hotel"
        verbose_name_plural ="Hoteles"
        ordering = ['order']

    def __str__(self):
        return self.title

# Modelo para guardar Aeropuerto o terminal
class AirportOrTerminal(models.Model):
    title = models.CharField(max_length=300, verbose_name="Titulo")
    value = models.CharField(max_length=300, verbose_name="Valor")
    price1 = models.CharField(max_length=300, verbose_name="Valor de Auto estandar", null=True, blank=True)
    price2 = models.CharField(max_length=300, verbose_name="Valor de Van estandar", null=True, blank=True)
    address_URL = models.URLField(verbose_name="URL a Google Maps", max_length=400)
    order = models.IntegerField(default=0, verbose_name="Orden")
    user = models.ForeignKey(User, editable=False, verbose_name="Usuario", on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Creado el")
    update_at = models.DateTimeField(auto_now=True, verbose_name="Editado el")

    class Meta:
        verbose_name="Aeropuerto/Terminal"
        verbose_name_plural = "Aeropuertos/Terminales"
        ordering = ['order']

    def __str__(self):
        return self.title
    
class BarrioList(models.Model):
    name = models.CharField(max_length=300, verbose_name="Nombre")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Creado el")
    update_at = models.DateTimeField(auto_now=True, verbose_name="Editado el")

    class Meta:
        verbose_name="Barrio"    
        verbose_name_plural="Barrios"

    def __str__(self):
        return self.name  



class Zone(models.Model):
    name = models.CharField(max_length=300, verbose_name="Nombre")
    # barrios = models.ManyToManyField(BarrioList, verbose_name="Barrios")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Creado el")
    update_at = models.DateTimeField(auto_now=True, verbose_name="Editado el")

    class Meta:
        verbose_name="Zona"    
        verbose_name_plural="Zonas"

    def __str__(self):
        return self.name    

    
class Destination(models.Model):
    title = models.CharField(max_length=300, verbose_name="Titulo")
    value = models.CharField(max_length=300, verbose_name="Valor")
    # price1 = models.CharField(max_length=300, verbose_name="Valor de Auto estandar", null=True, blank=True)
    # price2 = models.CharField(max_length=300, verbose_name="Valor de Van estandar", null=True, blank=True)
    # zone = models.ManyToManyField(Zone, verbose_name="Zona")
    barrio =  models.CharField(max_length=300, verbose_name="Barrio")
    address_URL = models.URLField(verbose_name="URL a Google Maps", max_length=400)
    order = models.IntegerField(default=0, verbose_name="Orden")
    user = models.ForeignKey(User, editable=False, verbose_name="Usuario", on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Creado el")
    update_at = models.DateTimeField(auto_now=True, verbose_name="Editado el")

    class Meta:
        verbose_name="Destino"
        verbose_name_plural = "Destinos"
        ordering = ['order']

    def __str__(self):
        return self.title
    


# Modelo para los vehiculos
class Vehiculos(models.Model):
    name = models.CharField(max_length=200, verbose_name="Nombre")
    tipo = models.CharField(max_length=200, verbose_name="Tipo")
    #value_tour = models.ManyToManyField(Zone,  verbose_name="Valor de viaje")
    Number_passengers = models.IntegerField(default=0, verbose_name="Cantidad de pasajeros")
    amount_luggage = models.IntegerField(default=0, verbose_name="Cantidad de equipaje")
    image = models.ImageField(default='null', verbose_name= 'Imagen', upload_to='articles')
    order = models.IntegerField(default=0, verbose_name="Orden")
    user = models.ForeignKey(User, editable=False, verbose_name="Usuario", on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Creado el")
    update_at = models.DateTimeField(auto_now=True, verbose_name="Editado el")

    class Meta:
        verbose_name="Vehiculo"
        verbose_name_plural="Vehiculos"

    def __str__(self):
        return self.name

class Reserver(models.Model):
    # fullname = models.CharField(max_length=200, verbose_name='Nombre Completo')
    # email = models.EmailField(max_length=200, verbose_name='Correo Electronico')
    # phone = models.CharField(max_length=200, verbose_name='Telefono')
    start_and_route = models.CharField(max_length=200, verbose_name='Partida')
    end_and_route = models.CharField(max_length=200, verbose_name='Destino')
    date = models.DateField(verbose_name='Fecha')
    hour = models.CharField(max_length=50, verbose_name="Hora")
    ve_name = models.CharField(max_length=300, default='null', verbose_name='Nombre del Vehiculo')
    ve_value = models.CharField(max_length=300, default='null', verbose_name='Valor del viaje')
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Creado el")
    update_at = models.DateTimeField(auto_now=True, verbose_name="Editado el")

    class Meta:
        verbose_name="Reserva"
        verbose_name_plural="Reservas"

    def __str__(self):
        return self.start_and_route 

        # fullname email phone start_and_route end_and_route date hour