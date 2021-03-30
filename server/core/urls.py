from django.urls import include, path,re_path

urlpatterns = [
    path('v1/', include('core.api.v1.urls.my_description_urls')),
]
