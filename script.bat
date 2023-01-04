echo "Criando as imagens"

docker build -t danitakeshi/projeto-backend:1.0 backend/.
docker build -t danitakeshi/projeto-database:1.0 database/.

echo "Realizando Push das imagens"

docker push danitakeshi/projeto-backend:1.0
docker push danitakeshi/projeto-database:1.0

echo "Criando Servicos no cluster Kubernetes"

kubectl apply -f ./services.yml

echo "Criando os Deployments"

kubectl apply -f ./deployment.yml