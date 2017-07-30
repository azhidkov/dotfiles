# restore config files
mkdir -p ~/git/dotfiles
git clone https://github.com/azhidkov/dotfiles.git ~/git/dotfiles 
ln -s ~/git/dotfiles/.vim ~/
ln -s ~/git/dotfiles/.vimrc ~/
ln -s ~/git/dotfiles/.tmux.conf ~/
ln -s ~/git/dotfiles/.config/.i3 ~/.config/.i3
ln -s ~/git/dotfiles/.bash_profile ~/
ln -s ~/git/dotfiles/.bashrc ~/
cd ~/git/dotfiles
git submodule init 
git submodule update --recursive

