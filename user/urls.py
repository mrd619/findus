from django.urls import path
from . import views

urlpatterns = [
    path('', views.userhome),
    path('addlocation/', views.addlocation),
    path('fetchsubcat/', views.fetchsubcat),
    path('fetchcity/', views.fetchcity),
    path('fetchlocality/', views.fetchlocality),
    path('viewlocations/', views.viewlocations),
    path('payment/', views.payment),
    path('cancel/', views.cancel),
    path('editprofile/', views.editprofile)
]
