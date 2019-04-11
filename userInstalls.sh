cd ~
mkdir tmp
cd tmp
git clone https://aur.archlinux.org/polybar.git
cd polybar
makepkg -si
cd ..
gpg --keyserver pgp.mit.edu --recv 11E521D646982372EB577A1F8F0871F202119294
git clone https://aur.archlinux.org/discord.git
cd discord
makepkg -si
cd ..
git clone https://aur.archlinux.org/spotify.git
makepkg -si
cd ..
rm -r tmp
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir .config/rofi
mkdir projects
cd projects
git clone https://github.com/trevorlbrooks/dotfiles
cd
ln -s ~/projects/dotfiles/.vimrc .vimrc
mkdir .vim
mkdir .vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/colors
curl -o ~/.vim/colors/256-grayvim.vim https://www.vim.org/scripts/download_script.php?src_id=12849
mkdir .config
mkdir .config/i3
mkdir .config/termite
mkdir .config/rofi
mkdir .config/dunst
mkdir .config/compton
rm ~/.bash_profile
ln -s ~/projects/dotfiles/.bash_profile .bash_profile
ln -s ~/projects/dotfiles/.tmux.conf .tmux.conf
ln -s ~/projects/dotfiles/.config/i3/config .config/i3/config
ln -s ~/projects/dotfiles/.config/termite/config .config/termite/config
ln -s ~/projects/dotfiles/.config/polybar .config/polybar
ln -s ~/projects/dotfiles/.config/rofi/config .config/rofi/config
ln -s ~/projects/dotfiles/.config/dunst/dunstrc .config/dunst/dunstrc
ln -s ~/projects/dotfiles/.config/compton/.compton.conf .config/compton/.compton.conf
