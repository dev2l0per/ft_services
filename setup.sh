minikube start

echo "metallb설치"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl create -f ./srcs/yaml/metalLB.yaml

sleep 10

# echo "local image 사용가능하게 하기"
eval $(minikube docker-env)

cd ./srcs/containers/
echo "mysql image build"
docker build -t juyang_mysql ./mysql > /dev/null
echo "wordpress image build"
docker build -t juyang_wordpress ./wordpress > /dev/null
echo "phpmyadmin image build"
docker build -t juyang_pma ./phpmyadmin > /dev/null
echo "nginx image build"
docker build -t juyang_nginx ./nginx > /dev/null
echo "ftps image build"
docker build -t juyang_ftps ./ftps > /dev/null
echo "telegraf image build"
docker build -t juyang_telegraf ./telegraf > /dev/null
echo "influxdb image build"
docker build -t juyang_influxdb ./influxdb > /dev/null
echo "grafana image build"
docker build -t juyang_grafana ./grafana > /dev/null
echo "이미지 생성 완료"

cd ../yaml/
echo "mysql deployment 생성"
kubectl apply -f mysql.yaml > /dev/null
echo "wordpress deployment 생성"
kubectl apply -f wordpress.yaml > /dev/null
echo "phpmyadmin deployment 생성"
kubectl apply -f phpmyadmin.yaml > /dev/null
echo "nginx deployment 생성"
kubectl apply -f nginx.yaml > /dev/null
echo "ftps deployment 생성"
kubectl apply -f ftps.yaml > /dev/null
echo "influxdb deployment 생성"
kubectl apply -f influxdb.yaml > /dev/null
echo "telegraf deployment 생성"
kubectl apply -f telegraf.yaml > /dev/null
echo "grafana deployment 생성"
kubectl apply -f grafana.yaml > /dev/null
echo "모든 deployment 완료"
sleep 3
echo "minikube dashboard 실행"
minikube addons enable metrics-server
minikube dashboard
