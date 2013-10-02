#!/bin/sh

DIR="$HOME/.workstation"

# update installation
$DIR/install.sh

# run stuff
$DIR/after-login.sh

touch $DIR/updated
