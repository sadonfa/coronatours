from django.contrib import admin
from .models import Destination, Vehiculos, Reserver, Zone, BarrioList
"""
class HotelListAdmin(admin.ModelAdmin):
    readonly_fields = ('user', 'created_at', 'update_at')
    list_display = ('title', 'order', 'user', 'created_at')
    ordering = ['order']
    
    def save_model(self, request, obj, form, change):
        if not obj.user_id:
            obj.user_id = request.user.id

        obj.save()

class AirportOrTerminalAdmin(admin.ModelAdmin):
    readonly_fields = ('user', 'created_at', 'update_at')
    list_display = ('title', 'user', 'created_at')
    ordering = ['order']
    
    def save_model(self, request, obj, form, change):
        if not obj.user_id:
            obj.user_id = request.user.id

        obj.save()
"""
class DestinationAdmin(admin.ModelAdmin):
    readonly_fields = ('user', 'created_at')
    list_display = ('title', 'order', 'user', 'created_at')
    ordering = ['order']
    
    def save_model(self, request, obj, form, change):
        if not obj.user_id:
            obj.user_id = request.user.id

        obj.save()

class VehiculosAdmin(admin.ModelAdmin):
    readonly_fields = ('user', 'created_at', 'update_at')
    list_display = ('name', 'user', 'created_at')
    ordering = ['order']
        
    def save_model(self, request, obj, form, change):
        if not obj.user_id:
            obj.user_id = request.user.id

        obj.save()


class ReserverAdmin(admin.ModelAdmin):
    readonly_fields = ('created_at', 'update_at')
    list_display = ('start_and_route', 'created_at')
    ordering = ['-created_at']

class ZoneAdmin(admin.ModelAdmin):
    list_display = ('name', 'created_at', 'update_at')

class BarriosListAdmin(admin.ModelAdmin):
    list_display = ('name', 'created_at', 'update_at')


# Register your models here.
#admin.site.register(HotelList, HotelListAdmin)
#admin.site.register(AirportOrTerminal, AirportOrTerminalAdmin)
admin.site.register(Zone, ZoneAdmin)
admin.site.register(BarrioList, BarriosListAdmin)
admin.site.register(Destination, DestinationAdmin)
admin.site.register(Vehiculos, VehiculosAdmin)
admin.site.register(Reserver, ReserverAdmin)