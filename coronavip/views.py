from django.shortcuts import render
from .models import VehiculosVip

# Create your views here.

def coronavip(request):
    return render(request, "coronavip.html", {
        'title': 'corona vip'
    })

def detail_vip(request):

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


    return render(request, 'detail_vip.html', {
        'title': 'Detalles Transporte VIP',
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

def transvip(request):
       
    vehiculosvip = VehiculosVip.objects.all()
    store = request.POST['store']
    st_distancia = int(store)*10**-3
    kilometros = int(round(st_distancia))

    start_of_route = request.POST['start_of_route']
    end_of_route = request.POST['end_of_route']

    date = request.POST['date']
    time_tran = request.POST['time']
    distance = request.POST['distance']
    duration = request.POST['duration']
    recorrido = request.POST['recorrido']


    if recorrido == "idayvuelta":
            det_retorno = {
                    "date": request.POST['date_return'],
                    "time": request.POST['time_return'],   
                    "start_of_route": request.POST['start_of_route_return'],
                    "end_of_route": request.POST['end_of_route__return'],
                }
    else:
        det_retorno = ""

    if recorrido == "idayvuelta" :
            time_return = request.POST['time_return']
    else:
            time_return = 0

    def Convert(string):
            li = list(string.split(":"))
            return li

    list_time = Convert(time_tran)
    hours = int(list_time[0])

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



    return render(request, "transvip.html", {
        'title': 'transporte vip',
        'vehiculosvip': vehiculosvip,

        'v_trayecto': valor_trayecto,
        'start_of_route': start_of_route,
        'end_of_route': end_of_route,
        "distance": distance,
        "duration": duration,
        'date': date,
        'time': hours,
        'store': store,
        'kilometros': kilometros,
        'recorrido': recorrido,
        'time_return': time_return,
        'det_retorno': det_retorno
    })