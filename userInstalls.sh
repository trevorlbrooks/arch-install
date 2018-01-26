    cd ~
    cd tmp
    git clone https://aur.archlinux.org/package-query.git
    cd package-query
    makepkg -si
    cd ..
    git clone https://aur.archlinux.org/yaourt.git
    cd yaourt
    makepkg -si
    cd ..
    cd ..
    rm -r tmp

    yaourt -S polybar
    #sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    mkdir .config/rofi

    mkdir projects
    cd projects
    git clone https://github.com/trevorlbrooks/dotfiles
    cd
    ln -s ~/projects/dotfiles/.vimrc .vimrc
    mkdir .vim
    mkdir .vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    mkdir .vim/colors
    curl -o .vim/colors/256-grayvim.vim http://www.vim.org/scripts/download_script.php?src_id=12849
    #yaourt -S texworks
    mkdir .config
    mkdir .config/i3
    mkdir .config/termite
    mkdir .config/rofi
    mkdir .config/dunst
    mkdir .config/compton
    ln -s ~/projects/dotfiles/.bash_profile .bash_profile
    ln -s ~/projects/dotfiles/.tmux.conf .tmux.conf
    ln -s ~/projects/dotfiles/.config/i3/config .config/i3/config
    ln -s ~/projects/dotfiles/.config/termite/config .config/termite/config
    ln -s ~/projects/dotfiles/.config/polybar .config/polybar
    ln -s ~/projects/dotfiles/.config/rofi/config .config/rofi/config
    ln -s ~/projects/dotfiles/.config/dunst/config .config/dunst/config
    ln -s ~/projects/dotfiles/.config/compton/config .config/compton/config

    yaourt -S discord
    yaourt -S spotify
