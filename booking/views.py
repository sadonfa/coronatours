from django.shortcuts import render, get_object_or_404
from tours.models import Tours
from reserve.models import Reserver
from .models import Booking

# Create your views here.


def check(request, id=False):
    d_reserve = Reserver.objects.all()

    if id == False and request.method == 'POST':
        # det_booking = get_object_or_404(Reserver, pk=id)
        det_booking = {
            "name": request.POST['name'],
            "cash": request.POST['value'],
            "origen": request.POST['origen'],
            "destino": request.POST['destino'],
            "date": request.POST['date'],
            "time": request.POST['time'],
            "opcion": "transporte"
        }

    else:
        det_booking = get_object_or_404(Tours, pk=id)
        print(det_booking)

        # print(tour.cash)
    return render(request, 'check.html', {
        'title': 'Informacion de reserva',
        'det_booking': det_booking,
        'd_reserve': d_reserve
    })


def det_booking(request, opc):

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

        # if request.POST['hotel'] != "transporte":
        #     hotel  = request.POST['hotel']

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
        total=total
    )

    booking.save()

    if opc == "transporte":
        opcion = "transporte"

    return render(request, 'det_booking.html', {
        'title': 'Detalles de Reserva',
        'total': total,
        'booking': booking,
        'opcion': opcion
    })
