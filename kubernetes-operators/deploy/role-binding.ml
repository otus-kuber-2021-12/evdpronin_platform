kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: workshop-operator
subjects:
- kind: ServiceAccount
  name: mysql-operator
  namespace: default
roleRef:
  kind: ClusterRole
  name: mysql-operator
  apiGroup: rbac.authorization.k8s.io