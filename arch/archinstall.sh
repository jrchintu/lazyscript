#! /bin/bash

#keyboard layout
loadkeys dvorak
ip a

#connect wifi
iwctl
#station device connect SSID (new arch)
station wls3 connect TP-LINK
#wifi-menu (old arch)
ping 8.8.8.8

#update repos
timedatectl set-ntp true
pacman -Syyy
pacman -S reflector
reflector -c Bangladesh -c India -a 6 --sort rate --save /etc/pacman.d/mirrorlist
#update python if reflector shows errors
pacman -Syyy

#partitioning
lsblk
cfdisk /dev/sda
#(create root partition, no need to create efi partion for dual boot)
lsblk
mkfs.ext4 /dev/sda* #replace * with the root partition number
mount /dev/sda* /mnt #replace * with root partition
mkdir /mnt/boot
mount /dev/sda* /mnt/boot #replace * with efi partiton number
mkdir /mnt/Windows10 #making windows 10 c drive accesable
mount /dev/sda* /mnt/Windows10 #replace * with windows 10 c drive number
#mkdir /mnt/Other_drive #make other drive accesable
#mount /dev/sdb* /mnt/Other_drive #replace * with drive number
lsblk #check if everything ok or not
pacstrap /mnt base linux linux-firmware vim intel-ucode
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Asia/Dhaka /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
locale-gen
echo "KEYMAP=dvorak" >> /etc/vconsole.conf
echo "K" >> /etc/hostname
echo "
127.0.0.1	localhost
::1		localhost
127.0.1.1	K" >> /etc/hosts
passwd
pacman -S grub os-prober ntfs-3g networkmanager network-manager-applet wireless_tools wpa_supplicant base-devel linux-headers

#uefi
pacman -S efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
#or, bios/mbr and not /dev/sda1
grub-install --target=i386-pc /dev/sda 

grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
useradd -mG wheel k
passwd k
#next Uncomment %wheel ALL=(ALL) ALL before #same thing without a password
EDITOR=vim visudo
exit
umount -a
reboot
#give user name and password
ip a
nmtui
#sudo pacman -S xf86-video-qxl #for virtualbox
sudo pacman -S xf86-video-intel
sudo pacman -S xorg

#lightdm installation
sudo pacman -S lightdm-gtk-greeter
sudo systemctl enable lightdm

#or, sddm installation
sudo pacman -S sddm
sudo systemctl enable sddm

#xfce4 installation
sudo pacman -S xfce4

#or, kde installation
sudo pacman -S plasma kde-applications packagekit-qt5

#install yay
sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si PKGBUILD

#install only bangla font
mkdir -p ~/.fonts
curl -L https://www.omicronlab.com/download/fonts/Siyamrupali.ttf -o ~/.fonts/Siyamrupali.ttf

#or, install noto fonts (has bangla font too)
sudo pacman -S noto-fonts

#or, install ms fonts
yay -S ttf-ms-fonts

# audio
sudo pacman -S alsa-utils
alsamixer
speaker-test -c2 #(after reboot)

exit
reboot
