from django.shortcuts import render, redirect
from .forms import MessageForm
from .models import Message
"""
"""
# Create your views here.
# This is where we define the function of where to go when we go to a certain template 

def home(request):
    return render(request, "chat/home.html")


# def home(request):
#     return render(request, "chat/chatroom.html")

def chatroom(request):
    # In order to view this form in chatroom, we have to render it
    if request.method == 'POST':
        form = MessageForm(request.POST)
        if form.is_valid():
            msg = form.save(commit=False)
            msg.user = request.user
            msg.save()
            return redirect('chat/chatroom')
    else:
        form = MessageForm()

    messages = Message.objects.all().order_by('timestamp')
    return render(request, "chat/chatroom.html", {'form': form, 'messages': messages})
