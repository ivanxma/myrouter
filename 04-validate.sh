echo "This is to check if there is any connection info with the state.json"
kubectl exec -it deployment/mysql-router -n mysql-router -- bash -c "cat /etc/hosts; cat /tmp/mysqlrouter/data/state.json"
