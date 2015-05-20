#!/bin/bash
cat /dev/null > ansible-bandwdith-filecopy.txt
TIME=/usr/bin/time

function measure() {
  echo "$1 bandwidth" >> ansible-bandwdith-filecopy.txt
  tc qdisc add dev eth1 handle 1: root htb default 11
  tc class add dev eth1 parent 1: classid 1:1 htb rate $1kbps
  tc class add dev eth1 parent 1:1 classid 1:11 htb rate $1kbps


  for i in {1..5}
  do
    su vagrant -c "( $TIME -f \"%e\" ansible-playbook -T 180 -s /vagrant/copy.yml -i /vagrant/host)" 2>> ansible-bandwdith-filecopy.txt
    su vagrant -c "ansible-playbook -T 180 -s /vagrant/delete.yml -i /vagrant/host"
    sleep 5
  done

  tc qdisc del dev eth1 root
}


#for i in 102400 24576 3072 2048 1024 250 40 20
for i in 2048 1024 250 40 20
  do
    measure $i
  done
