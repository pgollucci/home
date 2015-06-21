#!/bin/sh -x

zpool create zwork /dev/xbd1
zfs set mountpoint=none zwork
zfs create zwork/poudriere
zfs create zwork/ccache
zfs set mountpoint=/usr/local/poudriere/ccache zwork/ccache
