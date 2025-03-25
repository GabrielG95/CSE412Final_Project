from django.shortcuts import render, redirect
from .forms import MessageForm
from .models import Message
"""
"""
# Create your views here.

def home(request):
    return render(request, "chat/home.html")

def chatroom(request):
    return render(request, "chat/chatroom.html")
