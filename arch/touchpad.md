# Steps

- `sudo nano /etc/default/grub`
 !! ADD GRUB_CMDLINE_LINUX_DEFAULT="quiet splash i8042.nopnp  resume=UUID=<edit swap uuid>"
- `sudo update-grub`
- `echo "blacklist i2c_hid" | sudo tee /etc/modprobe.d/i2c-hid.conf`
- `sudo depmod -a`
- `echo "synaptics_i2c" | sudo tee -a /etc/modules`
- `sudo reboot`
