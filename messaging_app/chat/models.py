from django.db import models
from django.utils import timezone
from django.dispatch import receiver
from django.contrib.auth.models import User
from django.db.models.signals import post_save

"""
- We need to think about what we actually want to save to out db.
- Each class will be tis own table in the database.
- Each attribute within the class will be a different field in the db.
"""

# Create your models here.

class Message(models.Model):
    # .TextField is for unlimited messaging input
    content = models.TextField()
    # Get current time for message
    date_posted = models.DateTimeField(default=timezone.now)
    # on_delete will remove the message when user deletes account
    author = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    username = models.CharField(max_length=30, default="Anonymous")

class FriendRequest(models.Model):
    from_user = models.ForeignKey(User, related_name='sent_requests', on_delete=models.CASCADE)
    to_user = models.ForeignKey(User, related_name='received_requests', on_delete=models.CASCADE)
    is_accepted = models.BooleanField(default=False)
    timestamp = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('from_user', 'to_user')

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    username_color = models.CharField(max_length=30, default='black')

@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

