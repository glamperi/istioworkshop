#!/bin/bash

export INGRESS_GATEWAY=$(oc get route -n istio-system istio-ingressgateway -o 'jsonpath={.spec.host}')

function curl_gateway(){
  j=0
  while [ $j -lt 50 ]; do
    curl http://${INGRESS_GATEWAY}/
    j=$[$j+1]
  done
}

i=0
while [ $i -lt 20 ]; do
 curl_gateway &
 i=$[$i+1]
done
