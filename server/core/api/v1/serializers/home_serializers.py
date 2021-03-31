from django.db import models
from django.db.models import fields
from rest_framework import serializers;
from core.models.models_home import MyDescription

class MyDescriptionSerializers(serializers.ModelSerializer):
    class Meta:
        model = MyDescription
        fields = (
            'id','nome','idade','descricao'
        )
        