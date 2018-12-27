# kubespray_setup
Script to set up Kubernetes in Multi-Master HA Cluster for Enterprise Production Enviroments. 

While deploying K8s in Enterprise Production Environments the master node becomes a single point of failure. 
To remove this SPF HA of master nodes is architected into the plan.


Set up all systems to use use Kubespray. https://github.com/kubernetes-incubator/kubespray

There are a couple steps to do this:
1. Set up passwordless logins between all computers. https://github.com/trevenen/ssh-its-easy
2. Update firewalls. Ansible before Ansible lol...
3. Ansible deps. 
    Most of the commands are only for one of the masters. It is possible to do it from a secure ansible box as well. 

