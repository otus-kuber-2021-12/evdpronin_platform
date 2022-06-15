<details><summary># Выполнено ДЗ № 9</summary>
 - [x] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 
## Как запустить проект:

## Как проверить работоспособность:

## PR checklist:
 - [x] Выставлен label с темой домашнего задания
</details>
<details><summary># Выполнено ДЗ № 8</summary>
 - [x] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 1. Равернут, с помощью helm prometheus, grafana, node-exporter.
 2. Применены манифесты для развёртывания nginx (3 реплики).
 3. Проверена с помощью  kubectl port-forward работа prometheus на порту 9090:9090, grafana на порту 8000:80 и nginx по адресу 127.0.0.1:8080/basic_status (8080:8080).
## Как запустить проект:
 kubectl create ns monitoring
 helm install prometheus-stack prometheus-community/kube-prometheus-stack -n monitoring
 kubectl apply -f '*.yaml'
## Как проверить работоспособность:
 kubectl get all -n monitoring 
 kubectl get all ##nginx развёрнут в default
## PR checklist:
 - [x] Выставлен label с темой домашнего задания
</details>
<details><summary># Выполнено ДЗ № 7</summary>

 - [x] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - Запущен кластер на minikube
 - Развернуты CustomResource и CustomResourceDefinition для mysql оператора
 - Проверена работа контроллера путём удаления mysql-instance. И обратном деплое. Данные сохранились:
 
## Как запустить проект:
 kubectl apply -f cr.yml
## Как проверить работоспособность:
 mysql: [Warning] Using a password on the command line interface can be insecure.
+----+-------------+
| id | name        |
+----+-------------+
|  1 | some data   |
|  2 | some data-2 |
+----+-------------+
NAME                         COMPLETIONS   DURATION   AGE
backup-mysql-instance-job    1/1           3s         19m
restore-mysql-instance-job   1/1           54s        18m

## PR checklist:
 - [x] Выставлен label с темой домашнего задания
</details>
<details><summary># Выполнено ДЗ № 6</summary>
# Выполнено ДЗ № 6

 - [x] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - Развёрнут кластер на gcloud (в последствии работа была продолжена на yandex cloud)
 - Выполнена работа по разворачиванию cert-manager, chartmuseum с помощью helm.
 - Развернул harbor с автовыдачей сертификата через letsencrypt
 - Развернут microservice-demo c помощью своего helm чарта
 - Проведена работа с kubecfg
 - Проведена работа с Kustomize, развёрнуты микросервисы в окружении prod и test.

## Как запустить проект:
 - /kubernetes-templating/repo.sh
 - kubectl apply -k kubernetes-templating/kustomize/overrides/<Название окружения>/

## Как проверить работоспособность:
 - https://charmuseum.51.250.69.255.nip.io
 - https://harbor.51.250.69.255.nip.io
 - https://shop.51.250.69.255.nip.io
 

## PR checklist:
 - [x] Выставлен label с темой домашнего задания
</details>
<details><summary># Выполнено ДЗ № 5</summary>

 - [x] Основное ДЗ
 - [x] Задание со *

## В процессе сделано:
 - Добавлены проверки при создании Pod web (readiness и livenessProbe)
 - **Вопрос для самопроверки:** 
 1. ps aux | grep my_web_server_process - в любом случае grep вернёт информацию, в которой будет содержаться вывод самого процесса grep. 
 2. Имеет смысл, если убрать из вывода запроса grep _(ps aux | grep my_web_server_process | grep -v grep)_ и в таком случае будет проводиться простая проверка запущен ли процесс или нет. (либо пустой результат, либо выводится процесс)
 - Опробованы разные варианты деплоя со значения maxSurge и maxUnvailable (со значением 0, 0 не работает)
 - Создан service ClusterIP с включением IPVS
 - Установлен и настроен MetallB (https://metallb.universe.tf/)
 - * Сделан сервис LoadBalancer, открывающий доступ к coreDNS снаружи кластера.
 - Создан Ingress kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.1/deploy/static/provider/cloud/deploy.yaml
 - Поключил web к Ingress и созданы правила для ingress-proxy. Страничка открывается в http://172.17.255.2/web/index.html
- * С помощью ingress настроил доступ к kubernetes-dashboard по ссылку http://172.17.255.2/dashboard/
- * Реализовал Канареечное развертывание с помощью ingress-nginx. Распределение траффика по заголовку Version: v1 | v2. 

## Как проверить работоспособность:
 - Например, перейти по ссылке http://172.17.255.2/

## PR checklist:
 - [x] Выставлен label с темой домашнего задания
</details>
<details><summary># Выполнено ДЗ № 4</summary>

 - [x] Основное ДЗ
 - [x] Задание со *

## В процессе сделано:
 - Созданы service account bob и dave с указанными ролями.
 - Создан namespace prometheus, service account carol в этом namespace и даны права get, list, watch в отношении Pods всего кластера
 - Создан namespace dev, service account jane в dev с ролью admin и создан service account ken в dev с ролью view. 

## Как запустить проект:
 - kubectl apply -f ./kubernetes-security


## PR checklist:
 - [x] Выставлен label с темой домашнего задания

</details>
<details><summary># Выполнено ДЗ № 3</summary>

 - [x] Основное ДЗ
 - [x] Задание со *

## В процессе сделано:
 - Установлен kind и развёрнут кластер согласно конфигурации kind-config.yaml
 - Запустил и поэксперементировал с Replicaset с помощью манифеста frontend-replicaset.yaml
 - Обновление Replicaset не повлекло обновление запущенных pod, т.к. Replicaset следить за количеством pod, а не их конфигурацией (версией). Только после удаления pod - они развернулись с новой версией.
 - Создал сервис paymentservice, манифест paymentservice-replicaset.yaml и применил манифест paymentservice-deployment.yaml
 - Произвёл обновление deployment сервиса paymentservice
 - * Добавил в манифест paymentservice-deployment-bg.yaml
  strategy:
    rollingUpdate:
      maxSurge: 3
      maxUnavailable: 3 
 - и в paymentservice-deployment-reverse.yaml
   strategy:
    rollingUpdate:
      maxSurge: 0
      maxUnavailable: 1
 - применил манифест с readinessProbe и сымитировал неорректную работу приложения.
 - * Взял в интернете node-exporter-daemonset.yaml и развернул. Применил команду проброса портов kubectl port-forward node-exporter-dj4sp -n monitoring 9100:9100 и проверил curl'ом
 - ** добавил в манифест 
  tolerations:
      - operator: Exists
      что даёт допуск на разворачивание pod на control-plane 

## PR checklist:
 - [x] Выставлен label с темой домашнего задания
</details>
<details><summary># Выполнено ДЗ № 2</summary>
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
<details><summary># Выполнено ДЗ № 1</summary>
Выполнены работы по настройке git и отправке файлов в репозиторий. Дождался автопроверки после pull request.
</details>
