from .models import Task
from rest_framework.serializers import ModelSerializer



class TaskSerializer(ModelSerializer):
    class Meta:
        model = Task
        fields = '__all__'
        read_only_fields = ('id',)