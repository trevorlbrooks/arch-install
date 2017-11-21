    cd ~
    mkdir tmp
    cd tmp
    gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
    curl -o PKGBUILD "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower"
    makepkg -i PKGBUILD
    curl -o PKGBUILD "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur"
    makepkg -i PKGBUILD
    cd ..
    rm -r tmp

    pacaur -S polybar
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
    mkdir .vim/colors
    curl -o .vim/colors/256-grayvim.vim http://www.vim.org/scripts/download_script.php?src_id=12849
    #pacaur -S texworks

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

    gpg --recv-keys 0FC3042E345AD05D
    pacaur -S discord
    pacaur -S spotify


