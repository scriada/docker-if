#! /bin/bash

mkdir /tmp/glulxe
pushd /tmp/glulxe

curl -o glkterm.zip -L https://github.com/erkyrath/glkterm/archive/glkterm-1.0.4.zip
unzip glkterm.zip && rm glkterm.zip && mv glkterm-glkterm-1.0.4 glkterm
pushd glkterm; make; popd

curl -o glulxe.zip -L https://github.com/erkyrath/glulxe/archive/glulxe-0.5.4.zip
unzip glulxe.zip && rm glulxe.zip && mv glulxe-glulxe-0.5.4 glulxe
pushd glulxe
patch -p1 < /tmp/makefile.patch
make
cp glulxe /usr/bin/
popd

popd
