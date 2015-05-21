Simple setup to test ansible and its fitness for a specific project.

Intoduces two machines `ansibleserver`, `ansibleclient` and various playbooks for
copying files or installing nginx.

Each operation is performed various times under changing network conditions.

# Usage
 * `vagrant up`
 * Connect on server `vagrant ssh ansibleserver`
 * Connect **once** to client `ssh ansibleclient`
 * Run Playbooks manually e.g.  `ansible-playbook -vvvv -s /vagrant/nginx.yml -i /vagrant/host`
 * Run all predefined tests `sudo ./test-bandwidth-copy.sh && sudo ./test-bandwidth.sh && sudo ./test-packageloss-copy.sh && sudo ./test-packageloss.sh`


 Tests are better run using the VMs gui.
