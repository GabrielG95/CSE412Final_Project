from django.shortcuts import render
"""
"""
# Create your views here.

def home(request):
    return render(request, "chat/home.html")

def chatroom(request):
    return render(request, "chat/chatroom.html")
