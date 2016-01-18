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
ln -s $HOME/.dotfiles/.vimrc
ln -s $HOME/.dotfiles/.vim
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
ln -s $HOME/.dotfiles/.bashrc
```
----
### i3
```bash
# Create symbolic link
ln -s $HOME/.dotfiles/config config $HOME/.config/i3/config
```
###### py3status
```bash
# Create symbolic link
ln -s $HOME/.dotfiles/.i3status.conf
```
----  
## To Do
- Identify dependencies
- Refactor .vimrc
- Install script
- . . . 
