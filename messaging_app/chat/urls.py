from django.urls import path
from . import views

urlpatterns = [
        path('', views.home, name="chat-home"),
        # path('home/', views.home, name="chat-home")
        path("chatroom/", views.chatroom_view, name="chatroom"),
        path("chat_ai/", views.chat_ai_view, name="chat_ai"),
        path("contacts/", views.contacts_view, name="contacts"),
        path("settings/", views.settings_view, name="settings"),
        path('get_messages/', views.get_messages, name="get_messages"),
        path('create_username/', views.set_username, name="create_username"),
        path('random_username/', views.random_username, name='random_username'),
    ]


