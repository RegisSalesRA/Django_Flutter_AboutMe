from typing import Generic
from django.db.models.fields import GenericIPAddressField
from django.shortcuts import render
from rest_framework.serializers import Serializer
from rest_framework import generics
from core.models.models_professions import Trabalhos,Faculdades
from core.api.v1.serializers.professions_serializers import TrabalhosSerializers,FaculdadesSerializers

class ListTrabalhosView(generics.ListCreateAPIView):
    queryset = Trabalhos.objects.all()
    serializer_class = TrabalhosSerializers

class DetailTrabalhosView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Trabalhos.objects.all()
    serializer_class = TrabalhosSerializers

class ListFaculdadesView(generics.ListCreateAPIView):
    queryset = Faculdades.objects.all()
    serializer_class = FaculdadesSerializers

class DetailFaculdadesView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Faculdades.objects.all()
    serializer_class = FaculdadesSerializers
