#!/bin/bash ###############################
############ Download Imp Stuff ###########
###########################################
sudo apt install jq -y 1>/dev/null

###########################################
########### Define Imp Variables ##########
###########################################
export LUNCHCOMMAND="lunch corvus_mido-user"
export BUILDCOMMAND="make corvus"
export BUILD_TYPE="ccache" # final or ccache
export METALAVA="true"
export USE_CCACHE="1"
export CCACHEDIR="$HOME/.ccache"
export CCACHESIZE="20G"
export URL="https://rom.jrchintu.ga/0:/CCACHE/ccache.tar.gz"
export manifest="https://github.com/Corvus-R/android_manifest.git"
export local_manifest="git://github.com/jrchintu/local_manifest.git"
export romdir="$HOME/rom"

###########################################
############# Dont touch Here #############
###########################################
# Credentials
export BOTAPI="$mybot"
export ID="$chatid"
export API1="$apicode"
export RC1="$rcloneconfig"

# Extra Stuff
export TZ="Asia/Kolkata"
export NL=$'\n'
function TG() {
    TEXT1="$1"
    M_ID=$(curl -s "https://api.telegram.org/bot${BOTAPI}/sendmessage" \
        -d "text=$1&chat_id=${ID}" \
        -d "disable_web_page_preview=true" \
        -d "parse_mode=html" | jq .result.message_id) 1>/dev/null
}
function TGEDIT() {
    TEXT2="$2"
    curl -s -X POST https://api.telegram.org/bot"${BOTAPI}"/editMessageText \
        -d chat_id="$ID" \
        -d message_id="$1" \
        -d text="$TEXT2" \
        -d silent=true | jq . 1>/dev/null
}
function TGDOC() {
    curl -F chat_id="${ID}" \
        -F document=@"$1" \
        -F caption="$2" https://api.telegram.org/bot"${BOTAPI}"/sendDocument >/dev/null
}
function DEL() {
    RESULT=$(curl -sf --data-binary @"${1:--}" https://del.dog/documents) || {
        echo "DEL-ERROR" >&2
        return 1
    }
    KEY=$(printf "%s\n" "${RESULT}" | cut -d '"' -f6)
    echo "https://del.dog/${KEY}"
}
function COM() {
    tar --use-compress-program="pigz -k -$2 " -cf "$1".tar.gz "$1"
}
function T1() {
    date +"%I:%M%p"
}
function TRIM() {
    grep -iE 'crash|avc|error|fail|fatal|failed|missing' "$1" &>"Trim-$1"
}

##########################################
##### Download Source || Sync source #####
##########################################
mkdir -p "$romdir"
cd "$romdir" || exit

# Goolag Api Code
echo "$API1" >>./script1.sh && chmod +x ./script1.sh && bash ./script1.sh

# Repo Init
repo init -q --no-repo-verify --depth=1 -u "$manifest" -b 11 -g default,-device,-mips,-darwin,-notdefault

# Local Manifest
git clone --depth=1 "$local_manifest" -b corvus .repo/local_manifests

# Final Sync
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j 30 ||
    repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j "$(nproc -all)"

###########################################
######### DOWNLOAD & SETUP CCACHE #########
###########################################
# Ccache
if [[ "$USE_CCACHE" = "1" ]]; then
    #Download ccache
    cd "$CCACHE_DIR" || exit
    rm -rf .ccache ccache
    time aria2c "$URL" -x16 -s50
    time tar xf ccache.tar.gz
    rm -rf ccache.tar.gz
    
    #Set ccache
    export CCACHE_DIR="$CCACHEDIR"
    export CCACHE_EXEC="$(which ccache)"
    ccache -M "$CCACHESIZE"
    ccache -o compression=true
    
    #ccache notification
    TG "$(ccache -s)"
    export B2="$M_ID"
fi

############################################
############ FINAL BUILD STEPS #############
############################################
# Rclone Config
mkdir -p ~/.config/rclone
echo "$RC1" >~/.config/rclone/rclone.conf

# PC Stats
curl https://raw.githubusercontent.com/ramdibaaz/aosp-builder/main/extra.sh >>extra.sh && chmod +x ./extra.sh && bash extra.sh
TGDOC "stats.md" "New build starts"

