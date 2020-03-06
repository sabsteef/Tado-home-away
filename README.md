# Tado Home / Away Function for Home Assistant
## Description
Tado V3+ doesn't let you set the Home or Away values. You need the Tado mobile app to set the Home/Away functions.And it's based on Geolocation.

I did not want to send my location to Tado every 30 sec. And my kids have older phones that do not last all day of the youtube and media that my kids uses. And send there location to Tado. Its just to mutch for those phones.

So I wanted to use the WiFi at home to check if someone is home. (or juist press a button, turn a nob.. etc) the Tado app does not provide this at all. (You need to be away first, then a button will show up te set the away mode. and geo needs to be on for that.

the following scripts will do this. 
### Features
- Set Home mode
- Set Away mode

## Installation
1. go to your mobile application invite an new user (Use one of your spare email address) logout of your mobile app.
register the invite. logon to the phone and give the tado mobile app access to your location.

2. go out of your home untill tado say your away. then disable location tracking in the mobile.
just to be sure logout. and login with you own account ( don't turn location tracking on. leave it off ) go home

3. Copy all the file to Home Assistant config folder. Add the following variables of  the secrets.yaml to your secrets.yaml file ( Or use mine)

- tado_mobile_user:  The account we just created
- tado_mobile_password: The password of the above user we just created
- tado_client_secret: wZaRN7rpjn3FoNyF5IFuxg9uMzYJcvOoQ8QWiIqS3hfk6gLhVlG57j5YNoZL2Rtc if it changes you can get it here: https://my.tado.com/webapp/env.js 

- tado_cert_location: /tmp/tadotoken ( HA account needs write access to this folder)
- tado_home: 12345
- tado_mobile_device: 123456

how to get your home ID:  Use the following URL with your Tado Username and Password    https://my.tado.com/api/v2/me?username=TADO_Username&password=TADO_password
   in the responce are your Home Id and and Mobile Id. To use  in your secrets.Yaml

4. Make the files tado_away.sh, tado_home.sh and tado_web.py executable
sudo chmod +x tado_away.sh
sudo chmod +x tado_home.sh
sudo chmod +x tado_web.py

5. install the following  modules:
-	Curl 
 sudo apt-get install curl
-	JQ 
sudo apt-get install jq
-	Selenium and Chrome
-	see https://tecadmin.net/setup-selenium-with-chromedriver-on-debian until step 4

done. 

To use (or test) you can give a shell command ./tado_away.sh or ./tado_home.sh
now to can use the with Home assistant with the Shell Commands based on your automation. 

Note: don’t use the create account anymore on a phone. Your own account can be used again if you like (with location if needed)

I’m not an HA programmer. I just needed something that worked. And there wasn’t anything available for me. 

Free to use or to copy. Just let me know ;-) 
