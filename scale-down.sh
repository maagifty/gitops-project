#!/bin/bash


deployment="$(kubectl get deploy | grep -v 'NAME' | awk '{print $1}')"

for deploy in ${deployment[@]};
do 
kubectl scale deploy $deploy --replicas=1

done


#numbers=(1 2 3 4 5 6)
#
#for number in ${numbers[@]};
#do
#   action
#done