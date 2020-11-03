FROM alpine:latest

# this sed command adds alpine edge repository
RUN sed -i 's/http\:\/\/alpine.gliderlabs.com/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories \
  && apk --no-cache --update add ansible git \
  && git clone https://github.com/bearddan2000/ansible-lib-playbooks.git \
  && chmod -R +x ansible-lib-playbooks \
  && ansible-playbook ansible-lib-playbooks/apps/firefox.yml

RUN adduser -S developer

ENV HOME /home/developer

USER developer

CMD /usr/bin/firefox
