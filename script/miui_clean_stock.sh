fastboot $* getvar product 2>&1 | grep -E "^product: *MSM8953$|^product: *mido$"
if [ $? -ne 0 ]; then
    echo "Missmatching image and device"
    exit 1
fi
fastboot $* oem device-info 2>&1 | grep -E "Device unlocked: true"
if [ $? -ne 0 ]; then
    echo "Device oem locked"
    exit 1
fi
fastboot $* flash modem $(dirname $0)/images/NON-HLOS.bin
if [ $? -ne 0 ]; then
    echo "Flash modem error"
    exit 1
fi
fastboot $* flash sbl1 $(dirname $0)/images/sbl1.mbn
if [ $? -ne 0 ]; then
    echo "Flash sbl1 error"
    exit 1
fi
fastboot $* flash sbl1bak $(dirname $0)/images/sbl1.mbn
if [ $? -ne 0 ]; then
    echo "Flash sbl1bak error"
    exit 1
fi
fastboot $* flash rpm $(dirname $0)/images/rpm.mbn
if [ $? -ne 0 ]; then
    echo "Flash rpm error"
    exit 1
fi
fastboot $* flash rpmbak $(dirname $0)/images/rpm.mbn
if [ $? -ne 0 ]; then
    echo "Flash rpmbak error"
    exit 1
fi
fastboot $* flash tz $(dirname $0)/images/tz.mbn
if [ $? -ne 0 ]; then
    echo "Flash tz error"
    exit 1
fi
fastboot $* flash tzbak $(dirname $0)/images/tz.mbn
if [ $? -ne 0 ]; then
    echo "Flash tzbak error"
    exit 1
fi
fastboot $* flash devcfg $(dirname $0)/images/devcfg.mbn
if [ $? -ne 0 ]; then
    echo "Flash devcfg error"
    exit 1
fi
fastboot $* flash devcfgbak $(dirname $0)/images/devcfg.mbn
if [ $? -ne 0 ]; then
    echo "Flash devcfgbak error"
    exit 1
fi
fastboot $* flash dsp $(dirname $0)/images/adspso.bin
if [ $? -ne 0 ]; then
    echo "Flash dsp error"
    exit 1
fi
fastboot $* flash fsg $(dirname $0)/images/fs_image.tar.gz.mbn.img
if [ $? -ne 0 ]; then
    echo "Flash fs_image error"
    exit 1
fi
fastboot $* flash sec $(dirname $0)/images/sec.dat
if [ $? -ne 0 ]; then
    echo "Flash sec error"
    exit 1
fi
fastboot $* flash splash $(dirname $0)/images/splash.img
if [ $? -ne 0 ]; then
    echo "Flash splash error"
    exit 1
fi
fastboot $* flash aboot $(dirname $0)/images/emmc_appsboot.mbn
if [ $? -ne 0 ]; then
    echo "Flash aboot error"
    exit 1
fi
fastboot $* flash abootbak $(dirname $0)/images/emmc_appsboot.mbn
if [ $? -ne 0 ]; then
    echo "Flash abootbak error"
    exit 1
fi
fastboot $* flash:raw boot $(dirname $0)/images/boot.img
if [ $? -ne 0 ]; then
    echo "Flash boot error"
    exit 1
fi
fastboot $* flash recovery $(dirname $0)/images/recovery.img
if [ $? -ne 0 ]; then
    echo "Flash recovery error"
    exit 1
fi
fastboot $* flash system $(dirname $0)/images/system.img
if [ $? -ne 0 ]; then
    echo "Flash system error"
    exit 1
fi
fastboot $* flash cache $(dirname $0)/images/cache.img
if [ $? -ne 0 ]; then
    echo "Flash cache error"
    exit 1
fi
#fastboot $* flash mdtp `dirname $0`/images/mdtp.img
fastboot $* flash lksecapp $(dirname $0)/images/lksecapp.mbn
if [ $? -ne 0 ]; then
    echo "Flash lksecapp error"
    exit 1
fi
fastboot $* flash lksecappbak $(dirname $0)/images/lksecapp.mbn
if [ $? -ne 0 ]; then
    echo "Flash lksecappbak error"
    exit 1
fi
fastboot $* flash cmnlib $(dirname $0)/images/cmnlib.mbn
if [ $? -ne 0 ]; then
    echo "Flash cmnlib error"
    exit 1
fi
fastboot $* flash cmnlibbak $(dirname $0)/images/cmnlib.mbn
if [ $? -ne 0 ]; then
    echo "Flash cmnlibbak error"
    exit 1
fi
fastboot $* flash cmnlib64 $(dirname $0)/images/cmnlib64.mbn
if [ $? -ne 0 ]; then
    echo "Flash cmnlib64 error"
    exit 1
fi
fastboot $* flash cmnlib64bak $(dirname $0)/images/cmnlib64.mbn
if [ $? -ne 0 ]; then
    echo "Flash cmnlib64bak error"
    exit 1
fi
fastboot $* flash keymaster $(dirname $0)/images/keymaster.mbn
if [ $? -ne 0 ]; then
    echo "Flash keymaster error"
    exit 1
fi
fastboot $* flash keymasterbak $(dirname $0)/images/keymaster.mbn
if [ $? -ne 0 ]; then
    echo "Flash keymasterbak error"
    exit 1
fi
fastboot $* flash userdata $(dirname $0)/images/userdata.img
if [ $? -ne 0 ]; then
    echo "Flash userdata error"
    exit 1
fi
fastboot $* flash cust $(dirname $0)/images/cust.img
if [ $? -ne 0 ]; then
    echo "Flash cust error"
    exit 1
fi
fastboot $* erase modemst1
if [ $? -ne 0 ]; then
    echo "erase modemst1 error"
    exit 1
fi
fastboot $* erase modemst2
if [ $? -ne 0 ]; then
    echo "erase modemst2 error"
    exit 1
fi
fastboot $* reboot
if [ $? -ne 0 ]; then
    echo "reboot error"
    exit 1
fi
