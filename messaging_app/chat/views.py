from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.http import JsonResponse
from django.shortcuts import render, redirect
from .models import User
from .forms import MessageForm, UsernameForm, RegisterForm
from .models import Message
import random
import string

"""
    - Create your views here.
    - This is where we define the function of where to go when we go to a certain template 
"""

def home(request):
    if "chat_username" in request.session:
        del request.session["chat_username"]

    response = render(request, "chat/home.html")

    response['Cache-Control'] = 'no-cache, no-store, must-revalidate'
    response['Pragma'] = 'no-cache'
    response['Expires'] = '0'

    return response

def chatroom_view(request):
    if request.method == 'POST':
        form = MessageForm(request.POST)
        if form.is_valid():
            message = form.save(commit=False)
            # message.username = request.session.get("chat_username", "Anonymous")
            message.username = request.user.username if request.user.is_authenticated else request.session.get("chat_username", "Anonymous")
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

# Generate random letters and numbers for a username
def generate_random_username():
    letters = ''.join(random.choices(string.ascii_letters, k=5))
    numbers = ''.join(random.choices(string.digits, k=5))
    return f"{letters}{numbers}"

# Create the actual username
def random_username(request):
    username = generate_random_username()
    request.session["chat_username"] = username
    return redirect('chatroom')

def register_view(request):
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            messages.success(request, "Registration complete!")
            return redirect('chat-home')
        else:
            print(form.errors)
    else:
        form = RegisterForm()
    return render(request, "chat/register.html", {'form': form})

def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            messages.success(request, "Login successful!")
            return redirect('chat-home')
        else:
            messages.error(request, "Invalid username or password.")
    return render(request, "chat/login.html")

def logout_view(request):
    logout(request)
    return redirect('chat-home')

def chat_ai_view(request):
    return render(request, "chat/chat_ai.html")

def contacts_view(request):
    return render(request, "chat/contacts.html")

def settings_view(request):
    return render(request, "chat/settings.html")
