pacstrap /mnt base
genfstab -L /mnt >> /mnt/etc/fstab
arch-chroot /mnt sh -c "$(curl -fsSL https://raw.githubusercontent.com/trevorlbrooks/arch-install/vmInstall/sudoInstalls.sh)"
echo "Setup complete. You should now set root and user passwords."

