#get Token from Tado


# include parse_yaml function
. /home/homeassistant/.homeassistant/custom_components/parse_yaml.sh

eval $(parse_yaml /home/homeassistant/.homeassistant/secrets.yaml)

printf 'the user is "%s"\n' $tado_mobile_user
printf 'the password is "%s"\n' $tado_mobile_password
printf 'the password is "%s"\n' $tado_client_secret
printf 'the password is "%s"\n' $tado_cert_location


curl -s "https://auth.tado.com/oauth/token" -d client_id=tado-web-app -d grant_type=password -d scope=home.user -d username=$tado_mobile_user -d password=$tado_mobile_password -d client_secret=$tado_client_secret  | jq -r '.access_token' > $tado_cert_location

