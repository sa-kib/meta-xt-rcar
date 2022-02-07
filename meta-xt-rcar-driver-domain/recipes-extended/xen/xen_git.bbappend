
# for uboot-mkimage
DEPENDS += "u-boot-mkimage-native"

do_deploy_append () {
    if [ -f ${D}/boot/xen ]; then
        uboot-mkimage -A arm64 -C none -T kernel -a 0x8e000000 -e 0x8e000000 -n "XEN" -d ${D}/boot/xen ${DEPLOYDIR}/xen-${MACHINE}.uImage
        ln -sfr ${DEPLOYDIR}/xen-${MACHINE}.uImage ${DEPLOYDIR}/xen-uImage
    fi
}
