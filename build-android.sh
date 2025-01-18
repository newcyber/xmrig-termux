#!/bin/bash

N=$(echo -en '\033[0m')
RD=$(echo -en '\033[07;31m') # tulisan diberi blok
RED=$(echo -en '\033[00;31m')
GR=$(echo -en '\033[07;32m') # tulisan diberi blok
GRN=$(echo -en '\033[00;32m')
YLW=$(echo -en '\033[00;33m')
BLUE=$(echo -en '\033[00;34m')
MTA=$(echo -en '\033[00;35m')
LMA=$(echo -en '\033[20;36m')
PURP=$(echo -en '\033[00;35m')
CYAN=$(echo -en '\033[00;36m')
LGRAY=$(echo -en '\033[00;38m')
LRD=$(echo -en '\033[07;31m')
LRED=$(echo -en '\033[01;31m')
LGR=$(echo -en '\033[01;32m')
LYL=$(echo -en '\033[01;33m')
LYLO=$(echo -en '\033[07;33m') # tulisan diberi blok
LBL=$(echo -en '\033[01;34m')
LBLU=$(echo -en '\033[07;34m')
LMA=$(echo -en '\033[01;35m')
LPPLE=$(echo -en '\033[01;35m')
LCY=$(echo -en '\033[01;36m')
LCYN=$(echo -en '\033[07;36m')
WHT=$(echo -en '\033[01;37m')

echo "${GR}Berhasil download build${N}"
sleep 3

set -e
echo "${LYLO}Tunggu sebentar${N}"
sleep 2
echo "${LYLO}Kita update dan install library terlebih dahulu${N}"
sleep 3
pkg update && pkg upgrade -y
yes | pkg install git nano build-essential proot cmake automake libtool autoconf
echo "${LYLO}Cloning xmrig${N}"
sleep 5
git clone https://github.com/xmrig/xmrig.git
mkdir build
cd build
# cmake
echo "${LYLO}Proses CMake${N}"
sleep 5
if ! cmake -DWITH_HWLOC=OFF ..; then
    echo "${RD}Error: CMake configuration failed${N}"
    exit 1
else
    cmake -DWITH_HWLOC=OFF ..
fi
# compile
echo "${LYLO}Compiling now${N}"
sleep 5
if ! make; then
    echo "${RD}Error: Compiling failed${N}"
    exit 1
else
    make && echo "${GR}Proses Instalasi selesai${N}"
fi
sleep 3
echo "${LYLO}Proses clone konfigurasi${N}"
echo ""
echo ""
echo ""
sleep 3
cd
wget https://raw.githubusercontent.com/zcdk077/master/start.sh
chmod +x start.sh
wget https://raw.githubusercontent.com/zcdk077/master/config.json
chmod +x config.json
rm -r LICENSE
rm -r README.md
echo "${GR}Berhasil cloning konfigurasi${N}"
