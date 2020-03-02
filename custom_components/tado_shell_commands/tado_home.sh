#Set Tado to home Mode

# include parse_yaml function
. /home/homeassistant/.homeassistant/custom_components/parse_yaml.sh

# include variabled
eval $(parse_yaml /home/homeassistant/.homeassistant/secrets.yaml)

# Debug option to validate if variables are extracted correctly from the secrets.yaml
#printf 'the mobile_device is "%s"\n' $tado_mobile_device
#printf 'the tado_home is "%s"\n' $tado_home

#generate token
curl -s "https://auth.tado.com/oauth/token" -d client_id=tado-web-app -d grant_type=password -d scope=home.user -d username=$tado_mobile_user -d password=$tado_mobile_password -d client_secret=$tado_client_secret  | jq -r '.access_token' > $tado_cert_location

#Set Geotracking to false
curl -X PUT "https://my.tado.com/api/v2/homes/$tado_home/mobileDevices/$tado_mobile_device/settings" -H "Authorization: Bearer `cat $tado_cert_location`" -H "Content-Type:application/json;charset=UTF-8" --data-binary '{"geoTrackingEnabled":false}'

# Debug option To validate if change is made on the Tado side
#curl "https://my.tado.com/api/v2/homes/$tado_home/users" -H "Authorization: Bearer `cat $tado_cert_location`"

# aditional steps to enable Home mode without Tado contract. ( can be disable if you have a contract.
python3 /home/homeassistant/.homeassistant/custom_components/tado_web.py

