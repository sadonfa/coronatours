from django.shortcuts import render
from .models import VehiculosVip
from datetime import datetime, timedelta

# Create your views here.

def coronavip(request):

    ahora = datetime.today() + timedelta(days=1)
    tomorrow = datetime.strftime(ahora, "%Y-%m-%d")  

    return render(request, "coronavip.html", {
        'title': 'corona vip',
        'fecha': tomorrow
    })

def detail_vip(request):

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

    return render(request, 'detail_vip.html', {
        'title': 'Detalles Reservas',
        'trayecto': trayecto,
        'recorrido': viaje,
    })

def transvip(request):
       
    vehiculosvip = VehiculosVip.objects.all()
    recorrido = request.POST['recorrido']
    v_trayecto_dos = ""

    # print(vehiculosvip)

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

        # print("esta es la hora" + str(hours))

        st_distancia = int(request.POST['distance'])*10**-3
        kilometros = int(round(st_distancia))

        # print(kilometros)

        st_duracion = int(request.POST['duration'])/60
        dura = int(round(st_duracion))
        # print(dura)

        
        if int(kilometros) in range(1, 12):
            print(f"correcto son {kilometros}km")
            valor_trayecto = {
                'vehiculo_lujo': 220000,  # multiplicar por personas
                'camioneta': 230000,  # locale.currency(45000, grouping=True),
                'lujo': 250000,  # locale.currency(85000, grouping=True),
                'mini_van_lujo': 250000,
                'van_lujo': 300000,  # locale.currency(150000, grouping=True),
            }
        elif int(kilometros) in range(13, 30):
            print(f"correcto son {kilometros}km")
            valor_trayecto = {
                'vehiculo_lujo': 250000,
                'camioneta': 260000,  # locale.currency(60000, grouping=True),
                'lujo': 300000,  # locale.currency(100000, grouping=True),
                'mini_van_lujo': 300000,
                'van_lujo': 350000,  # locale.currency(180000, grouping=True),
            }
        elif int(kilometros) in range(31, 58):
            print(f"correcto son {kilometros}km")
            valor_trayecto = {
                'vehiculo_lujo': 1100000,  # locale.currency(10000, grouping=True),
                'camioneta': 1100000,  # locale.currency(190000, grouping=True),
                'lujo': 1300000,  # locale.currency(280000,  grouping=True),               
                'mini_van_lujo': 1200000, # locale.currency(400000, grouping=True),               
                'van_lujo': 1400000  # locale.currency(500000, grouping=True),
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

        print(f"kilometro {kilometros}km")

        st_duracion = int(request.POST['duration'])/60
        dura = int(round(st_duracion))
        print(dura)

        rt_distance = int(request.POST['distance_ret'])*10**-3
        kilm = int(round(rt_distance))
        print(f"kilometros de retorno son {kilm}km")

        rt_duracion = int(request.POST['duration_ret'])/60
        dura_rt = int(round(rt_duracion))
        print(dura_rt)

       
        if int(kilometros) in range(1, 12):
            print(f"correcto son {kilometros}km")
            valor_trayecto = {
                'vehiculo_lujo': 220000,  # multiplicar por personas
                'camioneta': 230000,  # locale.currency(45000, grouping=True),
                'lujo': 250000,  # locale.currency(85000, grouping=True),
                'mini_van_lujo': 250000,
                'van_lujo': 300000,  # locale.currency(150000, grouping=True),
            }
        elif int(kilometros) in range(13, 30):
            print(f"correcto son {kilometros}km")
            valor_trayecto = {
                'vehiculo_lujo': 250000,
                'camioneta': 260000,  # locale.currency(60000, grouping=True),
                'lujo': 300000,  # locale.currency(100000, grouping=True),
                'mini_van_lujo': 300000,
                'van_lujo': 350000,  # locale.currency(180000, grouping=True),
            }
        elif int(kilometros) in range(31, 58):
            print(f"correcto son {kilometros}km")
            valor_trayecto = {
                'vehiculo_lujo': 1100000,  # locale.currency(10000, grouping=True),
                'camioneta': 1100000,  # locale.currency(190000, grouping=True),
                'lujo': 1300000,  # locale.currency(280000,  grouping=True),               
                'mini_van_lujo': 1200000, # locale.currency(400000, grouping=True),               
                'van_lujo': 1400000  # locale.currency(500000, grouping=True),
            }
        else:
            print("Incorrecto")

        if int(kilm) in range(1, 12):
            print(f"correcto son {kilm}km segunda ruta")
            v_trayecto_dos = {
                'vehiculo_lujo': 220000,  # multiplicar por personas
                'camioneta': 230000,  # locale.currency(45000, grouping=True),
                'lujo': 250000,  # locale.currency(85000, grouping=True),
                'mini_van_lujo': 250000,
                'van_lujo': 300000,  # locale.currency(150000, grouping=True),
            }
        elif int(kilm) in range(13, 30):
            print(f"correcto son {kilm}km")
            v_trayecto_dos = {
                'vehiculo_lujo': 250000,
                'camioneta': 260000,  # locale.currency(60000, grouping=True),
                'lujo': 300000,  # locale.currency(100000, grouping=True),
                'mini_van_lujo': 300000,
                'van_lujo': 350000,  # locale.currency(180000, grouping=True),
            }
        elif int(kilm) in range(31, 58):
            print(f"correcto son {kilm}km")
            v_trayecto_dos = {
               'vehiculo_lujo': 1100000,  # locale.currency(10000, grouping=True),
                'camioneta': 1100000,  # locale.currency(190000, grouping=True),
                'lujo': 1300000,  # locale.currency(280000,  grouping=True),               
                'mini_van_lujo': 1200000, # locale.currency(400000, grouping=True),               
                'van_lujo': 1400000  # locale.currency(500000, grouping=True),
            }
        else:
            print("Incorrecto_2")
           

    return render(request, "transvip.html", {
        'title': 'transporte vip',
        'vehiculosvip': vehiculosvip,
        'dat_trayecto': dat_trayecto,
        'v_trayecto': valor_trayecto,
        'v_trayecto_dos': v_trayecto_dos,
        'time': hours,
        'kilometros': kilometros,
        'recorrido': recorrido,

    })