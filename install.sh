
pacstrap /mnt base
genfstab -L /mnt >> /mnt/etc/fstab
arch-chroot /mnt << EOSH
ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo "archvm" >> /etc/hostname

pacman -Syu
pacman -S wicd grub --noconfirm --needed
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable wicd
pacman -S vim docker i3 rofi feh wget rsync compton --noconfirm --needed  
pacman -S python python3 mysql-workbench --noconfirm --needed
pacman -S binutils make gcc fakeroot pkg-config git expac yajl --noconfirm --needed
pacman -S sudo gdm htop tmux --noconfirm --needed
sudo pacman -S firefox pulseaudio konsole termite intellij-idea-community-edition maven apache-ant nautilus screenfetch markdown atom calibre --noconfirm --needed
systemctl enable gdm
sudo pacman -S linux-headers --noconfirm --needed
sudo pacman -S adobe-source-code-pro-fonts --noconfirm --needed
sudo pacman -S python-pip --noconfirm --needed
sudo pip install i3ipc
sudo pacman -S powerline powerline-fonts texlive-most dunst openssh --noconfirm --needed
useradd -m -g wheel -s /usr/bin/zsh tbrooks
echo " %wheel  ALL=(ALL) ALL" >> /etc/sudoers

sudo -u tbrooks bash << EOF
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
ln -s /home/tbrooks/projects/dotfiles/.vimrc .vimrc
mkdir .vim
mkdir .vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir .vim/colors
curl -o .vim/colors/256-grayvim.vim http://www.vim.org/scripts/download_script.php?src_id=12849
pacaur -S texworks

mkdir .config/i3
mkdir .config/termite
mkdir .config/rofi
mkdir .config/dunst
mkdir .config/compton
ln -s /home/tbrooks/projects/dotfiles/.bash_profile .bash_profile
ln -s /home/tbrooks/projects/dotfiles/.tmux.conf .tmux.conf
ln -s /home/tbrooks/projects/dotfiles/.config/i3/config .config/i3/config
ln -s /home/tbrooks/projects/dotfiles/.config/termite/config .config/termite/config
ln -s /home/tbrooks/projects/dotfiles/.config/polybar .config/polybar
ln -s /home/tbrooks/projects/dotfiles/.config/rofi/config .config/rofi/config
ln -s /home/tbrooks/projects/dotfiles/.config/dunst/config .config/dunst/config
ln -s /home/tbrooks/projects/dotfiles/.config/compton/config .config/compton/config

gpg --recv-keys 0FC3042E345AD05D
pacaur -S discord
pacaur -S spotify

EOF
EOSH
echo "Setup complete. You should now set root and user passwords."

