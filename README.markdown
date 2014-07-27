ConanVimrc v 1.3

Maintainer: Conan

## Screen shot

![Screen shot](https://xiil8w.blu.livefilestore.com/y1psxjrQXZ6JdWymbitNvNXBvPH8A44bGZUv48xy51LULFtXnw8nDGx8FMgupx3sVmlAOCOieqfBtKs8zPgrysve5qKJmNJ3r2F/ConanVimrc.png?psid=1)

## How to use

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

```

So you want to know what features I have included? You will definitely want to check out the `vimrc` file. Those are all the settings I have made. And it is well documented I guess. 

## Trouble shooting 

If the status line is not showing correctly, you may need to install one of the fonts from this page: <https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts>
