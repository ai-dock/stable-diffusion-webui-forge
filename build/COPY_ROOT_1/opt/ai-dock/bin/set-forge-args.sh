#!/bin/bash

echo "$@" > /etc/forge_args.conf
supervisorctl restart forge