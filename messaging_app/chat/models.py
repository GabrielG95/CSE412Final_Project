from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

"""
- We need to think about what we actually want to save to out db.
- Each class will be tis own table in the database.
- Each attribute within the class will be a different field in the db.
"""

# Create your models here.

class Message(models.Model):
    messages = models.TextField()
    date_posted = models.DateTimeField(default=timezone.now)
    author = models.ForeignKey(User, on_delete=models.CASCADE)









