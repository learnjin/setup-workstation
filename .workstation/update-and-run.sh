#!/bin/sh

DIR="$HOME/.workstation"

# update installation
curl https://raw.github.com/learnjin/setup-workstation/master/install.sh | /bin/sh

# run stuff
$DIR/after-login.sh

touch $DIR/updated
