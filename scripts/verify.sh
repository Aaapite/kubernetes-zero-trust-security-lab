#!/usr/bin/env bash

set -u

echo "=== Lab 2.1 Addendum verification ==="

kubectl -n tenant-a get networkpolicy \
  -o custom-columns=NAME:.metadata.name,TYPES:.spec.policyTypes

kubectl get namespace tenant-a \
  -o jsonpath='{.metadata.labels}' | tr ',' '\n' | grep pod-security

kubectl -n tenant-a get pods

if kubectl -n tenant-a get pod privileged-probe >/dev/null 2>&1; then
  echo "UNEXPECTED: privileged-probe exists"
  exit 1
else
  echo "PASS: privileged-probe does not exist"
fi

