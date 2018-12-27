#Do the following to one of the masters. 
 
 ssh-keygen -t rsa
 
 chmod 700 .ssh; chmod 640 .ssh/authorized_keys
 
 setenforce 0
 sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

 firewall-cmd --permanent --add-port=10250/tcp
 firewall-cmd --permanent --add-port=10255/tcp
 firewall-cmd --permanent --add-port=30000-32767/tcp
 firewall-cmd --permanent --add-port=6783/tcp
 firewall-cmd  --reload
 echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables
 sysctl -w net.ipv4.ip_forward=1 

 sudo yum install epel-release  # only needed on 1 master
 sudo yum install ansible       # only needed on 1 master
 
 easy_install pip
 pip2 install jinja2 --upgrade
 
 sudo yum install python36 –y
 
 ssh-keygen -t rsa
 
 git clone https://github.com/kubernetes-incubator/kubespray.git
 cd kubespray
 sudo pip install -r requirements.txt
 
# might have to intall argparse and requirements manually.
 
 declare -a IPS=(YOUR LIST OF IPS SEPERATED BY A SPACE)
 CONFIG_FILE=inventory/mycluster/hosts.ini python36 contrib/inventory_builder/inventory.py ${IPS[@]}

# or just vim inventory/mycluster/hosts.ini

# Choose network plugin (cilium, calico, contiv, weave or flannel)
# Can also be set to 'cloud', which lets the cloud provider setup appropriate routing
 kube_network_plugin: weave
 
 vim inventory/mycluster/group_vars/all.yml
# The read-only port for the Kubelet to serve on with no authentication/authorization. Uncomment to enable.
 kube_read_only_port: 10255
 
 ansible-playbook -i inventory/mycluster/hosts.ini cluster.yml
 
 kubectl get nodes
 
 ansible-playbook -i inventory/mycluster/hosts.ini remove-node.yml
 ansible-playbook -i inventory/mycluster/hosts.ini reset.yml
