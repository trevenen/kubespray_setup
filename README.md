# kubespray_setup
Script to set up Kubernetes in Multi-Master HA Cluster for Enterprise Production Enviroments. 

While deploying K8s in Enterprise Production Environments the master node becomes a single point of failure. 
To remove this SPF HA of master nodes is architected into the plan.


Set up all systems to use use Kubespray. https://github.com/kubernetes-incubator/kubespray, to do this set up passwordless logins between all computers, update firewalls, ansible commands are only for one of the masters, this is the main master. It is possible to do it from a secure ansible box as well. 

