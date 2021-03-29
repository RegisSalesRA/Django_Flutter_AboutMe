from django.db import models

class MyDescription(models.Model):
    nome = models.CharField(max_length=100)
    idade = models.PositiveIntegerField(default=0)
    descricao = models.TextField()