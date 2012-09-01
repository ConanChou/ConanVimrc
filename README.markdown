ConanVimrc v 1.1

Maintainer: conanchou

# How to use

- Clone the project to your `Home` directory (or simply download the zip/tar file, and extract to your `Home` directory)

```
$ mkdir ~/.vim_runtime
$ git clone https://github.com/ConanChou/ConanVimrc.git ~/.vim_runtime
```

- Install

```
# read through the configs if you want
$ cat ~/.vim_runtime/install.sh

# <sytem> can be `mac`, `linux` or `windows`
$ sh ~/.vim_runtime/install.sh <system>

# install plugins
$ git submodule init
$ git submodule update
$ git submodule foreach git submodule init
$ git submodule foreach git submodule update

# compile command-T extension
$ cd ~/.vim_runtime/bundle/command-t/ruby/command-t
$ rvm use 1.8.7 # make sure you installed RVM before running this command
$ ruby extconf.rb
$ make
```

For more info please read vimrc file in this folder
