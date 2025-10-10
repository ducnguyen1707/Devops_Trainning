from django.http import HttpResponse

def home(request):
    return HttpResponse("Hello from Django running on port 8000!")
