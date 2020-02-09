#home Mode
# include parse_yaml function
. /home/homeassistant/.homeassistant/custom_components/parse_yaml.sh

# include variabled
eval $(parse_yaml /home/homeassistant/.homeassistant/secrets.yaml)

#printf 'the mobile_device is "%s"\n' $tado_mobile_device
#printf 'the tado_home is "%s"\n' $tado_home


curl -X PUT "https://my.tado.com/api/v2/homes/$tado_home/mobileDevices/$tado_mobile_device/settings" -H "Authorization: Bearer `cat $tado_cert_location`" -H "Content-Type:application/json;charset=UTF-8" --data-binary '{"geoTrackingEnabled":false}'

#curl "https://my.tado.com/api/v2/homes/$tado_home/users" -H "Authorization: Bearer `cat $tado_cert_location`"
