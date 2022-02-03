
<details><summary># Выполнено ДЗ № 8</summary>
</details>
<details><summary># Выполнено ДЗ № 7</summary>
</details>
<details><summary># Выполнено ДЗ № 6</summary>
</details>
<details><summary># Выполнено ДЗ № 5</summary>
</details>
<details><summary># Выполнено ДЗ № 4</summary>
</details>
<details><summary># Выполнено ДЗ № 3</summary>
</details>
<details><summary># Выполнено ДЗ № 2</summary>
</details>
<details><summary># Выполнено ДЗ № 1</summary>
 - [x] Основное ДЗ
 - [x] Задание со *

## В процессе сделано:
1. Установил kubectl по инструкции на Ubuntu server 20.04
2. Установил minikube по инструкции (Docker уже был установлен)
3. Запутил minikube start
4. Проверил kubectl cluster-info
5. Запустил > minikube dashboard 
6. Установил brew и через него k9s > /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   > brew install derailed/k9s/k9s
   > k9s info
   > k9s -c pod
7. Удалил поды и проверил их восстановление 
8. Причины по которым восстановились все pod в ns kube-system:
   core-dns - Deployment следит за количеством pods и пересоздаёт их при удалении.
   kube-proxy - Daemonset, как и Deployment следит за работой pods.
   kube-apiserver, kube-scheduler, etcd - Static pod, за которыми следит systemd служба kubelet.
9. Создан Dockerfile, собран из него контейнер и загружен на hub.docker.com/evdpronin 
10. Написан манифест web-pod.yaml для создания pod из образа, созданного выше.
11. Добавлен init контейнер в web-pod.yaml 
12. Запущен pod и проверен curl -X GET "https://localhost:8000/homework.html"
13. Собран контейнер frontend с Hipster Shop и загружен в hub.docker.com
14. Запущен pod с помощью frontend-pod.yaml и сделано задание под звёздочкой - frontend-pod-healthy.yaml  
## Как запустить проект:
 - minikube start && kubectl apply -f web-pod.yaml && kubectl apply -f frontend-pod-healthy.yaml

## Как проверить работоспособность:
- kubectl port-forward --address 0.0.0.0 pod/web 8000:8000
- Перейти по ссылке http://localhost:8080
- kubectl get pod frontend
- frontend должен находиться в статусе Running

## PR checklist:
 - [x] Выставлен label с темой домашнего задания</details>


