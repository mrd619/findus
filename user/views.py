from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.conf import settings
from django.core.files.storage import FileSystemStorage
from findus import models as mainmodel
from myadmin import models as adminmodel
from . import models
from . import state_city_list
import time

curl=settings.CURRENT_URL
user_curl=settings.USER_CURRENT_URL
media_url=settings.MEDIA_URL
dt=time.strftime("%d/%m/%Y-%H:%M:%S")

#middleware to check session for user routes
def sessioncheckuser_middleware(get_response):
	def middleware(request):
		if request.path=='/user/':
			if request.session['sunm']==None or request.session['srole']!="user":
				response = redirect(curl+'login/')
			else:
				response = get_response(request)
		else:
			response = get_response(request)		
		return response	
	return middleware


# Create your views here.
def userhome(request):
	return render(request,"userhome.html",{'curl':curl,'user_curl':user_curl,'sunm':request.session['sunm']})

def addlocation(request):
	clist=adminmodel.Addcat.objects.filter()	
	slist=state_city_list.fetchstatelist()
	if request.method=="GET":
		return render(request,"addlocation.html",{'curl':curl,'user_curl':user_curl,'sunm':request.session['sunm'],'clist':clist,'slist':slist,'output':''})
	else:
		title=request.POST.get('title')
		category=request.POST.get('category')	
		subcategory=request.POST.get('subcategory')
		description=request.POST.get('description')
		address=request.POST.get('address')
		state=request.POST.get('state')
		city=request.POST.get('city')
		locality=request.POST.get('locality')
		
		file1=request.FILES['file1']
		fs = FileSystemStorage()
		file1name = fs.save(file1.name,file1)

		if request.POST.get('file2')=="":
			file2name="logo.png"
		else:
			file2=request.FILES['file2']
			fs = FileSystemStorage()
			file2name = fs.save(file2.name,file2)

		if request.POST.get('file3')=="":
			file3name="logo.png"
		else:
			file3=request.FILES['file3']
			fs = FileSystemStorage()
			file3name = fs.save(file3.name,file3)

		if request.POST.get('file4')=="":
			file4name="logo.png"
		else:
			file4=request.FILES['file4']
			fs = FileSystemStorage()
			file4name = fs.save(file4.name,file4)		

		p=models.Location(title=title,category=category,subcategory=subcategory,description=description,file1=file1name,file2=file2name,file3=file3name,file4=file4name,address=address,state=state,city=city,locality=locality,status=0,uid=request.session['sunm'])	
		p.save()

		return render(request,"addlocation.html",{'curl':curl,'user_curl':user_curl,'sunm':request.session['sunm'],'clist':clist,'slist':slist,'output':'Location added successfully....'})	

def fetchsubcat(request):
	cnm=request.GET.get('cnm')
	scDetails=adminmodel.Addsubcat.objects.filter(catnm=cnm)	
	sclist=["<option>Select sub category</option>"]
	for row in scDetails:
		sclist.append("<option>"+row.subcatnm+"</option>")
	return HttpResponse(sclist)	

def fetchcity(request):
	snm=request.GET.get('snm')
	clist=state_city_list.fetchcitylist(snm)
	cityoptlist=["<option>Select city</option>"]
	for x in clist:
		cityoptlist.append("<option>"+x+"</option>")
	return HttpResponse(cityoptlist)		

def fetchlocality(request):
	city_name=request.GET.get('city_name')
	localityDetails=models.Locality.objects.filter(cityname=city_name)	
	localitylist=["<option>Select locality</option>"]
	for row in localityDetails:
		localitylist.append("<option>"+row.localityname+"</option>")
	return HttpResponse(localitylist)		
	
def viewlocations(request):
	locationdetails=models.Location.objects.filter(uid=request.session['sunm'])	
	
	PAYPAL_URL="https://www.sandbox.paypal.com/cgi-bin/webscr"
	PAYPAL_ID="sb-hz4lu2385721@business.example.com"
	
	
	return render(request,"viewlocationsuser.html",{'curl':curl,'user_curl':user_curl,'sunm':request.session['sunm'],'locationdetails':locationdetails,'media_url':media_url,'PAYPAL_URL':PAYPAL_URL,'PAYPAL_ID':PAYPAL_ID})
	
def payment(request):
	locationid=request.GET.get('locationid')
	uid=request.GET.get('sunm')
	price=request.GET.get('price')
	p=models.Payment(locationid=int(locationid),uid=uid,price=price,dt=dt)
	p.save()
	models.Location.objects.filter(locationid=int(locationid)).update(status=1)
	return redirect(user_curl+'viewlocations/')
	
	
def cancel(request):	
	return redirect(user_curl+'viewlocations/')
	

def editprofile(request):
	if request.method=='GET':
		userDetails=mainmodel.Register.objects.filter(username=request.session['sunm'])
		return render(request,"editprofile.html",{'curl':curl,'user_curl':user_curl,'sunm':request.session['sunm'],'userDetails':userDetails[0]})
	else:
		name=request.POST.get("name")
		username=request.POST.get("username")
		password=request.POST.get("password")
		mobile=request.POST.get("mobile")
		address=request.POST.get("address")
		city=request.POST.get("city")
		gender=request.POST.get("gender")
		mainmodel.Register.objects.filter(username=username).update(name=name,password=password,mobile=mobile,address=address,city=city,gender=gender)
		return redirect(curl+'login/')    
                    
	
	
