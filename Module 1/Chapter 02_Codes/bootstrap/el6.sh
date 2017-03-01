#!/bin/bash

# bootstrap for EL6 distributions
SERVER=git.example.com
LOCATION=/bootstrap
BOOTSTRAP=bootstrap.pp
USER=bootstrap
PASS=cookbook

# install puppet

curl http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs >/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs
yum -y install http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum -y install facter
curl --user $USER:$PASS http://$SERVER/$LOCATION/$BOOTSTRAP >/tmp/$BOOTSTRAP
cd /tmp
puppet apply /tmp/$BOOTSTRAP
puppet apply --modulepath /etc/puppet/cookbook/modules /etc/puppet/cookbook/manifests/site.pp
