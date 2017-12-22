FROM alpine:3.7

RUN apk update
RUN apk add wget
RUN apk add ca-certificates
RUN update-ca-certificates

RUN wget https://github.com/mikefarah/yq/releases/download/1.14.0/yq_linux_amd64 -O /bin/yq
RUN wget 'https://packages.cloudfoundry.org/stable?release=linux64-binary&version=6.33.1&source=github-rel' -O /tmp/cf.tar
RUN wget https://github.com/contraband/autopilot/releases/download/0.0.4/autopilot-linux -O /tmp/autopilot

RUN chmod +x /bin/yq /tmp/autopilot
RUN tar -zxvf /tmp/cf.tar
RUN mv cf /bin/cf
RUN yes | cf install-plugin /tmp/autopilot

ADD cf-push /opt/src
