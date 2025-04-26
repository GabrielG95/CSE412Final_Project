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
        path('register/', views.register_view, name='register'),
        path('login/', views.login_view, name='login'),
        path('logout/', views.logout_view, name='logout'),
        path('clear-random/', views.clear_random_username, name='clear-random'),
        path('friend-request/send/<int:user_id>/', views.send_friend_request, name='send-friend-request'),
        path('friend-request/respond/<int:request_id>/<str:response>/', views.respond_to_request, name='respond-friend-request'),
        path('update_color/', views.update_username_color, name='update_color'),
        path('chat_ai/', views.chat_ai_view, name='chat_ai'),
    ]


