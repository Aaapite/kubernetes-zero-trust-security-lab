#!/usr/bin/env bash

set -u

kubectl delete -f manifests/06-compliant-pod.yaml --ignore-not-found
kubectl delete -f manifests/02-egress-policies.yaml --ignore-not-found
kubectl delete -f manifests/01-temporary-baseline-ingress.yaml --ignore-not-found
kubectl delete -f manifests/00-api-service-aliases.yaml --ignore-not-found

kubectl label namespace tenant-a \
  pod-security.kubernetes.io/enforce- \
  pod-security.kubernetes.io/enforce-version- \
  pod-security.kubernetes.io/warn- \
  --overwrite

echo "Zero Trust addendum resources removed. Original Lab 2 resources remain."

