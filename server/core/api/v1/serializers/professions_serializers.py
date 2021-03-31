from django.db import models
from django.db.models import fields
from rest_framework import serializers;
from core.models.models_professions import Trabalhos,Faculdades

class TrabalhosSerializers(serializers.ModelSerializer):
    class Meta:
        model = Trabalhos
        fields = (
            'id','nome','descricao'
        )
class FaculdadesSerializers(serializers.ModelSerializer):
    class Meta:
        model = Faculdades
        fields = (
            'id','nome','curso'
        )