#!/data/data/com.termux/files/usr/bin/sh
# Get some needed tools. coreutils for mkdir command, gnugp for the signing key, and apt-transport-https to actually connect to the repo
apt-get update
apt-get --assume-yes upgrade
apt-get --assume-yes install coreutils gnupg
# Make the sources.list.d directory
mkdir -p $PREFIX/etc/apt/sources.list.d
# Write the needed source file
if apt-cache policy | grep -q "packages.termux.org\|deb.kcubeterm.me\|termux.mentality.rip\|grimler.se\|termux.librehat.com\|mirrors.tuna.tsinghua.edu.cn\|mirrors.bfsu.edu.cn\|mirrors.ustc.edu.cn\" ; then
echo "deb https://its-pointless.github.io/files/24 termux extras" > $PREFIX/etc/apt/sources.list.d/pointless.list
else
echo "deb https://its-pointless.github.io/files/21 termux extras" > $PREFIX/etc/apt/sources.list.d/pointless.list
fi
# Add signing key from https://its-pointless.github.io/pointless.gpg
if [ -n $(command -v curl) ]; then
curl -sLo $PREFIX/etc/apt/trusted.gpg.d/pointless.gpg --create-dirs https://its-pointless.github.io/pointless.gpg
elif [ -n $(command -v wget) ]; then
wget -qP $PREFIX/etc/apt/trusted.gpg.d https://its-pointless.github.io/pointless.gpg
fi
# Update apt
apt update
