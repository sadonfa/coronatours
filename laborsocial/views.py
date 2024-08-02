from django.shortcuts import render

# Create your views here.

def laborsocial(request):
    return render(request, "laborsocial.html", {
        'title': 'Labor Social'
    })