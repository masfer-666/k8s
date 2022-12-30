# cat > install.sh << EOF
mkdir -p /opt/k8s/
# update package & upgrade
apt update && apt upgrade -y 

# install package dependencies
apt-get install net-tools git traceroute mtr vim bind9-utils rsync htop wget nmap -y

# ansible
sudo apt-add-repository ppa:ansible/ansible && sudo apt update && sudo apt install ansible -y 

# sshd allow
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config && service sshd restart
# create rsa keys
ssh-keygen -t rsa 
passwd root
ssh-copy-id root@10.2.16.152
ssh-copy-id root@10.2.16.153
ssh-copy-id root@10.2.16.154

