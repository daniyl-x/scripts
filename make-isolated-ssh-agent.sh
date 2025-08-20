#!/bin/sh


TMP_SSH_AUTH_SOCK_DIR="/tmp/ssh-auth-sock-isolated"
if [[ ! -d "$TMP_SSH_AUTH_SOCK_DIR" ]]; then
    mkdir "$TMP_SSH_AUTH_SOCK_DIR"
    chmod 700 "$TMP_SSH_AUTH_SOCK_DIR"
fi

eval "$(ssh-agent -a "$TMP_SSH_AUTH_SOCK_DIR/$$")" > /dev/null
echo $SSH_AGENT_PID
echo $SSH_AUTH_SOCK

