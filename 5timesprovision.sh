#!/bin/bash
(time ansible-playbook -s /vagrant/nginx.yml -i /vagrant/host) 2>> times
echo "\n" >> times
(time ansible-playbook -s /vagrant/nginx.yml -i /vagrant/host) 2>> times
echo "\n" >> times
(time ansible-playbook -s /vagrant/nginx.yml -i /vagrant/host) 2>> times
echo "\n" >> times
(time ansible-playbook -s /vagrant/nginx.yml -i /vagrant/host) 2>> times
echo "\n" >> times
(time ansible-playbook -s /vagrant/nginx.yml -i /vagrant/host) 2>> times
echo "\n" >> times
