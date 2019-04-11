ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
localectl set-locale LANG=en_US.UTF-8

echo "venticup" >> /etc/hostname

pacman -Syu
pacman -S wicd grub efibootmgr --noconfirm --needed
mkdir /esp
mount /dev/sda2 /esp
grub-install --target=x86_64-efi --efi-directory=/esp --bootloader-id=arch
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable wicd
pacman -S vim docker i3 rofi feh gnome reflector wget rsync compton zsh \ 
    python python3 mysql-workbench \
    binutils make gcc fakeroot pkg-config git expac yajl \
    sudo gdm htop tmux \
    firefox pulseaudio konsole termite nautilus screenfetch markdown code calibre \
    linux-headers dotnet-sdk \
    adobe-source-code-pro-fonts \
    python-pip powerline powerline-fonts dunst openssh --noconfirm --needed

systemctl enable gdm
pip install i3ipc
useradd -m -g wheel -s /usr/bin/zsh tbrooks
wget https://raw.githubusercontent.com/trevorlbrooks/arch-install/master/tempSudo
cp tempSudo /etc/sudoers.d/tempSudo
chmod 0440 /etc/sudoers.d/tempSudo
su tbrooks -c sh -c "$(curl -fsSL https://raw.githubusercontent.com/trevorlbrooks/arch-install/master/userInstalls.sh)"
rm /etc/sudoers.d/tempSudo
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers.d/wheel
chmod 0440 /etc/sudoers.d/wheel
