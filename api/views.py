from django.shortcuts import render
from rest_framework.viewsets import ModelViewSet
from .models import Task
from .serializers import TaskSerializer
from rest_framework import filters

from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.models import User


class TaskViewSet(ModelViewSet):
    queryset = Task.objects.all()
    serializer_class = TaskSerializer

    filter_backends = [filters.SearchFilter]
    search_fields = ['status']
    filterset_fields = ['status']

    permission_classes = [IsAuthenticated]


# Create your views here.