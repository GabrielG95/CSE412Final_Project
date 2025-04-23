from django import forms
from .models import Message, Profile
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
    username = forms.CharField(max_length=30, label='Enter your username',
                               widget=forms.TextInput(attrs={'style': 'color: #000000;'}))

class UsernameColorForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ['username_color']
        widgets = {
            'username_color': forms.Select(choices=[
                ('#000000', 'Black'),
                ('#ff0000', 'Red'),
                ('#008000', 'Green'),
                ('#0000ff', 'Blue'),
                ('#0000ff', 'Pink'),
                ('#800080', 'Purple'),
            ], attrs={'class': 'form-control'})
        }

class RegisterForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'password1', 'password2']


