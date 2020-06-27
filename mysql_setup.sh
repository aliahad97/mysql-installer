echo "Setup wllvm environemnt"
source wllvm.env
# Preconfiguration setup
groupadd mysql
useradd -r -g mysql -s /bin/false mysql

cd mysql-installer/mysql-5.7-5.7.29
mkdir bld
cd bld

CC=wllvm CXX=wllvm++ cmake --build ../  --target sqld

make 
# make install
