echo "Setup wllvm environemnt"
source wllvm.env
# Preconfiguration setup. The below steps are commented out as they can be later run when installing. Building in no way require these steps.

# groupadd mysql
# useradd -r -g mysql -s /bin/false mysql

cd mysql-5.7-5.7.29
mkdir bld
cd bld

# installs boost for the first time
CC=wllvm CXX=wllvm++ cmake .. -DDOWNLOAD_BOOST=ON -DWITH_BOOST=$HOME/my_boost

# Can add -jX flag where X is the number of processors eg. make -j4  
make 

# You can also only build mysqld using the following instead building everything using make:
# CC=wllvm CXX=wllvm++ cmake --build ../  --target sqld


# Go back to original directory
cd ../../

# Installation can be done by running the following command in the "bld" directory

# cd mysql-5.7-5.7.29/bld
# make install