# Build Info notification
TG "$(date)""$NL""IP:$(curl ipinfo.io/ip) By $USER""$NL""Type:$BUILD_TYPE Metalava:$METALAVA""$NL""ccache:$CCACHESIZE cores:$(nproc)""$NL""+++++++++++++++++++++"
export INFO="$M_ID"

# Before build Steps
source ./build/envsetup.sh && eval "$LUNCHCOMMAND"
TGEDIT "$INFO" "$TEXT1""$NL""$(T1):Env Setup And Lunch"

# Make Metalava Seperately
if [[ "$METALAVA" = "true" ]]; then
    TGEDIT "$INFO" "$TEXT2""$NL""$(T1):Metalava Build Started"
    export WITHOUT_CHECK_API=true
    make api-stubs-docs || echo SKIPPING
    make system-api-stubs-docs || echo SKIPPING
    make test-api-stubs-docs || echo SKIPPING
    TGEDIT "$INFO" "$TEXT2""$NL""$(T1):Metalava Build Done"
fi

# Final Build Start's Here
TG "BUILD%" && export B3="$M_ID"
eval "$BUILDCOMMAND" | tee ErrorLog.txt &
sleep 60
export END="$(date +"%I:%M%p" -d "$(date) + 83 minute")"
TGEDIT "$INFO" "$TEXT2""$NL""$(T1):Main Build upto $END"

# Build %'age and kill in 85m if build type is ccache
if [[ "$BUILD_TYPE" = "ccache" ]]; then
    while test ! -z "$(pidof soong_ui)"; do
        if [[ "$(date +"%I:%M%p")" = "$END" ]]; then
            kill %1
            TGEDIT "$INFO" "$TEXT2""$NL""$(T1):Killed FOR CCACHE UPLOAD"
            break
        else
            sleep 120
            BUILD_STATS=$(tail <"ErrorLog.txt" -n 1 | awk '{ print $2 }')
            TGEDIT "$B3" "$(T1)=$BUILD_STATS" && TGEDIT "$B2" "$(ccache -s)"
        fi
    done
else
    while test ! -z "$(pidof soong_ui)"; do
        sleep 120
        BUILD_STATS=$(tail <"ErrorLog.txt" -n 1 | awk '{ print $2 }')
        TGEDIT "$B3" "$(T1)=$BUILD_STATS" && TGEDIT "$B2" "$(ccache -s)"
    done
fi

# Send logs or exit if no log found
for B4 in *txt; do
    if [ -e "$B4" ]; then
        TRIM "$B4"
        TGDOC "$B4" "$(DEL "$B4")"
        TGDOC "Trim-$B4" "$(DEL Trim-"$B4")"
    else
        break
    fi
done
TGDOC "./out/*log" "$(DEL ./out/*log)" || exit

# Upload Rom If Zip Found
if ls /tmp/rom/out/target/product/mido/*zip 1>/dev/null 2>&1; then
    for LOOP in /tmp/rom/out/target/product/mido/*zip; do
        if [ -e "$LOOP" ]; then
            rclone copy "$LOOP" GDUP:ROM/ZIP
            TGEDIT "$INFO" "$TEXT2""$NL""$(T1):Rom Uploaded"
            TG "ROM URL:-https://rom.jrchintu.ga/0:/ZIP/$LOOP"
        else
            break
        fi
    done
else
    tmate -S /tmp/tmate.sock new-session -d &&
        tmate -S /tmp/tmate.sock wait tmate-ready &&
        SENDSHELL=$(tmate -S /tmp/tmate.sock display -p '#{tmate_ssh}') &&
        TGEDIT "$INFO" "$TEXT2""$NL""$(T1):Build Failed OR Zip Not Found" &&
        TG "$SENDSHELL"
fi

# Upload ccache
if [[ "$BUILD_TYPE" = "ccache" ]]; then
    cd /tmp || exit
    TGEDIT "$INFO" "$TEXT2""$NL""$(T1):Uploading ccache"
    COM ccache 1
    rclone copy ccache.tar.gz GDUP:ROM/CCACHE
    TGEDIT "$INFO" "$TEXT2""$NL""$(T1):Ccache Uploaded"
    cd /tmp/rom || exit
fi

# Sleep while tmate is running
TGEDIT "$INFO" "$TEXT2""$NL""$(T1):STOPPED ALL UPTO $END"
sleep 30m
exit
