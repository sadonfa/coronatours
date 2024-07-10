from django.shortcuts import render, get_object_or_404
from tours.models import Tours
from reserve.models import Reserver, Vehiculos
from .models import Booking

# Create your views here.


def check(request, id=False):
    d_reserve = Reserver.objects.all()
    transport = Vehiculos.objects.get(id=request.POST['id'])
    # transport = Vehiculos.objects.all()

    # print(transport.Number_passengers)
    passengers_list = []
    range_passengers = transport.Number_passengers + 1

    print(range_passengers)

    for passengers in range(0, range_passengers):        
        passengers_list.append(passengers)
        
    print(passengers_list)

    if id == False and request.method == 'POST':
        # det_booking = get_object_or_404(Reserver, pk=id)

        if request.POST['name'] == "Mercedes Sprinter":
            print("Es compartido ")
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
            print("no es compartido")

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
            print("Este es la hora actual" + str(det_booking['time']))

            segmentar = list(det_booking['time'])
            hora_val = segmentar[0] + segmentar[1]
            print("hora dividido" + hora_val)

            if int(hora_val) in range(22, 24) or int(hora_val) in range(0, 6):
                cash = int(request.POST['value']) + 20000
                print("Se esta enviando este, hora nocturna ")
                print(cash)
            else:
                cash = request.POST['value']
                print("Se esta enviando este, hora diurna ")

    else:
        det_booking = get_object_or_404(Tours, pk=id)
        cash = det_booking.cash
        opcion = "tour"


    print(cash)

    return render(request, 'check.html', {
        'title': 'Informacion de reserva',
        'det_booking': det_booking,
        'd_reserve': d_reserve,
        'cash': cash,
        'opcion': opcion,
        'transports': transport,
        'passengers_list': passengers_list

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
        childre = request.POST['childre']
        opcion = request.POST['opcion']
        aerolinea = request.POST['aerolinea']
        nvuelo = request.POST['nvuelo']

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
        childre=childre,
        total=total,
        air=aerolinea,
        nair=nvuelo
    )

    booking.save()

    print(opcion)

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
