from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import AnonymousUser
from django.contrib.auth.decorators import login_required
from django_ai_assistant import AIAssistant
from django.contrib import messages
from django.http import JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from .models import User, FriendRequest, ChatThread
from .forms import MessageForm, UsernameForm, RegisterForm, UsernameColorForm
from .models import Message, Profile
import random
import string
import os

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
    data = []
    for message in messages:
        color = "#000000"
        if message.author and hasattr(message.author, 'profile'):
            color = message.author.profile.username_color
        data.append({
            "author_name": message.username,
            "author_id": message.author.id if message.author else None,
            "content": message.content,
            "date": message.date_posted.strftime("%Y-%m-%d %H:%M:%S"), #%I:%M %p for 12hr
            "color": message.author.profile.username_color if message.author and hasattr(message.author, "profile") else "#000000"
        })
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

@login_required
def send_friend_request(request, user_id):
    to_user = get_object_or_404(User, id=user_id)
    if to_user != request.user:
        FriendRequest.objects.get_or_create(from_user=request.user, to_user=to_user)
    return redirect('chatroom')

@login_required
def respond_to_request(request, request_id, response):
    friend_request = get_object_or_404(FriendRequest, id=request_id, to_user=request.user)
    if response == 'accept':
        friend_request.is_accepted = True
        friend_request.save()
        FriendRequest.objects.get_or_create(from_user=request.user, to_user=friend_request.from_user, is_accepted=True)
    else:
        friend_request.delete()
    return redirect('contacts')

def logout_view(request):
    logout(request)
    return redirect('chat-home')

@login_required
def contacts_view(request):
    friends = User.objects.filter(
        sent_requests__to_user=request.user, sent_requests__is_accepted=True,
        received_requests__from_user=request.user, received_requests__is_accepted=True
    )

    pending_requests = FriendRequest.objects.filter(to_user=request.user, is_accepted=False)

    return render(request, "chat/contacts.html",
                  {"friends": friends.distinct(),
                   "pending_requests": pending_requests
                   })

@login_required
def update_username_color(request):
    if request.method == 'POST':
        new_color = request.POST.get('color')
        profile, _ = Profile.objects.get_or_create(user=request.user)
        profile.username_color = new_color
        profile.save()
        messages.success(request, "Username color updated!")
        return redirect('settings')
    return redirect('settings')

def settings_view(request):
    if request.method == 'POST':
        selected_color = request.POST.get('color')
        if selected_color:
            profile, created = Profile.objects.get_or_create(user=request.user)
            profile.username_color = selected_color
            profile.save()
            messages.success(request, "Username color updated!")
            return redirect('settings')
    return render(request, "chat/settings.html")

def clear_random_username(request):
    if "chat_username" in request.session:
        del request.session["chat_username"]
    return redirect('chat-home')

def chat_threads(request):
    threads = ChatThread.objects.all().order_by('-created_at')
    return render(request, 'chat/chat_threads.html', {'threads': threads})

def thread_detail(request, thread_id):
    thread = get_object_or_404(ChatThread, id=thread_id)
    messages = thread.messages.order_by('date_posted')

    if request.method == 'POST':
        content = request.POST.get('content')
        if content:
            username = request.user.username if request.user.is_authenticated else request.session.get("chat_username", "Anonymous")
            author = request.user if request.user.is_authenticated else None

            Message.objects.create(
                content = content,
                author = author,
                username = username,
                thread = thread
            )
            return redirect('thread_detail', thread_id=thread.id)
        
    return render(request, 'chat/thread_detail.html', {'thread': thread, 'messages': messages})
    
def create_thread(request):
    if request.method == 'POST':
        title = request.POST.get('title')
        if title:
            created_by = request.user if request.user.is_authenticated else None
            ChatThread.objects.create(title=title, created_by=created_by)
            return redirect('chat_threads')
    return render(request, 'chat/create_thread.html')
