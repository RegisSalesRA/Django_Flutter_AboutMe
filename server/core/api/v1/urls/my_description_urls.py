from core.api.v1.views.home_views import DetailMyDescriptionView, ListMyDescriptionView
from django.urls import path

urlpatterns = [
    path("my_description/", ListMyDescriptionView.as_view(), name="create_seller"),
    path("my_description/<int:pk>/", DetailMyDescriptionView.as_view(), name="retrieve_update_destroy_seller"),
]
