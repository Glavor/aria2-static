#!/bin/bash

set -e

SCRIPT_DIR=$(dirname $(readlink -f $0))
OPENSSL_ARCH="linux-x86_64"
BUILD_DIR="$HOME/aria2"
ARIA2_CODE_DIR="$BUILD_DIR/aria2"
OUTPUT_DIR="$HOME/output"
PREFIX="$BUILD_DIR/aria2-build-libs"
ARIA2_PREFIX="/usr/local"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export LD_LIBRARY_PATH="$PREFIX/lib"
export CC="gcc"
export CXX="g++"
export STRIP="strip"
export RANLIB="ranlib"
export AR="ar"
export LD="ld"

source $SCRIPT_DIR/dependences
source $SCRIPT_DIR/snippet/target-build
source $SCRIPT_DIR/snippet/aria2-utils

apt update
apt -y install git curl ca-certificates build-essential pkgconf \
    libssl-dev libxml2-dev libcppunit-dev autoconf automake autotools-dev autopoint libtool

ZLIB_BUILD
EXPAT_BUILD
C_ARES_BUILD
# OPENSSL_BUILD
LIBRESSL_BUILD
SQLITE3_BUILD
LIBSSH2_BUILD
ARIA2_BUILD
ARIA2_BIN
# ARIA2_PACKAGE
CLEANUP
