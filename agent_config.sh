#!/bin/bash

sed -i s/127.0.0.1/${GO_SERVER}/ /etc/default/go-agent
sed -i s/8153/${GO_SERVER_PORT}/ /etc/default/go-agent
