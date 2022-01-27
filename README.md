# Выполнено ДЗ № 2

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
