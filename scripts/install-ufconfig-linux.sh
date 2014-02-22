#!/bin/bash

# scripts/install-ufconfig-linux.sh
# This file is part of Psopt Installer.
#
# Psopt Installer is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# Psopt Installer is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Psopt Installer.  If not, see
# <http://www.gnu.org/licenses/>.

psoptInstallerDownload UFconfig-3.6.1.tar.gz http://www.cise.ufl.edu/research/sparse/SuiteSparse_config/UFconfig-3.6.1.tar.gz

cd .packages
if [ ! -d UFconfig ]; then
    tar xzvf ../.download/UFconfig-3.6.1.tar.gz
    cd UFconfig
    sed -i -n 'H;${x;s#/usr/local#'"$PSOPT_BUILD_DIR"'/.target#g;p;}' UFconfig.mk
    make
    cd ..
fi
cd UFconfig
make install
cd ../..