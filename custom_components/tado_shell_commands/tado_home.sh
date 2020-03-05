#Set Tado to home Mode

# include parse_yaml function
. /opt/homeassistant/config/custom_components/tado_shell_commands/parse_yaml.sh

# include variabled
eval $(parse_yaml /opt/homeassistant/config/secrets.yaml)

# Debug option to validate if variables are extracted correctly from the secrets.yaml
#printf 'the tado_mobile_user is "%s"\n' $tado_mobile_user
#printf 'the tado_mobile_password is "%s"\n' $tado_mobile_password
#printf 'the tado_client_secret is "%s"\n' $tado_client_secret
#printf 'the tado_cert_location is "%s"\n' $tado_cert_location
#printf 'the tado_home is "%s"\n' $tado_home
#printf 'the tado_mobile_device is "%s"\n' $tado_mobile_device

# generate token
curl -s "https://auth.tado.com/oauth/token" -d client_id=tado-web-app -d grant_type=password -d scope=home.user -d username=$tado_mobile_user -d password=$tado_mobile_password -d client_secret=$tado_client_secret  | jq -r '.access_token' > $tado_cert_location

# Set Geotracking to false
curl -X PUT "https://my.tado.com/api/v2/homes/$tado_home/mobileDevices/$tado_mobile_device/settings" -H "Authorization: Bearer `cat $tado_cert_location`" -H "Content-Type:application/json;charset=UTF-8" --data-binary '{"geoTrackingEnabled":false}'

# Debug option To validate if change is made on the Tado side
curl "https://my.tado.com/api/v2/homes/$tado_home/users" -H "Authorization: Bearer `cat $tado_cert_location`"

# aditional steps to enable Home mode without Tado contract. ( can be disable if you have a contract.
python3 /opt/homeassistant/config/custom_components/tado_shell_commands/tado_web.py $tado_mobile_user $tado_mobile_password

