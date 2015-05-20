#!/bin/bash
cat /dev/null > ansible-packageloss-filecopy.txt
TIME=/usr/bin/time

function measure() {
  echo "$1 package loss" >> ansible-packageloss-filecopy.txt
  tc qdisc add dev eth1 root netem loss $1%

  for i in {1..5}
  do
    su vagrant -c "($TIME -f \"%e\" ansible-playbook -T 180 -s /vagrant/copy.yml -i /vagrant/host)" 2>> ansible-packageloss-filecopy.txt
    su vagrant -c "ansible-playbook -T 180 -s /vagrant/delete.yml -i /vagrant/host"
    sleep 5
  done

  tc qdisc del dev eth1 root netem loss $1%
}



for i in {0..30..5}
  do
    measure $i
  done
