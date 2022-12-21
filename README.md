# install package 
bash install.sh and check file

# disable_swappines
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

# run ansible 01-initial.yml
ansible-playbook -i hosts 01-initial.yml
# run ansible 02-dependencies.yml
ansible-playbook -i hosts 02-dependencies.yml

# init network
kubeadm init --pod-network-cidr=10.244.0.0/16 

# run ansible 03-master.yml
ansible-playbook -i hosts 03-master.yml


