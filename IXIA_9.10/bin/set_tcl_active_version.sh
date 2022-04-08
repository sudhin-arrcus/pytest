#!/bin/bash

set -e

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    echo "Usage: ./set_tcl_active_version.sh version"
    exit 1
fi

version="$1"

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -f $DIR/ixtcl$version*[0-9] ] || [ ! -f $DIR/ixtcl$version*-native ] || [ ! -f $DIR/ixwish$version*[0-9] ] || [ ! -f $DIR/ixwish$version*-native ]; then
    echo "TCL $version not found!"
    exit 1
fi

(cd $DIR && ln -nfs $DIR/ixtcl$version*[0-9] ixtcl)
(cd $DIR && ln -nfs $DIR/ixtcl$version*-native ixtcl-native)
(cd $DIR && ln -nfs $DIR/ixwish$version*[0-9] ixwish)
(cd $DIR && ln -nfs $DIR/ixwish$version*-native ixwish-native)

echo "Successfully changed active TCL version to $version."
