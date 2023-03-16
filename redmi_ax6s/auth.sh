Macaddress=$(uci get network.wan.macaddr)
Vlan='004'
NASID='FLCONTGW001'
MetricKey=$(echo -n "nasid=ue${NASID}_${Vlan}&mac=${Macaddress}&eventType=4&date="$(date +%s) | base64)

echo ${MetricKey}$'\n'

curl https://cap.aws.opennetworkexchange.net/HSO/grpfiles/849/residents/welcome.html?NASID=${NASID}&MA=${Macaddress}&loginurl=https%3A%2F%2Fsecure.opennetworkexchange.net&typ=&VLAN=${Vlan}&lang=EN&dest=http%253A%252F%252Fwww.msftconnecttest.com%252Fredirect&site=FL-CONT&metricKey=${MetricKey}

echo $'\n'

curl 'https://bap.aws.opennetworkexchange.net/api/v1/auth?nasid=${NASID}&vlan=00&loginurl=https%3A%2F%2Fsecure.opennetworkexchange.net&mac=78%3Afd%3A77%3A62%3Ab8%3A7b'

echo $'\n'

curl 'https://bap.aws.opennetworkexchange.net/api/v1/args?nasid=${NASID}&vlan=004&loginurl=https%3A%2F%2Fsecure.opennetworkexchange.net&mac=28%3AD0%3AEA%3A73%3A30%3A4D' \
  -H 'Accept: */*' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json' \
  -H 'DNT: 1' \
  -H 'Origin: https://cap.aws.opennetworkexchange.net' \
  -H 'Referer: https://cap.aws.opennetworkexchange.net/' \
  -H 'User-Agent: Mozilla/5.0' \

echo $'\n'

curl 'https://bap.aws.opennetworkexchange.net/api/v2/auth/portalmetrics' \
  -H 'Accept: */*' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/json' \
  -H 'DNT: 1' \
  -H 'Origin: https://cap.aws.opennetworkexchange.net' \
  -H 'Referer: https://cap.aws.opennetworkexchange.net/' \
  -H 'User-Agent: Mozilla/5.0' \
  --data-raw '{"metricKey": $(Me) ,"portalLoadTimeMs":-1,"portalErrors":[]}' \

echo $'\n'

curl 'https://bap.aws.opennetworkexchange.net/api/v1/auth/ac' \
  -H 'Accept: */*' \
  -H 'Cache-Control: no-cache' \
  -H 'Connection: keep-alive' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'DNT: 1' \
  -H 'Origin: https://cap.aws.opennetworkexchange.net' \
  -H 'Pragma: no-cache' \
  -H 'Referer: https://cap.aws.opennetworkexchange.net/' \
  -H 'Sec-Fetch-Dest: empty' \
  -H 'Sec-Fetch-Mode: cors' \
  -H 'Sec-Fetch-Site: same-site' \
  -H 'User-Agent: Mozilla/5.0'  \
  --data-raw 'accode=&nasid=${NASID}&vlan=${Vlan}&loginurl=https%3A%2F%2Fsecure.opennetworkexchange.net&mac=${Macaddress}'

echo $'\n'

curl "http://secure.opennetworkexchange.net/login?username=${Macaddress}&password=${Macaddress}&dst=http://www.msftconnecttest.com/redirect"

echo $'\n'


echo 