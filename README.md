# mysql-installer
This is an overview on building mysql from source using wllvm. Building it in this manner can potentially let you generate bitcode of the final executable using `extract-bc` command. Note that this guide does not install mysql where the installation process would just copy files into respective directories. You can start off by cloning this repo first as follows:
```
git clone https://github.com/aliahad97/mysql-installer
```

# Installing pre-reqs
The following script will install `llvm-4.0`, `cllang-4.0`, `cmake` and `wllvm`. It will assume that `pip` is already installed.

```
source dep_instal.sh
```

The script will use the following helper scripts:
- **wllvm_install.sh**: Installs wllvm using pip
- **wllvm.env**: To set wllvm environment

You can skip to just installing wllvm by running the following:
```
source wllvm_install.sh
```


# Making mysql_setup.sh

The following script will preconfigure environment for mysql for after installation and then build it using `cmake`. Note that it will setup the `wllvm` environment within the script using the **wllvm.env** script.

```
source mysql_setup.sh
```

You can alter the following line in script to add flags:
```
CC=wllvm CXX=wllvm++ cmake --build ../  --target sqld
```
Only sqld will be built. You can remove `--target sqld` to make the full build. This is where all flags are added to alter what features you want to make in the final installation.


# Deleting already built
The following script will delete the already built mysql.

```
source delete_build.sh
```

# Extracting bitcode from executable
For executable buillt using `wllvm`, you can use the following command to create a bitcode file.
```
extract-bc my-executable
```
The command will create `my-executable.bc` from `my-execubtale` executable.

# Converting bitcode to executable
To conver bitcode to executable use the following commands:
```
llc -filetype=obj my-file.bc
```
where **my-file.bc** would be **mysqld.bc** 

And then compile the object file using:
```
gcc my-file.o
```
The compilation can be done using `wllvm` too or `wllvm++` for original cpp files. The flags for compilation were earlier extracted and stored in **flags.txt** for future reference.

# References
You can use the following link for official documentation on building from source for mysql-5.7:

https://dev.mysql.com/doc/refman/5.7/en/installing-source-distribution.html

Wllvm github repo:

https://github.com/travitch/whole-program-llvm

