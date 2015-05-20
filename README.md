Simple setup to test ansible based on [this tutorial](https://serversforhackers.com/an-ansible-tutorial).


#Contains
* Vagrant
	* 192.168.33.10
	* 192.168.33.10:2222 → VM:22
	* localhost:2222 → VM:22
	* 192.168.33.10:8080 → VM:80
	* localhost:8080 → VM:80
	* SSH - vagrant:vagrant

* Ansible Playbook
	* TASK to install nginx
	* HANDLER to start nginx

# Usage
* Install `ansible`
* Alter `/etc/ansible/host`
	`[vagrant]
 	192.168.33.10`
 * Start VMs `vagrant up`
 * Connect on server `vagrant ssh ansibleserver`
 * Connect on client `vagrant ssh ansibleclient`
 * Run Playbook `ansible-playbook -vvvv -s /vagrant/nginx.yml -i /vagrant/host`
 * Test [http://192.168.33.10:8080](http://192.168.33.10:8080) or [http://localhost:8080](http://localhost:8080)
  * Run Playbook `ansible-playbook -vvvv -s /vagrant/copy.yml -i /vagrant/host`

	* `sudo ./test-bandwidth-copy.sh && sudo ./test-bandwidth.sh && sudo ./test-packageloss-copy.sh && sudo ./test-packageloss.sh`
