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



