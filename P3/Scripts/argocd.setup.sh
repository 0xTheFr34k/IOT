k3d cluster delete ArgoCD
k3d cluster create -c Confs/ArgocdCluster.yml

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl patch configmap argocd-cmd-params-cm -n argocd --patch-file Confs/argocd-cmd-params-cm.yml
kubectl patch configmap argocd-cm -n argocd --patch-file Confs/argocd-cm.yml

until [ "$(kubectl get pods -n argocd -l app.kubernetes.io/name=argocd-server -o jsonpath='{.items[0].status.phase}')" = "Running" ]; do
  echo "Waiting for argocd-server to be Running..."
  sleep 2
done

kubectl apply -f Confs/ingress_argocd.yml

until [ "$(kubectl get statefulset/argocd-application-controller -n argocd -o jsonpath='{.status.readyReplicas}')" = "1" ]; do
  echo "Waiting for argocd Password"
  sleep 2
done

kubectl exec statefulset/argocd-application-controller -n argocd -- argocd admin initial-password | tee secret
kubectl apply -f Confs/applications.yaml
