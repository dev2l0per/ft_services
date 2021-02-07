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
echo -e "\033[47m\033[32m mysql image build \033[m"
docker build -t juyang_mysql ./mysql > /dev/null
echo -e "\033[47m\033[32m wordpress image build \033[m"
docker build -t juyang_wordpress ./wordpress > /dev/null
echo -e "\033[47m\033[32m phpmyadmin image build \033[m"
docker build -t juyang_pma ./phpmyadmin > /dev/null
echo -e "\033[47m\033[32m nginx image build \033[m"
docker build -t juyang_nginx ./nginx > /dev/null
echo -e "\033[47m\033[32m ftps image build \033[m"
docker build -t juyang_ftps ./ftps > /dev/null
echo -e "\033[47m\033[32m telegraf image build \033[m"
docker build -t juyang_telegraf ./telegraf > /dev/null
echo -e "\033[47m\033[32m influxdb image build \033[m"
docker build -t juyang_influxdb ./influxdb > /dev/null
echo -e "\033[47m\033[32m grafana image build \033[m"
docker build -t juyang_grafana ./grafana > /dev/null
echo -e "\033[47m\033[32m 이미지 생성 완료 \033[m"

cd ../yaml/
echo -e "\033[47m\033[32m mysql deployment 생성 \033[m"
kubectl apply -f mysql.yaml > /dev/null
echo -e "\033[47m\033[32m wordpress deployment 생성 \033[m"
kubectl apply -f wordpress.yaml > /dev/null
echo -e "\033[47m\033[32m phpmyadmin deployment 생성 \033[m"
kubectl apply -f phpmyadmin.yaml > /dev/null
echo -e "\033[47m\033[32m nginx deployment 생성 \033[m"
kubectl apply -f nginx.yaml > /dev/null
echo -e "\033[47m\033[32m ftps deployment 생성 \033[m"
kubectl apply -f ftps.yaml > /dev/null
echo -e "\033[47m\033[32m influxdb deployment 생성 \033[m"
kubectl apply -f influxdb.yaml > /dev/null
echo -e "\033[47m\033[32m telegraf deployment 생성 \033[m"
kubectl apply -f telegraf.yaml > /dev/null
echo -e "\033[47m\033[32m grafana deployment 생성 \033[m"
kubectl apply -f grafana.yaml > /dev/null
echo -e "\033[47m\033[32m 모든 deployment 완료 \033[m"
sleep 3
echo "minikube dashboard 실행"
minikube addons enable metrics-server
minikube dashboard
