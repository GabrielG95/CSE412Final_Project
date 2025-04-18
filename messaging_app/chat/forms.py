from django import forms
from .models import Message

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



