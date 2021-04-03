#!/bin/sh

#
# Download current trunck of kBuild (releases are pretty old).
#
svn co https://svn.netlabs.org/repos/kbuild/trunk/

#
# Apply patches.
#
cp -R patches/* trunk

#
# Install missing dependencies.
#
brew update
brew install autoconf automake

#
# Configure the kBuild environment.
#
pushd trunk
kBuild/env.sh --full --debug-script

#
# Port and bootstrap kmk.
#
pushd src/kmk
autoreconf -i
if [ -d obj ]
then cd obj
else mkdir obj && cd obj
fi
../configure
make
popd
popd # trunk
