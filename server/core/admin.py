from core.models.models_professions import Faculdades,Trabalhos
from core.models.models_hobbies import Filmes,Games,Musicas,Viagens
from core.models.models_home import MyDescription
from django.contrib import admin
# Register your models here.

admin.site.register(MyDescription)

admin.site.register(Musicas)
admin.site.register(Viagens)
admin.site.register(Games)
admin.site.register(Filmes)

admin.site.register(Trabalhos)
admin.site.register(Faculdades)