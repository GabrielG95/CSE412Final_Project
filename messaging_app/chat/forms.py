from django import forms
from .models import Message

def MessageForm(forms.ModelForm):
    class Meta:
        model = Message
        fields = ['messages']
        widgets = {
                'messages': forms.Textarea(attr={
                    'class': 'form-control',
                    'placeholder': 'Type your message here...',
                    'rows': 10
                    })
                }



