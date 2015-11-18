#!/bin/bash

usage() {
    echo "Usage: $0 role_and_db_name"
}

if [ $# -ne 1 ] ; then
    usage
    exit 1
fi

sudo -u postgres createuser --interactive -P $1
sudo -u postgres createdb $1
