from django import forms
from .models import Message

class MessageForm(forms.ModelForm):
    class Meta:
        model = Message
        fields = ['messages']
        widgets = {
                'messages': forms.Textarea(attrs={
                    'class': 'form-control',
                    'placeholder': 'Type your message here...',
                    'rows': 10
                    })
                }



