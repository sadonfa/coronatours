from django.shortcuts import render
from reserve.models import Reserver
from django.conf import settings

from django.template.loader import get_template
from django.core.mail import EmailMultiAlternatives

# Create your views here.

def send_email(mail, ve_name, ve_value):

    reserva = Reserver.objects.latest('id')
    context = {
        'fullname': reserva.fullname,
        'email': reserva.email,
        'phone': reserva.phone,
        'start': reserva.start_and_route,
        'end': reserva.end_and_route,
        'date': reserva.date,
        'time': reserva.hour,
        've_name': ve_name,
        've_value': ve_value,
        }
    template = get_template('correo.html')
    content = template.render(context)

    email = EmailMultiAlternatives(
        'Titulo del correo',
        'Descripcion del correo',
        settings.EMAIL_HOST_USER,
        [mail],
        cc=['Aqui va el correo al que va la copia']
    )

    email.attach_alternative(content, 'text/html')
    email.send()


def home(request):
    title='Inicio'
    return render(request, 'home.html', {
        'title': title
    })

def index(request):
    title='Inicio'
    reserva = Reserver.objects.latest('id')

    if request.method == 'POST':

        name = request.POST['name']        
        value = request.POST['value']

        mail = reserva.email
        start = reserva.start_and_route
        end = reserva.end_and_route

        reserva.ve_name = name
        reserva.ve_value = value

        #reserva.save()

        # Aqui se envia el correo, comenta este send_email si necesitas que no se envie el correo
        send_email(mail, name, value)
        
        print(f"EL email en el momento es {mail} y los datos que se añaden a la base de datos son : {name}, {value}")

        return render(request, 'index.html',{
            'title': title
        })


def about(request):
    return render(request, "about.html", {
        'title': "Nosotros"
    })

def contact(request):
    return render(request, "contact.html", {
        'title': "Contacto"
    })