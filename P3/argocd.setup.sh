k3d cluster delete ArgoCD
k3d cluster create -c ArgocdCluster.yml

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl patch configmap argocd-cmd-params-cm -n argocd --patch-file argocd-cmd-params-cm.yml

until [ "$(kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o jsonpath='{.items[0].status.phase}')" = "Running" ]; do
  echo "Waiting for argocd-server to be Running..."
  sleep 2
done

kubectl apply -f ingress_argocd.yml
argocd admin initial-password -n argocd
