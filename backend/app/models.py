from django.db import models
from django.contrib.auth.models import AbstractUser

"""
User Model
"""


class User(models.Model):
    firstname = models.CharField(max_length=200)
    lastname = models.CharField(max_length=200)
    age = models.IntegerField()
    is_available = models.BooleanField()
    email = models.EmailField(unique=True, null=True)
    position = models.IntegerField()
    overall_performance = models.IntegerField()
    image = models.ImageField(null=True, default="avatar.svg")

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    def __str__(self):
        return str(self.username)


"""
Project Model
"""


class Project(models.Model):
    leader = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    name = models.CharField(max_length=255)
    description = models.TextField(null=True, blank=True)
    users = models.ManyToManyField(
        User, related_name='users', blank=True)
    category = models.IntegerField(null=True)
    start_date = models.DateTimeField(auto_now_add=True)
    end_date = models.DateTimeField(null=True)
    deadline = models.DateTimeField(null=True)

    def __str__(self):
        return str(self.name)


"""
Task Model
"""


class Task(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    project = models.ForeignKey(Project, on_delete=models.SET_NULL, null=True)
    name = models.CharField(max_length=255)
    leader_grade = models.IntegerField(default=0)
    date_grade = models.IntegerField(default=0)
    description = models.TextField(null=True, blank=True)
    start_date = models.DateTimeField(auto_now_add=True)
    end_date = models.DateTimeField(null=True)
    deadline = models.DateTimeField(null=True)

    def __str__(self):
        return str(self.name)
