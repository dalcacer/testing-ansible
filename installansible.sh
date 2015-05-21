sudo apt-get update -y
sudo apt-get install -y python-software-properties
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update y
sudo apt-get install -y ansible sshpass python-pip
sudo cp /vagrant/host /etc/ansible/host
sudo pip install python-keyczar
