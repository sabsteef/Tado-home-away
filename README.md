# Tado-home-away
## Description
Tado V3+ doesn't let you set the Home or Away values. You need the Tado mobile app to set the Home/Away functions. based on Geolocation.
i did not want to send my location every 30 sec to Tado. and my kids have older phones that do not last all of the youtube and media that my kids uses. And sent there location to Tado. its just to mutch for those phones.

So i wanted to use the WiFi at home to check if someone is home. (or juist press a button, turn a nob.. etc)
What i did not want is letting Tado manage it.

### Features
- Set Home
- Set Away
- get incription Key

## Installation
1. go to your mobile application invite an new user (Use one of your spare email adresses) logout of your mobile app.
registere the invite. logon to the phone and give the todo mobile app acces to your location.

2. go out of your home untill tado say your away. then disable location tracking in the mobile.
just to be sure logout. and login with you own account ( don't turn location tracking on. leave it off for now) go home

3. Copy all the file to Home Assistant home folder. Add the following variables to the secrets.Yaml

- tado_mobile_user: "bla@bla.com"  //the account we just created
- tado_mobile_password: "Password" // the password we just created
- tado_client_secret: wZaRN7rpjn3FoNyF5IFuxg9uMzYJcvOoQ8QWiIqS3hfk6gLhVlG57j5YNoZL2Rtc // you can get it here: https://my.tado.com/webapp/env.js 
- tado_cert_location: /home/homeassistant/.homeassistant/custom_components/tadotoken // location we write the token temperary
- tado_home: 12345
- tado_mobile_device: 123456

4. how to get your home ID
   use the following URL with your Tado username and password https://my.tado.com/api/v2/me?username=TADO_Username&password=TADO_password
   in the responce are your Home Id and and Mobile Id. use them in your secrets.Yaml

done. Note: dont use the create account anymore on a phone. your own account can be used again if you like( with location if needed)

to use it always run the .tado_get_token.sh first it createds a token. T you can give the command .tado_away.sh or .tado_home.sh
now to can use the with Home assistant and Shell_Commands.

im not an HA programmer. i just needed somthing that worked. and there was'n anything avalible for me. free to use or to copy. 
just let me know ;-)



