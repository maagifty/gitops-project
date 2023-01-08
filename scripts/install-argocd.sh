#!/bin/bash

# Add the Argo CD repository
helm repo add argo https://github.com/argoproj/argo-cd

# Update the repository cache
helm repo update

# Install Argo CD
helm install argocd argo/argocd --create-namespace \
  --set server.ingress.tls.enabled=true \
  --set server.ingress.tls.secretName=argocd-server-tls \
  --set server.ingress.hosts[0].host=argocd.example.com \
  --set server.ingress.hosts[0].paths[0]=/ \
  --set server.ingress.annotations."kubernetes\.io/ingress\.class"=nginx \
  --set server.ingress.annotations."nginx\.ingress\.kubernetes\.io/ssl-redirect"=true \
  --set server.ingress.annotations."nginx\.ingress\.kubernetes\.io/force-ssl-redirect"=true \
  --set server.ingress.annotations."nginx\.ingress\.kubernetes\.io/backend-protocol"=HTTPS