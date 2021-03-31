from django.db import models

class Trabalhos(models.Model):
    nome = models.CharField(max_length=100)
    descricao = models.TextField()

    class Meta:
        verbose_name = 'Trabalho'
        verbose_name_plural = 'Trabalhos'

    def __repr__(self):
        return f"Trabalhos: {self.nome}"    
    
    def __str__(self):
        return self.nome
class Faculdades(models.Model):
    nome = models.CharField(max_length=100)
    curso = models.CharField(max_length=100)
    class Meta:
        verbose_name = 'Faculdade'
        verbose_name_plural = 'Faculdades'

    def __repr__(self):
        return f"Faculdades: {self.nome}"    
    
    def __str__(self):
        return self.nome    