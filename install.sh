#!/bin/sh
set -e
set -u

# display everything on stderr.
#exec 1>&2

# do a clean install
[ -e "$HOME/.workstation" ] && rm -rf "$HOME/.workstation"

TARBALL_URL="https://github.com/learnjin/setup-workstation/archive/master.tar.gz"

INSTALL_TMPDIR="$HOME/.workstation-tmp"
rm -rf "$INSTALL_TMPDIR"
mkdir "$INSTALL_TMPDIR"
echo "Downloading workstation setup"
curl --progress-bar --fail -L "$TARBALL_URL" | tar --strip 1 -xzf - -C "$INSTALL_TMPDIR"
# bomb out if it didn't work, eg no net
test -x "${INSTALL_TMPDIR}/.workstation/after-login.sh"
mv "${INSTALL_TMPDIR}/.workstation" "$HOME"
ln -sf "$HOME/.workstation/autostart.desktop" "$HOME/.config/autostart/workstation.desktop" 
# install autostart

rm -rf "${INSTALL_TMPDIR}"
# just double-checking :)
test -x "$HOME/.workstation/after-login.sh"


echo
echo "Workstation has been setup in your home directory (~/.workstation)."





