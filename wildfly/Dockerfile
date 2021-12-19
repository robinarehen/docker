FROM jboss/wildfly:23.0.1.Final

RUN /opt/jboss/wildfly/bin/add-user.sh adminuser adminpassword --silent

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]