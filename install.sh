#!/bin/sh
set -e
set -u

# display everything on stderr.
exec 1>&2

TARBALL_URL="https://github.com/learnjin/setup-workstation/archive/master.tar.gz"

INSTALL_TMPDIR="$HOME/.setup-workstation-tmp"
rm -rf "$INSTALL_TMPDIR"
mkdir "$INSTALL_TMPDIR"
echo "Downloading workstation setup"
curl --progress-bar --fail "$TARBALL_URL" | tar -xzf - -C "$INSTALL_TMPDIR"
# bomb out if it didn't work, eg no net
test -x "${INSTALL_TMPDIR}/workstation/after-login.sh"
mv "${INSTALL_TMPDIR}/.workstation" "$HOME"
rmdir "${INSTALL_TMPDIR}"
# just double-checking :)
test -x "$HOME/.workstation/after-login.sh"

echo
echo "Workstation has been setup in your home directory (~/.workstation)."





