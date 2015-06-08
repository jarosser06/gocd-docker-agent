FROM centos
MAINTAINER Jim Rosser <jarosser06@gmail.com>

ENV AGENT_VER 15.1.0-1863
ENV GO_SERVER 127.0.0.1
ENV GO_SERVER_PORT 8153

RUN yum install -y java-1.7.0-openjdk-headless git

RUN cd /tmp && curl -L http://download.go.cd/gocd-rpm/go-agent-${AGENT_VER}.noarch.rpm > /tmp/go-agent-${AGENT_VER}.noarch.rpm
RUN yum install -y /tmp/go-agent-${AGENT_VER}.noarch.rpm
RUN mkdir -p /var/log/go-agent

ADD agent_config.sh /usr/local/bin/agent_config.sh
RUN chmod +x /usr/local/bin/agent_config.sh
CMD /usr/local/bin/agent_config.sh && /usr/share/go-agent/agent.sh && tail -f /var/log/go-agent/*.log
