from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.conf import settings
from findus import models as mainmodel
from . import models
from django.core.files.storage import FileSystemStorage

curl=settings.CURRENT_URL
myadmin_curl=settings.ADMIN_CURRENT_URL

#middleware to check session for admin routes
def sessioncheckmyadmin_middleware(get_response):
	def middleware(request):
		if request.path=='/myadmin/' or request.path=='/myadmin/manageusers/' or request.path=='/myadmin/addcat/' or request.path=='/myadmin/addsubcat/':
			if request.session['sunm']==None or request.session['srole']!="admin":
				response = redirect(curl+'login/')
			else:
				response = get_response(request)
		else:
			response = get_response(request)		
		return response	
	return middleware


# Create your views here.
def adminhome(request):
	return render(request,"adminhome.html",{'myadmin_curl':myadmin_curl,'sunm':request.session['sunm']})
	
def manageusers(request):
	userDetails=mainmodel.Register.objects.filter(role='user')
	#print(userDetails)
	return render(request,"manageusers.html",{'myadmin_curl':myadmin_curl,'userDetails':userDetails,'sunm':request.session['sunm']})	

def manageuserstatus(request):
	s=request.GET.get('s')
	rid=request.GET.get('rid')
	if s=="block":
		mainmodel.Register.objects.filter(regid=int(rid)).update(status=0)
	elif s=="unblock":	
		mainmodel.Register.objects.filter(regid=int(rid)).update(status=1)
	else:
		mainmodel.Register.objects.filter(regid=int(rid)).delete()	
	return redirect(myadmin_curl+'manageusers/')	
	
def addcat(request):
	if request.method=="GET":
		return render(request,"addcat.html",{'myadmin_curl':myadmin_curl,'output':'','sunm':request.session['sunm']})
	else:
		catnm=request.POST.get("catnm")
		caticon=request.FILES['caticon']
		fs = FileSystemStorage()
		filename = fs.save(caticon.name,caticon)
		p=models.Addcat(catnm=catnm,caticonnm=filename)
		p.save()
		return render(request,"addcat.html",{'myadmin_curl':myadmin_curl,'output':'Category Added Successfully','sunm':request.session['sunm']})

def addsubcat(request):
	clist=models.Addcat.objects.filter()
	if request.method=="GET":
		return render(request,"addsubcat.html",{'myadmin_curl':myadmin_curl,'clist':clist,'output':'','sunm':request.session['sunm']})
	else:
		catnm=request.POST.get("catnm")
		subcatnm=request.POST.get("subcatnm")
		caticon=request.FILES['caticon']
		fs = FileSystemStorage()
		filename = fs.save(caticon.name,caticon)
		p=models.Addsubcat(catnm=catnm,subcatnm=subcatnm,subcaticonnm=filename)
		p.save()
		return render(request,"addsubcat.html",{'myadmin_curl':myadmin_curl,'clist':clist,'output':'Sub Category Added Successfully','sunm':request.session['sunm']})		









	
