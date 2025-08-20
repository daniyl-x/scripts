#!/bin/sh

eval "$(SSH_AGENT_PID="$1" ssh-agent -k)"

