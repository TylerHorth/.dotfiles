# Tyler's dotfiles
My personal configuration files . . . and stuff.
## Setup
```bash
# Clone .dotfiles repo and all submodules
git clone --recursive https://github.com/TylerHorth/.dotfiles
```
----
### Vim
```bash
# Create symbolic links
ln -s .vimrc $HOME/.vimrc
ln -s .vim $HOME/.vim
# Install plugins
vim +PlugInstall +qall
```
###### Powerline Fonts
```bash
# Run install script
./fonts/install.sh
```
----
### Bash
```bash
# Create symbolic link
ln -s .bashrc $HOME/.bashrc
```
----
### i3
```bash
# Create symbolic link
ln -s config $HOME/.config/i3/config
```
###### py3status
```bash
# Create symbolic link
ln -s .i3status.conf $HOME/.i3status.conf
```
----  
## To Do
- Identify dependencies
- Refactor .vimrc
- Install script
- . . . 
