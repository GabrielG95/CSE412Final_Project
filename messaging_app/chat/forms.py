from django import forms
from .models import Message
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm

class MessageForm(forms.ModelForm):
    class Meta:
        model = Message
        fields = ['content']
        widgets = {
                'content': forms.Textarea(attrs={
                    'class': 'form-control custom-message-box',
                    'placeholder': 'Message...',
                    'rows': 2,
                    })
                }

# So users can select a username to display
class UsernameForm(forms.Form):
    username = forms.CharField(max_length=30, label='Enter your username')

class RegisterForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'password1', 'password2']


