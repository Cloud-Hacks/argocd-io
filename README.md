# argocd-io

# Installing latest/stable version of ArgoCD
```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

### Forward Ports
```
kubectl get services -n argocd
kubectl port-forward service/argocd-server -n argocd 8080:443
```

### Get Credentials
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

# Install ArgoCD CLI / Login via CLI
```
brew install argocd
kubectl port-forward svc/argocd-server -n argocd 8080:443
argocd login 127.0.0.1:8080
```

# Creating an Application using ArgoCD CLI:
```
argocd app create webapp-kustom-prod \
--repo https://github.com/cloud-hacks/argocd-io.git \
--path kustom-webapp/overlays/prod --dest-server https://kubernetes.default.svc \
--dest-namespace prod
```

## using ArgoCD CR
```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: mywebapp
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/cloud-hacks/argocd-io.git
    targetRevision: HEAD
    path: helm-webapp
  destination:
    server: https://kubernetes.default.svc
    namespace: myapp
```

# Command Cheat sheet
```
argocd app create #Create a new Argo CD application.
argocd app list #List all applications in Argo CD.
argocd app logs <appname> #Get the application’s log output.
argocd app get <appname> #Get information about an Argo CD application.
argocd app diff <appname> #Compare the application’s configuration to its source repository.
argocd app sync <appname> #Synchronize the application with its source repository.
argocd app history <appname> #Get information about an Argo CD application.
argocd app rollback <appname> #Rollback to a previous version
argocd app set <appname> #Set the application’s configuration.
argocd app delete <appname> #Delete an Argo CD application.
```

# Control Plane

Control Plane repository defines the desired state of shared infrastructure components and enables self-service onboarding process for the application developer teams.

Repository contains the following directories:

* **argocd** - directory contains Argo CD instance configuration. The configuration includes RBAC settings and infrastructure application definitions.
* **clusters** - directory contains adminstrator level cluster configurations.
