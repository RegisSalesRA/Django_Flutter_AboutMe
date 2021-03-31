from typing import Generic
from django.db.models.fields import GenericIPAddressField
from django.shortcuts import render
from rest_framework.serializers import Serializer
from rest_framework import generics
from core.models.models_home import MyDescription
from core.api.v1.serializers.home_serializers import MyDescriptionSerializers


class ListMyDescriptionView(generics.ListCreateAPIView):
    queryset = MyDescription.objects.all()
    serializer_class = MyDescriptionSerializers

class DetailMyDescriptionView(generics.RetrieveUpdateDestroyAPIView):
    queryset = MyDescription.objects.all()
    serializer_class = MyDescriptionSerializers
