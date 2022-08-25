# mysql-router deployment with Kubernetes
. mysql-router docker image is used for routing with 6446 load balancer service to MySQL Router
. Please check the corresponding entry (HOST, USER, PASSWORD... accordingly in the myrouter.yaml

1. Creating namespace 'mysql-router'

```
kubectl create ns mysql-router
```

2. Make change to the myexternal.yaml file and update the ip address for the external-mysql-3310 endpoint

3. Deploy the mysql-router deployment
```
kubectl apply -f myrouter.yaml
```

4. Check the deployment running
```
kubectl get deployment -n mysql-router
kubectl get pod -n mysql-router
```

---
The following is to lookup the external IP address for MySQL Service.  
Public IP for data service is not secured.  This serves a simple demonstration only.

```
kubectl get svc -n mysql-router
```

---
To access to the pod and check.  The bootstrap process retrieves server list to /tmp/mysqlrouter/data/state.json.   

```
kubectl exec -it deployment mysql-router -n mysql-router bash -c "cat /tmp/mysqlrouter/data/state.json"
```

On the MySQL Server side, make sure the report-host parameter for the nodes can be lookup within the Kubernetes environment.   The state.json should contain the hostname from the report-host for the nodes.   Networking with access from kubernets into the nodes must be opened for security pass-thru.

