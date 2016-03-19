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
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.vim ~/.vim
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
ln -s ~/.dotfiles/.bashrc ~/.bashrc
```
----
### i3
```bash
# Create symbolic link
ln -s ~/.dotfiles/config ~/.config/i3/config 
```
###### py3status
```bash
# Create symbolic link
ln -s ~/.dotfiles/.i3status.conf ~/.i3status.conf
```
----  
###### fish
```bash
# Create symbolic link
ln -s ~/.dotfiles/config.fish ~/.config/fish/config.fish
```
----  
## To Do
- Identify dependencies
- Install script
- . . . 
