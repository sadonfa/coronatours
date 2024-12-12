from django.shortcuts import render, get_object_or_404
from tours.models import Tours
from reserve.models import Reserver, Vehiculos
from .models import Booking

# Create your views here.


def check(request, id=False):
    d_reserve = Reserver.objects.all()
    transport = Vehiculos.objects.get(id=request.POST['id'])
    viaje = request.POST['recorrido']
    

    # if viaje == "idayvuelta":
    #     hora_ret =  request.POST['time_return']
    #     cash_ret = int(request.POST['value_d'])
    # else:
    #     hora_ret = 0

    passengers_list = []
    range_passengers = transport.Number_passengers + 1

    for passengers in range(0, range_passengers):        
        passengers_list.append(passengers)

    if id == False and request.method == 'POST':
        # det_booking = get_object_or_404(Reserver, pk=id)

        if request.POST['name'] == "Van Compartida":
            print("Es compartido ")
            if request.POST['recorrido'] == "ida":
                det_booking = {
                    "name": request.POST['name'],
                    "origen": request.POST['origen'],
                    "destino": request.POST['destino'],
                    "date": request.POST['date'],
                    "time": request.POST['time'],
                    "id": request.POST['id'],
                    "opcion": "transporte"
                }
                opcion = "transporte"
                can_comp = request.POST['comp-cantidad']
                cash = request.POST['value']
                cash = int(can_comp) * int(cash)
            else:
                det_booking = {
                    "name": request.POST['name'],
                    "origen": request.POST['origen'],
                    "destino": request.POST['destino'],
                    "date": request.POST['date'],
                    "time": request.POST['time'],
                    "id": request.POST['id'],
                    "opcion": "transporte"
                }
                opcion = "transporte"
                can_comp = request.POST['comp-cantidad']
                cash = int(request.POST['value']) * 2
                cash = int(can_comp) * int(cash)

        else:
            # no es compartido
            if request.POST['recorrido'] == "ida":
                det_booking = {
                    "name": request.POST['name'],
                    "origen": request.POST['origen'],
                    "destino": request.POST['destino'],
                    "date": request.POST['date'],
                    "time": request.POST['time'],
                    "id": request.POST['id'],
                    "cash" : request.POST['value'],
                    "opcion": "transporte"
                }
                opcion = "transporte"
                cash = request.POST['value']
                
                #realizo arreglo de hora
                t = list(det_booking['time'])
                # print(len(t))
                if len(t) == 1:
                    v_time = "0" + str(det_booking['time'])
                    # print(tim)
                    segmentar = list(v_time)

                    print(set(segmentar))

                    if set(segmentar) == range(1, 9):
                        segmen = segmentar.insert('0')
                        print(segmen)

                    hora_val = segmentar[0] + segmentar[1]
                    print("hora dividido" + hora_val)

                else:
                    

                    v_time = str(det_booking['time'])
                    # print(tim)
                    segmentar = list(v_time)

                    print(set(segmentar))

                    if set(segmentar) == range(1, 9):
                        segmen = segmentar.insert('0')
                        print(segmen)

                    hora_val = segmentar[0] + segmentar[1]
                    print("hora dividido" + hora_val)

                
                # v_time = "0"+ str(det_booking['time'])
                
                print(v_time)

                if int(hora_val) in range(21, 24) or int(hora_val) in range(0, 6):
                    cash = int(request.POST['value']) + 20000
                    print("Se esta enviando este, hora nocturna ")
                    print( cash)
                else:
                    cash = request.POST['value']
                    # print("Se esta enviando este, hora diurna ")
            else:
                #idayvuelta
                det_booking = {
                    "name": request.POST['name'],
                    "origen": request.POST['origen'],
                    "destino": request.POST['destino'],
                    "date": request.POST['date'],
                    "time": request.POST['time'],
                    "time_r": request.POST['time_return'],
                    "id": request.POST['id'],
                    "cash" : request.POST['value'],
                    "opcion": "transporte"
                }
                opcion = "transporte"
                # print(int(request.POST['value_d']))
                cash = int(request.POST['value']) + int(request.POST['value_d'])
                # print("Este es la hora actual --> " + str(det_booking['time']))
                # print("Este es la hora actual --> " + str(det_booking['time_r']))
                
                # print( "este es el valor de la segunda ruta " + request.POST['value_d'] )


                def Convert(string):
                    li = list(string.split(":"))
                    return li

                list_time = Convert(det_booking['time'])
                hours = int(list_time[0])

                list_time = Convert(det_booking['time_r'])
                hours_r = int(list_time[0])

                # print(f"\n\n--------------------------------------")
                # print(f"hora formateada ida {hours}")
                # print(f"hora formateada retorno {hours_r}")
                # print(f"--------------------------------------\n\n")

            
           
                if int(hours) in range(21, 24) or int(hours) in range(0, 6) :

                    if int(hours_r) in range(21, 24) or int(hours_r) in range(0, 6):
                        cash += 40000
                        # print(f"Se esta enviando este, hora nocturna {cash} ")

                    else:
                        cash += 20000
                        # print(f"Se esta enviando este, hora nocturna {cash}")

                elif int(hours_r) in range(21, 24) or int(hours_r) in range(0, 6) : 
                    if int(hours) in range(21, 24) or int(hours) in range(0, 6):
                        cash += 40000
                        # print(f"Se esta enviando este, hora nocturna {cash} ")

                    else:
                        cash += 20000
                        # print(f"Se esta enviando este, hora nocturna {cash}")

                else:
                    # cash += 40000 
                    print("no hay valor ")

    else:
        det_booking = get_object_or_404(Tours, pk=id)
        cash = det_booking.cash
        opcion = "tour"


    print("este es el valor --> " + str(cash))

    return render(request, 'check.html', {
        'title': 'Informacion de reserva',
        'det_booking': det_booking,
        'd_reserve': d_reserve,
        'cash': cash,
        'opcion': opcion,
        'transports': transport,
        'can_comp': can_comp,
        'passengers_list': passengers_list,
        'recorrido': request.POST['recorrido']

    })


def det_booking(request, opc):

    print(opc)
    tour = Tours.objects.all()

    if request.method == 'POST':
        name = request.POST['name']
        lastname = request.POST['lastname']
        phone = request.POST['phone']
        mail = request.POST['mail']
        contry = request.POST['contry']
        city = request.POST['city']
        cash = request.POST['cash']
        tour = request.POST['tour']
        adults = request.POST['adults']
        # childre = request.POST['childre']
        opcion = request.POST['opcion']
        aerolinea = request.POST['aerolinea']
        nvuelo = request.POST['nvuelo']

        # print ("\nesta es la informacion de cash -> " + cash + "\n" ) 
        # if request.POST['hotel'] != "transporte":
        #     hotel  = request.POST['hotel']
        # print(opcion)
        if opcion == 'transporte':
            total = int(cash)
        else:
            total = int(adults) * int(cash)

    booking = Booking(
        name=name,
        lastname=lastname,
        phone=phone,
        mail=mail,
        contry=contry,
        city=city,
        # hotel  = hotel,
        cash=cash,
        tour=tour,
        adults=adults,
        # childre=childre,
        total=total,
        air=aerolinea,
        nair=nvuelo
    )

    booking.save()

    # print(opcion)

    # if option == "transporte":
    #     opcion = "transporte"

    return render(request, 'det_booking.html', {
        'title': 'Detalles de Reserva',
        'total': total,
        'booking': booking,
        'opcion': opcion
    })


def answer_booking(request, id):
    return render(request, 'respuesta.html', {
        'tiitle': 'confirmacion de reserva',
        'id': id
    })
