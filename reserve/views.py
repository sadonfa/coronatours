from ssl import AlertDescription
from django.shortcuts import render, redirect, HttpResponse, get_object_or_404
from django.contrib import messages
from .models import Reserver, Destination, Vehiculos, Zone

# ----- Create your views here. -----

def reserve(request):

    destination = Destination.objects.all() 

    return render(request, 'reserve.html', {
        'title': 'Reservas',
        'destination': destination,
    })


def transporte(request, id):
    
    if request.method == 'POST':
        # ----- Declaracion de variables -----
        # destination = Destination.objects.all() 
        zona = Zone.objects.all() 
        transports = Vehiculos.objects.all()
        destination = Destination.objects.all()
        destino = get_object_or_404(Destination, pk=id)
        # destinoStr = str(destinoObj.value)

            # for clave, valor in z[1].items():
            #     print(f'la clave es {clave} el valor es {valor}')
        # ----- Aqui se resive la informacion llegada por el formulario -----

        start_of_route  = request.POST['start_of_route']
        end_of_route = request.POST['end_of_route'] 
        # name  = request.POST['name']
        # email = request.POST['mail']
        # tel  = request.POST['tel']
        date  = request.POST['date']
        time  = request.POST['time']
        #id_POST  = request.POST['id']

        # print(end_of_route )
        # ----- Aqui se guradan los datos ingresados en el formulario de reserva -----

        reserve = Reserver(
            # fullname = name,
            # email = email,
            # phone = tel,
            start_and_route = start_of_route,
            end_and_route = end_of_route, 
            date = date,
            hour = time
        )

        reserve.save()
        d_reserve = Reserver.objects.all()


        # for z in destino.values():
        #     v_zona = z['name'] 

        # print(v_zona)

        
        # for barrio in destination.values():
        #     print(barrio['barrio'])

        # barr_zone = []
        # for b_zone in zona.values():
        #     # des_start.append(des['barrio'])
        #     barr_zone.append(b_zone['name'])


       
        
        # print(  barr_zone )
        # print(start_of_route == des_start[0] )

        # if str(start_of_route) == str(barr_zone[0]):
        #     barrio = "Baru"
        # elif str(start_of_route) == str(barr_zone[1]):
        #     barrio = "Boquilla"
        # elif str(start_of_route) == str(barr_zone[2]):
        #     barrio = "Manzanillo"
        # elif str(start_of_route) == str(barr_zone[3]):
        #     barrio = "Crespo"
        # elif str(start_of_route) == str(barr_zone[3]):
        #     barrio = "Bocagrande"
        # else:
        #     barrio = "No existe el barrio"

        # print(des_start[1])

        des_start = []
        for des in destination.values():
            des_start.append(des['title'])

        if str(start_of_route) == str(des_start[0]):
            inicio_barrio = "Crespo"
        elif str(start_of_route) == str(des_start[1]):
            inicio_barrio = "Bocagrande"
        elif str(start_of_route) == str(des_start[2]):
            inicio_barrio = "Bocagrande"
        elif str(start_of_route) == str(des_start[3]):
            inicio_barrio = "Bocagrande"
        else:
            inicio_barrio ="Algo salio mal revisa"

        
        if str(end_of_route) == str(des_start[0]):
            fin_barrio = "Crespo"
        elif str(end_of_route) == str(des_start[1]):
            fin_barrio = "Bocagrande"
        elif str(end_of_route) == str(des_start[2]):
            fin_barrio = "Bocagrande"
        elif str(end_of_route) == str(des_start[3]):
            fin_barrio = "Bocagrande"
        else:
            fin_barrio ="Algo salio mal revisa"

        print(inicio_barrio)
        print( fin_barrio)

        if inicio_barrio == "Crespo" and fin_barrio == "Bocagrande":
            valor_trayecto = {
                'compartido': 10000,
                'standar': 45000,
                'mini_van': 85000,
                'van_standar': 100000,
                'micro_bus': 120000,
                'buseta': 170000,
                'bus': 200000,
                'SUV': 150000
            }
            


            
        
        return render(request, 'transporte.html', {
            'title': 'Transporte',
            'transports': transports,
            'destinations': destino,
            'd_reserve': d_reserve,   
            'v_trayecto': valor_trayecto,
            'zonas': zona,
            'start_of_route':start_of_route,
            'end_of_route': end_of_route,
            
            'date': date,
            'time': time
        })
    else:
        return HttpResponse("No se guardo ninguna informacion vuelva a <a href='/inicio'>Inicio</a> ")