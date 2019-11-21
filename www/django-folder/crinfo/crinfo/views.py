from django.http import HttpResponse


def home(request):
    return HttpResponse("<h2>  apache isledfi</h2>")
