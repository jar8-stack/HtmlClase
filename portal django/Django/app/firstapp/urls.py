from django.urls import path

from . import views

urlpatterns = [
    path('',views.vista,name='vista'),
    path('dos',views.vista2,name='vista2'),
]
