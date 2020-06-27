# mysql-installer
This is an overview on building mysql from source using wllvm. Building it in this manner can potentially let you generate bitcode of the final executable using `extract-bc` command. Note that this guide does not install mysql where the installation process would just copy files into respective directories.

# Installing pre-reqs
The following script will install `llvm-4.0`, `cllang-4.0`, `cmake` and `wllvm`. It will assume that `pip` is already installed.

```
source dep_instal.sh
```

The script will use the following helper scripts:
- **wllvm_install.sh**: Installs wllvm using pip
- **wllvm.env**: To set wllvm environment

# Making mysql_setup.sh

The following script will preconfigure environment for mysql for after installation and then build it using `cmake`.

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

# References
You can use the following link for official documentation on building from source for mysql-5.7:

https://dev.mysql.com/doc/refman/5.7/en/installing-source-distribution.html

Wllvm github repo:

https://github.com/travitch/whole-program-llvm

