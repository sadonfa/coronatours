from ssl import AlertDescription
from django.shortcuts import render, redirect, HttpResponse, get_object_or_404
from django.contrib import messages
from .models import Reserver, Destination, Vehiculos, Zone
import datetime
# import time
import locale


# ----- Create your views here. -----


def reserve(request):

    destination = Destination.objects.all()

    return render(request, 'reserve.html', {
        'title': 'Reservas',
        'destination': destination,
    })


def det_reserve(request):

    if request.method == 'POST':
        # >>>>>>>--- comente unas variables por aqui ---<<<<<<<
        # ----- Declaracion de variables -----
        # transports = Vehiculos.objects.all()
        # destination = Destination.objects.all()
        
        start_of_route = request.POST['start_of_route']
        end_of_route = request.POST['end_of_route']
        date = request.POST['date']
        time = request.POST['time']
        start_of_route__return = request.POST['start_of_route']
        end_of_route__return = request.POST['end_of_route']
        date_return = request.POST['date']
        time_return = request.POST['time']
        # duration = request.POST['duration']
        viaje = request.POST['viaje']

        if viaje == "ida":        
            start_of_route = request.POST['start_of_route']
            end_of_route = request.POST['end_of_route']
            date = request.POST['date']
            time = request.POST['time']
            
        
        elif viaje == "idayvuelta":
            start_of_route = request.POST['start_of_route']
            end_of_route = request.POST['end_of_route']
            date = request.POST['date']
            time = request.POST['time']
            start_of_route__return = request.POST['start_of_route_return']
            end_of_route__return = request.POST['end_of_route_return']
            date_return = request.POST['date_return']
            time_return = request.POST['time_return']

        

        # reserve = Reserver(
        #     start_and_route=start_of_route,
        #     end_and_route=end_of_route,
        #     date=date,
        #     hour=time
        # )

        # reserve.save()
        # d_reserve = Reserver.objects.all()

    return render(request, 'det_reser.html', {
        'title': 'Detalles Reservas',
        'start_of_route': start_of_route,
        'end_of_route': end_of_route,
        'date': date,
        'time': time,        
        'start_of_route_return':  start_of_route__return,
        'end_of_route__return' : end_of_route__return,
        'date_return': date_return,
        'time_return': time_return,
        'recorrido': viaje
    })


def transporte(request):
    zona = Zone.objects.all()
    transports = Vehiculos.objects.all()
    # n_passgers = Vehiculos.objects.get(Number_passengers = )
    destination = Destination.objects.all()

    # for trans in transports:
    #      print(trans)

    if request.method == 'POST':  

        start_of_route = request.POST['start_of_route']
        end_of_route = request.POST['end_of_route']
        # name  = request.POST['name']
        # email = request.POST['mail']
        # tel  = request.POST['tel']
        date = request.POST['date']
        time_tran = request.POST['time']
        distance = request.POST['distance']
        duration = request.POST['duration']
        store = request.POST['store']
        recorrido = request.POST['recorrido']

        def Convert(string):
            li = list(string.split(":"))
            return li

        list_time = Convert(time_tran)
        hours = int(list_time[0])

        st_distancia = int(store)*10**-3
        kilometros = int(round(st_distancia))

        if int(kilometros) in range(1, 12):
            print(f"correcto son {kilometros}km")
            valor_trayecto = {
                'compartido': 15000,  # multiplicar por personas
                'standar': 45000,  # locale.currency(45000, grouping=True),
                'mini_van': 85000,  # locale.currency(85000, grouping=True),
                # locale.currency(100000, grouping=True),
                'van_standar': 100000,
                'micro_bus': 140000,  # locale.currency(120000, grouping=True),
                'buseta': 170000,  # locale.currency(170000, grouping=True),
                'bus': 200000,  # locale.currency(200000, grouping=True),
                'SUV': 150000,  # locale.currency(150000, grouping=True),
            }
        elif int(kilometros) in range(13, 30):
            print(f"correcto son {kilometros}km")
            valor_trayecto = {
                'compartido': 25000,
                'standar': 60000,  # locale.currency(60000, grouping=True),
                'mini_van': 100000,  # locale.currency(100000, grouping=True),
                # locale.currency(120000, grouping=True),
                'van_standar': 140000,
                'micro_bus': 180000,  # locale.currency(150000, grouping=True),
                'buseta': 190000,  # locale.currency(190000, grouping=True),
                'bus': 260000,  # locale.currency(260000, grouping=True),
                'SUV': 180000,  # locale.currency(180000, grouping=True),
            }
        elif int(kilometros) in range(31, 58):
            print(f"correcto son {kilometros}km")
            valor_trayecto = {
                'compartido': 15000,  # locale.currency(10000, grouping=True),
                'standar': 200000,  # locale.currency(190000, grouping=True),
                'mini_van': 350000,  # locale.currency(280000,  grouping=True),
                # locale.currency(400000, grouping=True),
                'van_standar': 450000,
                'micro_bus': 550000,  # locale.currency(480000, grouping=True),
                'buseta': 600000,  # locale.currency(530000, grouping=True),
                'bus': 700000,  # locale.currency(600000, grouping=True),
                'SUV': 500000  # locale.currency(500000, grouping=True),
            }
        else:
            print("Incorrecto")

        return render(request, 'transporte.html', {
            # >>>>>>>--- comente unas variables por aqui ---<<<<<<<
            'title': 'Transporte',
            'transports': transports,
            # 'destinations': destino,
            # 'd_reserve': d_reserve,
            'v_trayecto': valor_trayecto,
            'zonas': zona,
            'start_of_route': start_of_route,
            'end_of_route': end_of_route,
            "distance": distance,
            "duration": duration,
            'date': date,
            'time': hours,
            'store': store,
            'kilometros': kilometros,
            'recorrido': recorrido
        })
    else:
        return HttpResponse("No se guardo ninguna informacion vuelva a <a href='/inicio'>Inicio</a> ")
