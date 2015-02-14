FROM cloudopting/cobase
MAINTAINER Ciprian Pavel "ciprian.pavel@teamnet.ro"


ADD init.pp /etc/puppet/manifests/
ADD conf.pp /etc/puppet/manifests/
ADD mysql.pp /etc/puppet/manifests/



# EXECUTE PUPPET STANDALONE
RUN puppet module install puppet module install puppetlabs-mysql
#RUN puppet apply -e "class { 'apache':mpm_module => 'prefork'} apache::vhost { 'first.example.com':docroot => '/var/www/first.example.com' } class {'::apache::mod::php': }" --verbose --detailed-exitcodes || [ $? -eq 2 ]
RUN puppet apply /etc/puppet/manifests/init.pp

# OPEN UP PORT
#EXPOSE 80

# START APACHE
#ENTRYPOINT [ "/usr/sbin/apache2" ]
#CMD [ "-D", "FOREGROUND" ]