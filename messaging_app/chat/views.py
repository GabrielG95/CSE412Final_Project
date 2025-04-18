from django.http import JsonResponse
from django.shortcuts import render, redirect
from .models import User
from .forms import MessageForm, UsernameForm
from .models import Message
"""
"""
# Create your views here.
# This is where we define the function of where to go when we go to a certain template 

def home(request):
    return render(request, "chat/home.html")

def chatroom_view(request):
    if request.method == 'POST':
        form = MessageForm(request.POST)
        if form.is_valid():
            message = form.save(commit=False)
            message.username = request.session.get("chat_username", "Anonymous")
            if request.user.is_authenticated:
                message.author = request.user
            message.save()
            return redirect('chatroom')
    else:
        form = MessageForm()

    messages = Message.objects.all().order_by('date_posted')
    return render(request, "chat/chatroom.html", { "form": form,
                                                  "content": messages,
                                                  "chat_username": request.session.get('chat_username', 'Anonymous') })


# Get messages to update in real time
def get_messages(request):
    messages = Message.objects.all().order_by('date_posted')
    data = [{
        "author": message.username,
        "content": message.content,
        "date": message.date_posted.strftime("%Y-%m-%d %H:%M:%S")
    } for message in messages]
    return JsonResponse({"messages": data})

# Set username for chatteres 
def set_username(request):
    if request.method == 'POST':
        form = UsernameForm(request.POST)
        if form.is_valid():
            request.session['chat_username'] = form.cleaned_data['username']
            return redirect('chatroom')
    else:
        form = UsernameForm()
    return render(request, 'chat/set_username.html', {'form': form})

def chat_ai_view(request):
    return render(request, "chat/chat_ai.html")

def contacts_view(request):
    return render(request, "chat/contacts.html")

def settings_view(request):
    return render(request, "chat/settings.html")


# def home(request):
#     return render(request, "chat/chatroom.html")

# def chatroom(request):
    # In order to view this form in chatroom, we have to render it
    # if request.method == 'POST':
        # form = MessageForm(request.POST)
        # if form.is_valid():
            # msg = form.save(commit=False)
            # msg.user = request.user
            # msg.save()
            # return redirect('chat/chatroom')
    # else:
        # form = MessageForm()
# 
    # messages = Message.objects.all().order_by('timestamp')
    # return render(request, "chat/chatroom.html", {'form': form, 'messages': messages})
# 