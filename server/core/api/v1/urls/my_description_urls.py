from core.api.v1.views.home_views import DetailMyDescriptionView, ListMyDescriptionView
from core.api.v1.views.hobbies_views import ListFilmesView, DetailFilmesView,ListGamesView,DetailGamesView,ListViagensView,DetailViagensView,ListMusicasView,DetailMusicasView
from core.api.v1.views.professions_views import DetailFaculdadesView, ListFaculdadesView,DetailTrabalhosView, ListTrabalhosView

from django.urls import path

urlpatterns = [
    #Home
    path("my_description/", ListMyDescriptionView.as_view()),
    path("my_description/<int:pk>/", DetailMyDescriptionView.as_view()),
    #Hobbies
    path("filmes/", ListFilmesView.as_view()),
    path("filmes/<int:pk>/", DetailFilmesView.as_view()),
    path("games/", ListGamesView.as_view()),
    path("games/<int:pk>/", DetailGamesView.as_view()),
    path("viagens/", ListViagensView.as_view()),
    path("viagens/<int:pk>/", DetailViagensView.as_view()),
    path("musicas/", ListMusicasView.as_view()),
    path("musicas/<int:pk>/", DetailMusicasView.as_view()),
    #Professions
    path("trabalhos/", ListTrabalhosView.as_view()),
    path("trabalhos/<int:pk>/", DetailTrabalhosView.as_view()),
    path("faculdades/", ListFaculdadesView.as_view()),
    path("faculdades/<int:pk>/", DetailFaculdadesView.as_view()),

]
