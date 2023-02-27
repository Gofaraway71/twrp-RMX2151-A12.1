#!/sbin/sh
# This script is Needed to Set Automatically Device Props.

prjName=$(cat /proc/oplusVersion/prjVersion)
echo $prjName

case $prjName in
    "20682")
        resetprop "ro.product.model" "Realme 7/ Narzo 20 Pro "
        resetprop "ro.build.product" "RMX2151"
        resetprop "ro.product.device" "RMX2151"
        ;;
    *)
        resetprop "ro.product.model" "Realme 6"
        resetprop "ro.build.product" "RMX2001"
        resetprop "ro.product.device" "RMX2001"
        ;;
esac

exit 0
