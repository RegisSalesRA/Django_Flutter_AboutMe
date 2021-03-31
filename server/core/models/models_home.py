from django.db import models

class MyDescription(models.Model):
    nome = models.CharField(max_length=100)
    idade = models.CharField(max_length=99)
    descricao = models.TextField()

    class Meta:
        verbose_name = 'My Description'
        verbose_name_plural = 'My Descriptions'

    def __repr__(self):
        return f"My Descriptions: {self.nome}"    
    
    def __str__(self):
        return self.nome    