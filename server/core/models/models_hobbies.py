from django.db import models 


class Filmes(models.Model):
    nome = models.CharField(max_length=100)
    descricao = models.CharField(max_length=100)
    categoria = models.CharField(max_length=100)

class Viagens(models.Model):
    nome = models.CharField(max_length=100)
    descricao = models.CharField(max_length=100)
    local = models.CharField(max_length=100)

class Games(models.Model):
    nome = models.CharField(max_length=100)
    descricao = models.CharField(max_length=100)
    genero = models.CharField(max_length=100)

class Musicas(models.Model):
    nome = models.CharField(max_length=100)
    descricao = models.CharField(max_length=100)
    album = models.CharField(max_length=100)