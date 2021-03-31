from django.db import models 


class Filmes(models.Model):
    nome = models.CharField(max_length=100)
    descricao = models.CharField(max_length=100)
    categoria = models.CharField(max_length=100)

    class Meta:
        verbose_name = 'Filme'
        verbose_name_plural = 'Filmes'

    def __repr__(self):
        return f"Filmes: {self.nome}"    
    
    def __str__(self):
        return self.nome

class Viagens(models.Model):
    nome = models.CharField(max_length=100)
    descricao = models.CharField(max_length=100)
    local = models.CharField(max_length=100)

    class Meta:
        verbose_name = 'Viagem'
        verbose_name_plural = 'Viagens'

    def __repr__(self):
        return f"Viagens: {self.nome}"    
    
    def __str__(self):
        return self.nome

class Games(models.Model):
    nome = models.CharField(max_length=100)
    descricao = models.CharField(max_length=100)
    genero = models.CharField(max_length=100)

    class Meta:
        verbose_name = 'Game'
        verbose_name_plural = 'Games'

    def __repr__(self):
        return f"Games: {self.nome}"    
    
    def __str__(self):
        return self.nome

class Musicas(models.Model):
    nome = models.CharField(max_length=100)
    descricao = models.CharField(max_length=100)
    album = models.CharField(max_length=100)

    class Meta:
        verbose_name = 'Musica'
        verbose_name_plural = 'Musicas'

    def __repr__(self):
        return f"Musicas: {self.nome}"    
    
    def __str__(self):
        return self.nome