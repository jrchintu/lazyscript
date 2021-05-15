# set this function in shell
```
up (){
    curl -T "$1" https://transfer.sh/"$1"; echo
}
```

# in phone
```
su -c 'cp /sys/fs/selinux/policy . && dmesg | tee dmesg && logcat | tee logcat'
up dmesg && up logcat && up policy
```

# in Gcp free shell run
```
docker run -it apon77/sepolicy
```

# download those 3 files in docker (logcat, dmesg, policy)

- `cat logcat | audit2allow -p policy`
- `cat dmesg | audit2allow -p policy`
