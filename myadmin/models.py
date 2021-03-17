from django.db import models

# Create your models here.

class Addcat(models.Model):
	catid = models.AutoField(primary_key=True)
	catnm=models.CharField(max_length=50)
	caticonnm=models.CharField(max_length=1000)
	
class Addsubcat(models.Model):
	subcatid = models.AutoField(primary_key=True)
	catnm=models.CharField(max_length=50)
	subcatnm=models.CharField(max_length=50)
	subcaticonnm=models.CharField(max_length=1000)	
