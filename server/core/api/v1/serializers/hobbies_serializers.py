from django.db import models
from django.db.models import fields
from rest_framework import serializers;
from core.models.models_hobbies import Filmes,Viagens,Games,Musicas

class FilmesSerializers(serializers.ModelSerializer):
    class Meta:
        model = Filmes
        fields = (
            'id','nome','categoria','descricao'
        )
class ViagensSerializers(serializers.ModelSerializer):
    class Meta:
        model = Viagens
        fields = (
            'id','nome','local','descricao'
        )
class GamesSerializers(serializers.ModelSerializer):
    class Meta:
        model = Games
        fields = (
            'id','nome','genero','descricao'
        )
class MusicasSerializers(serializers.ModelSerializer):
    class Meta:
        model = Musicas
        fields = (
            'id','nome','album','descricao'
        )                        