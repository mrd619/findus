def sendSMS(mobile):
	import requests
	url = "https://www.fast2sms.com/dev/bulk"
	msg = "Registration confirmation FindUs"
	querystring = {"authorization":"QkugpU4V3ALHjOCBdtrWEZbDPmNchT6Xx1J9waiYFqyM2z8fKs9foURvuMqtzYawBgVH7SD51TmxrshW","sender_id":"FSTSMS","message":msg,"language":"english","route":"p","numbers":mobile}
	headers = {
    'cache-control': "no-cache"
}
	response = requests.request("GET", url,headers=headers, params=querystring)

	print(response.text)
