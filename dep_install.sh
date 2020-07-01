echo "install llvm-4.0 and clang-4.0"

sudo apt-get update
sudo apt-get install clang-4.0 llvm-4.0
sudo apt-get install cmake
source wllvm_install.sh # install wllvm
sudo apt-get install libssl-dev # mysql pre-req