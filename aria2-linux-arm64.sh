#!/bin/bash

set -e

SCRIPT_DIR=$(dirname $(readlink -f $0))
HOST="aarch64-linux-gnu"
OPENSSL_ARCH="linux-aarch64"
BUILD_DIR="$HOME/aria2"
ARIA2_CODE_DIR="$BUILD_DIR/aria2"
OUTPUT_DIR="$HOME/output"
PREFIX="$BUILD_DIR/aria2-cross-build-libs-arm64"
ARIA2_PREFIX="$HOME/aria2-local"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export LD_LIBRARY_PATH="$PREFIX/lib"
export CC="$HOST-gcc"
export CXX="$HOST-g++"
export STRIP="$HOST-strip"
export RANLIB="$HOST-ranlib"
export AR="$HOST-ar"
export LD="$HOST-ld"

source $SCRIPT_DIR/dependences
source $SCRIPT_DIR/snippet/cross-build
source $SCRIPT_DIR/snippet/aria2-utils

apt update
apt -y install git curl ca-certificates build-essential pkgconf gcc-$HOST g++-$HOST \
    libxml2-dev libcppunit-dev autoconf automake autotools-dev autopoint libtool

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
