#!/usr/bin/env bats

@test "rabbitmq is installed and is in the PATH" {
  command -v rabbitmqctl
}

@test "should have rabbitmq running" {
  [ "$(ps aux | grep rabbitmq_server | grep -v grep)" ]
}

@test "rabbitmq should be listening for connections" {
  [ "$(netstat -plant | grep beam)" ]
}

@test "rabbitmq should be listening for connections" {
  [ "$(netstat -an |grep 0.0.0.0:5672)" ]
}

@test "should have an erlang cookie" {
  [ -e "/var/lib/rabbitmq/.erlang.cookie" ]
}

@test "should have an rabbitmq config file" {
  [ -e "/etc/rabbitmq/rabbitmq.config" ]
}
