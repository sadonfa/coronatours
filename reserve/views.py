from django.shortcuts import render,  get_object_or_404
from .models import Reserver, Vehiculos
import locale
from datetime import datetime, timedelta


# ----- Create your views here. -----


def reserve(request):
    
    ahora = datetime.today() + timedelta(days=1)
    tomorrow = datetime.strftime(ahora, "%Y-%m-%d")  

    return render(request, 'reserve.html', {
        'title': 'Reservas',
        'fecha': tomorrow
    })


def det_reserve(request):

    if request.method == 'POST':
        # >>>>>>>--- comente unas variables por aqui ---<<<<<<<
        viaje = request.POST['viaje']
        print(viaje)
        if viaje == "ida":  
            trayecto = {
                'start':  request.POST['start_of_route'],
                'end':  request.POST['end_of_route'],
                'date':  request.POST['date'],
                'time':  request.POST['time'] ,
                'distance':  request.POST['distance'] ,
                'duration':  request.POST['duration'] ,
            }   

        
    
        elif viaje == "idayvuelta":
            trayecto = {
                'start': request.POST['start_of_route'],
                'end':  request.POST['end_of_route'],
                'date':  request.POST['date'],
                'time':  request.POST['time'],
                'start_ret':  request.POST['start_of_route_return'],
                'end_ret':  request.POST['end_of_route_return'],
                'date_ret': request.POST['date_return'],
                'time_ret': request.POST['time_return'],
            }   

        print(trayecto)

    return render(request, 'det_reser.html', {
        'title': 'Detalles Reservas',
        'trayecto': trayecto,
        'recorrido': viaje,
    })


