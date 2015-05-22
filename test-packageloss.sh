#!/bin/bash
#cat /dev/null > ansible-packageloss.txt
TIME=/usr/bin/time

function measure() {
  echo "$1 package loss" >> ansible-packageloss.txt
  tc qdisc add dev eth1 root netem loss $1%

  for i in {1..5}
  do
    su vagrant -c "($TIME -f \"%e\" ansible-playbook -T 180 -s /vagrant/nginx.yml -i /vagrant/host)" 2>> ansible-packageloss.txt
    sleep 5
  done

  tc qdisc del dev eth1 root netem loss $1%
}



for i in {30..40..5}
  do
    measure $i
  done
