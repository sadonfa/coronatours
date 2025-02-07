from django.contrib import admin
from .models import Tours, Inclusiones, Exclusiones

# Register your models here.
class ToursAdmin(admin.ModelAdmin):
    list_display = ('name', 'published', 'cash' , 'created_at')

class InclucionesAdmin(admin.ModelAdmin):
    list_display = ('description', 'created_at', 'update_at')

class ExclusionesAdmin(admin.ModelAdmin):
    list_display = ('description', 'created_at', 'update_at')

admin.site.register(Tours, ToursAdmin)
admin.site.register(Inclusiones, InclucionesAdmin)
admin.site.register(Exclusiones, ExclusionesAdmin)