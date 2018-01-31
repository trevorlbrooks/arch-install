ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

echo "archvm" >> /etc/hostname

pacman -Syu
pacman -S wicd grub --noconfirm --needed
grub-install --target=x86_64-efi --efi-directory=/dev/sdd1 --bootloader-id=arch
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable wicd
pacman -S vim docker i3 rofi feh wget rsync compton zsh --noconfirm --needed  
pacman -S python python3 mysql-workbench --noconfirm --needed
pacman -S binutils make gcc fakeroot pkg-config git expac yajl --noconfirm --needed
pacman -S sudo gdm htop tmux --noconfirm --needed
pacman -S firefox pulseaudio konsole termite intellij-idea-community-edition maven apache-ant nautilus screenfetch markdown atom calibre --noconfirm --needed
systemctl enable gdm
pacman -S linux-headers --noconfirm --needed
pacman -S adobe-source-code-pro-fonts --noconfirm --needed
pacman -S python-pip --noconfirm --needed
pip install i3ipc
pacman -S powerline powerline-fonts texlive-most dunst openssh --noconfirm --needed
useradd -m -g wheel -s /usr/bin/zsh tbrooks
wget https://raw.githubusercontent.com/trevorlbrooks/arch-install/master/tempSudo
cp tempSudo /etc/sudoers.d/tempSudo
chmod 0440 /etc/sudoers.d/tempSudo
gpg --keyserver pgp.mit.edu --recv 11E521D646982372EB577A1F8F0871F202119294
su tbrooks -c sh -c "$(curl -fsSL https://raw.githubusercontent.com/trevorlbrooks/arch-install/master/userInstalls.sh)"
rm /etc/sudoers.d/tempSudo
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers.d/wheel
chmod 0440 /etc/sudoers.d/wheel
