cd ~/work/glibc-2.37/build
make distclean
../configure --prefix=/opt/version/system/glibc/ --disable-werror
../configure --prefix=/opt/version/gcc13/ --disable-werror --enable-languages=c,c++ --disable-multilib