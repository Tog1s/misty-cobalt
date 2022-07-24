# MistyCobalt

## Install

Create rails credential, add secrets if necessary.

```bash
bin/rails credentials:edit
```

Edit lib/tasks/docker.rake, build docker image and push to repository.
```bash
rake docker:build && docker:push
```

Update helm chart value in chart/misty-cobalt. Pull postgresql chart or set your own
```bash
cd chart/misty-cobalt
helm repo add bitnami https://charts.bitnami.com/bitnami
helm pull bitnami/postgresql
```

Setup and apply configmap, secrets for rails env, if necessary

ConfigMap
```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: env-configmap
  namespace: misty-cobalt
data:
  # APPLICATION_HOST: example.com
  # PORT: "3000"
  # RACK_ENV: production
  # RAILS_ENV: production
  # RAILS_LOG_TO_STDOUT: "true"
  # RAILS_SERVE_STATIC_FILES: "true"
  # SECRET_KEY_BASE: "top-secret"
```

Secret
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: env-secrets
  namespace: misty-cobalt
type: Opaque
data:
  DATABASE_HOST: ''
  DATABASE_NAME: ''
  DATABASE_USER: ''
  DATABASE_PASSWORD: ''
```

Install helm chart in kubernetes
```bash
helm instasll misty-cobalt --namespace misty-cobalt chart/misty-cobalt
```