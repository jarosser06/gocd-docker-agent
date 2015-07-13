FROM jarosser06/gocd-agent
MAINTAINER Jim Rosser <jarosser06@gmail.com>

RUN yum install -y git subversion mercurial make gcc

ENV GOLANG_VERSION 1.4.2

RUN curl -sSL https://golang.org/dl/go${GOLANG_VERSION}.src.tar.gz | tar -v -C /usr/src -xz
RUN cd /usr/src/go/src && ./make.bash --no-clean 2>&1

ENV PATH /usr/src/go/bin:$PATH

RUN mkdir -p /go/src /go/bin && chmod -R 777 /go
ENV GOPATH /go
ENV PATH /go/bin:$PATH
WORKDIR /go

RUN go get github.com/tools/godep
CMD /usr/local/bin/agent_config.sh && /usr/share/go-agent/agent.sh && tail -f /var/log/go-agent/*.log
