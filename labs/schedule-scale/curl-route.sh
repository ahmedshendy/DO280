#!/usr/bin/bash

if $(oc get route/scaling -n schedule-scale -o jsonpath='{.spec.host}' &> /dev/null); then
  ROUTE=$(oc get route/scaling -n schedule-scale -o jsonpath='{.spec.host}')
  (for x in {1..9}; do curl -s http://${ROUTE}; done)
else
  echo
  echo "Error: Ensure that the 'scaling' route exists in the 'schedule-scale'"
  echo "       namespace and then try running this script again."
  echo
fi
