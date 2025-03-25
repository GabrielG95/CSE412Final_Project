from django.urls import path
from . import views

urlpatterns = [
        path('', views.home, name="chat-home"),
        # path('home/', views.home, name="chat-home")
        path("chatroom/", views.chatroom, name="chat-chatroom")
    ]


