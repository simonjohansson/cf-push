FROM ubuntu

RUN apt-get -y update && apt-get install -y wget

RUN wget https://github.com/mikefarah/yq/releases/download/1.14.0/yq_linux_amd64 -O /bin/yq
RUN wget 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=6.33.1&source=github-rel' -O /tmp/cf.tar

RUN chmod +x /bin/yq
RUN tar -zxvf /tmp/cf.tar -C /bin
RUN yes | cf install-plugin autopilot

ADD cf-push /bin
