#bash <(curl -s https://raw.githubusercontent.com/thoraxe/istio-lab-summit-2019/master/scripts/curl_customer_token.sh)
export INGRESS_GATEWAY=$(oc get route -n istio-system istio-ingressgateway -o 'jsonpath={.spec.host}')
TOKEN=$(curl https://raw.githubusercontent.com/istio/istio/release-1.1/security/tools/jwt/samples/demo.jwt -s)
while :; do curl --header "Authorization: Bearer $TOKEN" $INGRESS_GATEWAY -s ; done