def transporte(request):
    transports = Vehiculos.objects.all()[1:]
    compartido = Vehiculos.objects.filter(name="Van Compartida")
    recorrido = request.POST['recorrido']
    v_trayecto_dos = ""
    
    def Convert(string):
        li = list(string.split(":"))
        return li

    if recorrido == "ida":
        dat_trayecto = {
            'start' : request.POST['start_of_route'],
            'end' : request.POST['end_of_route'],
            'date' : request.POST['date'],
            'time' : request.POST['time'],
            'distance' : request.POST['distance'],
            'duration' : request.POST['duration'],  
            }
        
        
        list_time = Convert(request.POST['time'])
        hours = int(list_time[0])

        st_distancia = int(request.POST['distance'])*10**-3
        kilometros = int(round(st_distancia))

        st_duracion = int(request.POST['duration'])/60
        dura = int(round(st_duracion))
        
        if int(kilometros) in range(1, 12):
            
            valor_trayecto = {
             'compartido': 15000,  # multiplicar por personas
                'standar': 55000,  # locale.currency(45000, grouping=True),
                'mini_van': 120000,  # locale.currency(85000, grouping=True),
                # locale.currency(100000, grouping=True),
                'van_standar': 160000,
                'micro_bus': 220000,  # locale.currency(120000, grouping=True),
                'buseta': 250000,  # locale.currency(170000, grouping=True),
                'bus': 350000,  # locale.currency(200000, grouping=True),
                'SUV': 150000,  # locale.currency(150000, grouping=True),
            }
        elif int(kilometros) in range(13, 30):
            print(f"correcto son {kilometros}km")
            valor_trayecto = {
               'compartido': 30000,
                'standar': 85000,  # locale.currency(60000, grouping=True),
                'mini_van': 150000,  # locale.currency(100000, grouping=True),
                # locale.currency(120000, grouping=True),
                'van_standar': 190000,
                'micro_bus': 250000,  # locale.currency(150000, grouping=True),
                'buseta': 300000,  # locale.currency(190000, grouping=True),
                'bus': 450000,  # locale.currency(260000, grouping=True),
                'SUV': 180000,  # locale.currency(180000, grouping=True),
            }
        elif int(kilometros) in range(31, 58):
            print(f"correcto son {kilometros}km")
            valor_trayecto = {
                'compartido': 35000,  # locale.currency(10000, grouping=True),
                'standar': 450000,  # locale.currency(190000, grouping=True),
                'mini_van': 650000,  # locale.currency(280000,  grouping=True),
                # locale.currency(400000, grouping=True),
                'van_standar': 750000,
                'micro_bus': 900000,  # locale.currency(480000, grouping=True),
                'buseta': 1050000,  # locale.currency(530000, grouping=True),
                'bus': 1200000,  # locale.currency(600000, grouping=True),
                'SUV': 550000  # locale.currency(500000, grouping=True),
            }
        else:
            print("Incorrecto")


    else:
        dat_trayecto = {
            'date' : request.POST['date'],
            'time' : request.POST['time'],
            "date_ret": request.POST['date_return'],
            "time_ret": request.POST['time_return'],   
            'start' : request.POST['start_of_route'],
            'end' : request.POST['end_of_route'],
            "start_r": request.POST['start_of_route_return'],
            "end_r": request.POST['end_of_route_return'],
            'distance' : request.POST['distance'],
            'duration' : request.POST['duration'],  
            'distance_ret' : request.POST['distance_ret'],
            'duration_ret' : request.POST['duration_ret'],
        }

       

        list_time = Convert(request.POST['time'])
        hours = int(list_time[0])

        st_distancia = int(request.POST['distance'])*10**-3
        kilometros = int(round(st_distancia))

        st_duracion = int(request.POST['duration'])/60
        dura = int(round(st_duracion))

        rt_distance = int(request.POST['distance_ret'])*10**-3
        kilm = int(round(rt_distance))

        rt_duracion = int(request.POST['duration_ret'])/60
        dura_rt = int(round(rt_duracion))

        if int(kilometros) in range(1, 12):
            
            valor_trayecto = {
                'compartido': 15000,  # multiplicar por personas
                'standar': 55000,  # locale.currency(45000, grouping=True),
                'mini_van': 120000,  # locale.currency(85000, grouping=True),
                # locale.currency(100000, grouping=True),
                'van_standar': 160000,
                'micro_bus': 220000,  # locale.currency(120000, grouping=True),
                'buseta': 250000,  # locale.currency(170000, grouping=True),
                'bus': 350000,  # locale.currency(200000, grouping=True),
                'SUV': 150000,  # locale.currency(150000, grouping=True),
            }
        elif int(kilometros) in range(13, 30):
            valor_trayecto = {
                'compartido': 30000,
                'standar': 85000,  # locale.currency(60000, grouping=True),
                'mini_van': 150000,  # locale.currency(100000, grouping=True),
                # locale.currency(120000, grouping=True),
                'van_standar': 190000,
                'micro_bus': 250000,  # locale.currency(150000, grouping=True),
                'buseta': 300000,  # locale.currency(190000, grouping=True),
                'bus': 450000,  # locale.currency(260000, grouping=True),
                'SUV': 180000,  # locale.currency(180000, grouping=True),
            }
        elif int(kilometros) in range(31, 58):
            valor_trayecto = {
                'compartido': 35000,  # locale.currency(10000, grouping=True),
                'standar': 450000,  # locale.currency(190000, grouping=True),
                'mini_van': 650000,  # locale.currency(280000,  grouping=True),
                # locale.currency(400000, grouping=True),
                'van_standar': 750000,
                'micro_bus': 900000,  # locale.currency(480000, grouping=True),
                'buseta': 1050000,  # locale.currency(530000, grouping=True),
                'bus': 1200000,  # locale.currency(600000, grouping=True),
                'SUV': 550000  # locale.currency(500000, grouping=True),
            }
        else:
            print("Incorrecto")

        if int(kilm) in range(1, 12):
            v_trayecto_dos = {
                'compartido': 15000,  # multiplicar por personas
                'standar': 55000,  # locale.currency(45000, grouping=True),
                'mini_van': 120000,  # locale.currency(85000, grouping=True),
                # locale.currency(100000, grouping=True),
                'van_standar': 160000,
                'micro_bus': 220000,  # locale.currency(120000, grouping=True),
                'buseta': 250000,  # locale.currency(170000, grouping=True),
                'bus': 350000,  # locale.currency(200000, grouping=True),
                'SUV': 150000,  # locale.currency(150000, grouping=True),
            }
        elif int(kilm) in range(13, 30):
            v_trayecto_dos = {
                'compartido': 30000,
                'standar': 85000,  # locale.currency(60000, grouping=True),
                'mini_van': 150000,  # locale.currency(100000, grouping=True),
                # locale.currency(120000, grouping=True),
                'van_standar': 190000,
                'micro_bus': 250000,  # locale.currency(150000, grouping=True),
                'buseta': 300000,  # locale.currency(190000, grouping=True),
                'bus': 450000,  # locale.currency(260000, grouping=True),
                'SUV': 180000,  # locale.currency(180000, grouping=True),
            }
        elif int(kilm) in range(31, 58):
            v_trayecto_dos = {
                'compartido': 35000,  # locale.currency(10000, grouping=True),
                'standar': 450000,  # locale.currency(190000, grouping=True),
                'mini_van': 650000,  # locale.currency(280000,  grouping=True),
                # locale.currency(400000, grouping=True),
                'van_standar': 750000,
                'micro_bus': 900000,  # locale.currency(480000, grouping=True),
                'buseta': 1050000,  # locale.currency(530000, grouping=True),
                'bus': 1200000,  # locale.currency(600000, grouping=True),
                'SUV': 550000  # locale.currency(500000, grouping=True),
            }
        else:
            print("Incorrecto_2")
            
    print(recorrido)
    print(dat_trayecto)

    return render(request, 'transporte.html', {
        'title': 'Transporte',
        'transports': transports,
        'dat_trayecto': dat_trayecto,
        'v_trayecto': valor_trayecto,
        'v_trayecto_dos': v_trayecto_dos,
        'time': dat_trayecto['time'],
        'hours': hours,
        'kilometros': kilometros,
        'recorrido': recorrido,
        'compartido': compartido,
    })

def trans_returno(request):
    
    det_retorno = {
        "start": request.POST['start_ret'],
        "end": request.POST['end_ret'],
        # "distance":  request.POST['distance_ret'],
        # "duration": request.POST['duration_ret'],
        "date": request.POST['date_ret'],
        "time": request.POST['time_ret']
    }
    
    
       
    store = request.POST['store']
    recorrido = request.POST['recorrido']

    transports = Vehiculos.objects.all()
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
                'standar': 250000,  # locale.currency(190000, grouping=True),
                'mini_van': 400000,  # locale.currency(280000,  grouping=True),
                # locale.currency(400000, grouping=True),
                'van_standar': 500000,
                'micro_bus': 600000,  # locale.currency(480000, grouping=True),
                'buseta': 650000,  # locale.currency(530000, grouping=True),
                'bus': 750000,  # locale.currency(600000, grouping=True),
                'SUV': 550000  # locale.currency(500000, grouping=True),
            }
    else:
            print("Incorrecto")

    return render(request, "trans_retorno.html", {
        "title": "Transporte de retorno",
        'transports': transports,
        'v_trayecto': valor_trayecto,
        'det_return': det_retorno,
    })
