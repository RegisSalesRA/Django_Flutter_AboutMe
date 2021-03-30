from django.urls import path, include, re_path
from rest_framework import permissions
# from drf_yasg.views import get_schema_view
# from drf_yasg import openapi

urlpatterns = [
    path("my_descriptions/", include("core.api.v1.urls.my_description_urls")),
]
