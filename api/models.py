from django.db import models

# Create your models here.
class Task(models.Model):
    CHOICES = (
        ('pending', 'Pending'),
        ('in progress', 'In Progress'),
        ('done', 'Done'),
    )

    name = models.CharField(max_length=200)
    description = models.TextField(null=True, blank=True)
    deadline = models.DateField()
    status = models.CharField(max_length=50, choices=CHOICES, default='pending')



    def __str__(self):
        return self.name