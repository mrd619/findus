from django.contrib import admin
from django.urls import path,include
from django.conf.urls.static import  static
from django.conf import settings
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home),
    path('showsubcat/', views.showsubcat),
    path('showlocation/', views.showlocation),
    path('fetchcity/', views.fetchcity),
    path('fetchlocality/', views.fetchlocality),
    path('fetchlocationfilter/', views.fetchlocationfilter),
    path('about/', views.about),
    path('contact/', views.contact),
    path('service/', views.service),
    path('register/', views.register),
    path('verifyuser/', views.verifyuser),
    path('login/', views.login),
    path('myadmin/', include('myadmin.urls')),
    path('user/', include('user.urls'))
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
