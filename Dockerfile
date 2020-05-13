FROM centos

RUN yum install -y sudo

RUN sudo yum install -y java-11-openjdk-devel

RUN sudo yum install -y git

RUN sudo yum install -y wget 

RUN sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

RUN sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

RUN yum install -y jenkins

CMD /etc/alternatives/java -Dcom.sun.akuma.Daemon=Daemonized -Djava.awt.headless=true -DJENKINS_HOME=/var/lib/jenkins -jar /usr/lib/jenkins/jenkins.war --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war --daemon --httpPort=8080 --debug=5 handlerCountMax=100 --handlerCountMaxIdle=20

CMD echo "Your one time password is:"

CMD cat /var/lib/jenkins/secrets/initialAdminPassword
