from django.shortcuts import render,redirect
from django.conf import settings
from django.http import HttpResponse
from cryptography.fernet import Fernet
from . import models 
from . import smsapi

from myadmin import models as adminmodel
from user import models as usermodel
import time
from user import state_city_list
import base64 


curl=settings.CURRENT_URL
media_url=settings.MEDIA_URL
dt=time.strftime("%d/%m/%Y-%H:%M:%S")


#middleware to check session for mainapp routes
def sessioncheck_middleware(get_response):
	def middleware(request):
		if request.path=='' or request.path=='/home/' or request.path=='/about/' or request.path=='/contact/' or request.path=='/login/' or request.path=='/service/' or request.path=='/register/':
			request.session['sunm']=None
			request.session['srole']=None
			
			response = get_response(request)
				
		else:
			response = get_response(request)		
		return response	
	return middleware




def home(request):
	clist=adminmodel.Addcat.objects.filter()
	return render(request,"index.html",{'curl':curl,'media_url':media_url,'clist':clist})
	
def showsubcat(request):
	cnm=request.GET.get('cnm')
	sclist=adminmodel.Addsubcat.objects.filter(catnm=cnm)
	return render(request,"showsubcat.html",{'curl':curl,'media_url':media_url,'sclist':sclist,'cnm':cnm})	

def about(request):
	#response=render(request,"about.html",{'curl':curl})
	#response.set_cookie("cunm","admin",3600*24)
	#response.set_cookie("cpass","admin123",3600*24)
	#print(request.COOKIES)
	return render(request,"about.html",{'curl':curl})
	
	cunm=request.COOKIES.get('cunm')
	cpass=request.COOKIES.get('cpass')
	print("username :",cunm,"password :",cpass)
	return response

def contact(request):
	return render(request,"contact.html",{'curl':curl})

def service(request):
	return render(request,"service.html",{'curl':curl})

def register(request):
	if request.method=="GET":
		return render(request,"register.html",{'curl':curl,'output':''})
	else:
		#print(request.POST)
		name=request.POST.get("name")
		username=request.POST.get("username")
		password=request.POST.get("password")
		mobile=request.POST.get("mobile")
		address=request.POST.get("address")
		city=request.POST.get("city")
		gender=request.POST.get("gender")
		
		p=models.Register(name=name,username=username,password=password,mobile=mobile,address=address,city=city,gender=gender,status=0,role='user',dt=dt)		
		p.save()			
		
		smsapi.sendSMS(mobile)
		
		import smtplib 
		from email.mime.multipart import MIMEMultipart
		from email.mime.text import MIMEText
	
		me = "phpbatch34@gmail.com"
		you = username

		msg = MIMEMultipart('alternative')
		msg['Subject'] = "Verification Mail FindUs"
		msg['From'] = me
		msg['To'] = you

		html = """<html>
  					<head></head>
  					<body>
    					<h1>Welcome to FindUs</h1>
    					<p>You have successfully registered , please click on the link below to verify your account</p>
    					<h2>Username : """+username+"""</h2>
    					<h2>Password : """+str(password)+"""</h2>
    					<br>
    					<a href='http://localhost:8000/verifyuser/?email="""+username+"""' >Click here to verify account</a>		
  					</body>
				</html>
				"""
	
		s = smtplib.SMTP('smtp.gmail.com', 587) 
		s.starttls() 
		s.login("phpbatch34@gmail.com", "123@@123") 
	
		part2 = MIMEText(html, 'html')

		msg.attach(part2)
	
		s.sendmail(me,you, str(msg)) 
		s.quit() 
		print("mail send successfully....")
		
		return render(request,"register.html",{'curl':curl,'output':'Registration successfully done....'})
	
def verifyuser(request):
	email=request.GET.get('email')	
	models.Register.objects.filter(username=email).update(status=1)
	return redirect(curl+'login/')
	
def login(request):
	mycunm=""
	mycpass=""
	if request.COOKIES.get('cunm')!=None:
		mycunm=request.COOKIES.get('cunm')
		fp=open("key.key","rb")
		key=fp.read()
		fp.close()
		
		f = Fernet(key)
		p=request.COOKIES.get('cpass')
		b=p.decode()
		#s=b.decode()
		mycpass = f.decrypt(b)
		
	if request.method=="GET":
		return render(request,"login.html",{'curl':curl,'output':'','mycunm':mycunm,'mycpass':mycpass})
	else:
		username=request.POST.get("username")
		password=request.POST.get("password")
		chk=request.POST.get("chk")
		
		userDetails=models.Register.objects.filter(username=username,password=password,status=1)
		
		if len(userDetails)>0:
		
			#to store details of users in session
			request.session['sunm']=userDetails[0].username 
			request.session['srole']=userDetails[0].role
		
			if userDetails[0].role=="admin":
				response=redirect(curl+'myadmin/')
			else:
				response=redirect(curl+'user/')	
			
			#to store details of users in cookies
			if chk!=None:
				key = Fernet.generate_key()
				f = Fernet(key)
				
				fp=open("key.key","wb")
				fp.write(key)
				fp.close()
				
				encrypted = f.encrypt(password.encode())
				response.set_cookie("cunm",username,3600*24)
				response.set_cookie("cpass",encrypted,3600*24)
			return response
		else:
			return render(request,"login.html",{'curl':curl,'output':'Invalid username or password, Try again....','mycunm':mycunm,'mycpass':mycpass})	
									 
def showlocation(request):
	scnm=request.GET.get('scnm')
	slist=state_city_list.fetchstatelist()
	locationlist=usermodel.Location.objects.filter(subcategory=scnm,status=1)
	return render(request,"showlocation.html",{'curl':curl,'media_url':media_url,'locationlist':locationlist,'scnm':scnm,'slist':slist})

def fetchcity(request):
	snm=request.GET.get('snm')
	clist=state_city_list.fetchcitylist(snm)
	cityoptlist=["<option>Select city</option>"]
	for x in clist:
		cityoptlist.append("<option>"+x+"</option>")
	return HttpResponse(cityoptlist)		

def fetchlocality(request):
	city_name=request.GET.get('city_name')
	localityDetails=usermodel.Locality.objects.filter(cityname=city_name)	
	localitylist=["<option>Select locality</option>"]
	for row in localityDetails:
		localitylist.append("<option>"+row.localityname+"</option>")
	return HttpResponse(localitylist)	

def fetchlocationfilter(request):
	subcategory_name=request.GET.get('subcategory_name')
	locality_name=request.GET.get('locality_name')
	locationlist=usermodel.Location.objects.filter(subcategory=subcategory_name,locality=locality_name,status=1)
	tbl_str=""
	for row in locationlist:
		tbl_str+="""<table height="100" class="table table-bordered">
<tr>
	<td rowspan="3" width="30%" >
		<center>
		<img src='"""+media_url+row.file1+"""' height="100" width="100">
	</center>
	</td>
	<td><b>Title : </b> """+row.title+"""</td>
</tr>	
<tr>
	<td><b>Description : </b>"""+row.description+"""</td>
</tr>
<tr>
<td>
<b>Address : </b> """+row.address+"""
<br>
<a style="color:blue;" href='' >Read more...</a>
</td>
</tr>
</table>
<div style="height:2px;background-color:black;"></div>
<br/>"""



	return HttpResponse(tbl_str)	



