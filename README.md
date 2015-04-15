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
 * Start VM `vagrant up`
 * Connect once via SSH `ssh vagrant@192.168.33.10`
 * Run Playbook `ansible-playbook -s -k -u vagrant nginx.yml`
 * Test [http://192.168.33.10:8080](http://192.168.33.10:8080) or [http://localhost:8080](http://localhost:8080)
