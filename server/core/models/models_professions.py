from django.db import models

class Trabalhos(models.Model):
    nome = models.CharField(max_length=100)
    descricao = models.TextField()

class Faculdades(models.Model):
    nome = models.CharField(max_length=100)
    curso = models.CharField(max_length=100)