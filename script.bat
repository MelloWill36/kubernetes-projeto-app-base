echo "Criando as Imagens...."

docker build -t williammello/projeto-kubernetes:1.0 backend/.
docker build -t williammello/projeto-database:1.0 database/.

echo "Realizando o push das imanges...."

docker push williammello/projeto-backend:1.0
docker push williammello/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes...."

kubectl.exe apply -f ./services.yml

echo "Realizando os deployments..."

kubectl.exe apply -f ./deployment.yml