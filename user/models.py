from django.db import models

# Create your models here.

class Locality(models.Model):
	localityid = models.AutoField(primary_key=True)
	cityname=models.CharField(max_length=100)
	localityname=models.CharField(max_length=100)

class Location(models.Model):
	locationid = models.AutoField(primary_key=True)
	title=models.CharField(max_length=100)
	category=models.CharField(max_length=50)
	subcategory=models.CharField(max_length=50)
	description=models.CharField(max_length=1000)	
	file1=models.CharField(max_length=500)
	file2=models.CharField(max_length=500)
	file3=models.CharField(max_length=500)
	file4=models.CharField(max_length=500)
	address=models.CharField(max_length=1000)
	state=models.CharField(max_length=50)
	city=models.CharField(max_length=50)
	locality=models.CharField(max_length=100)
	uid=models.CharField(max_length=100,default="")
	status=models.IntegerField()	

class Payment(models.Model):
	txnid = models.AutoField(primary_key=True)
	locationid=models.IntegerField()
	uid=models.CharField(max_length=100)
	price=models.CharField(max_length=100)
	dt=models.CharField(max_length=100)	
	
	
	
