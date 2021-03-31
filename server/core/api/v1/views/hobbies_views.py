from typing import Generic
from django.db.models.fields import GenericIPAddressField
from django.shortcuts import render
from rest_framework.serializers import Serializer
from rest_framework import generics
from core.models.models_hobbies import Filmes,Games,Viagens,Musicas
from core.api.v1.serializers.hobbies_serializers import FilmesSerializers,ViagensSerializers,GamesSerializers,MusicasSerializers

class ListFilmesView(generics.ListCreateAPIView):
    queryset = Filmes.objects.all()
    serializer_class = FilmesSerializers

class DetailFilmesView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Filmes.objects.all()
    serializer_class = FilmesSerializers


class ListGamesView(generics.ListCreateAPIView):
    queryset = Games.objects.all()
    serializer_class = GamesSerializers

class DetailGamesView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Games.objects.all()
    serializer_class = GamesSerializers


class ListMusicasView(generics.ListCreateAPIView):
    queryset = Musicas.objects.all()
    serializer_class = MusicasSerializers

class DetailMusicasView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Musicas.objects.all()
    serializer_class = MusicasSerializers

class ListViagensView(generics.ListCreateAPIView):
    queryset = Viagens.objects.all()
    serializer_class = ViagensSerializers

class DetailViagensView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Viagens.objects.all()
    serializer_class = ViagensSerializers
