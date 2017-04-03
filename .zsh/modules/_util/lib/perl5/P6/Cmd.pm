package P6::Cmd;

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## mp2

## libapreq2

## dist

## cpan

## custom

## version
our $VERSION = q$Revision: 43901 $;

our $BZIP2   = "/usr/bin/bzip2";
our $CP      = "/bin/cp";
our $CP_R    = "$CP -R";
our $DATE    = "/bin/date";
our $FETCH   = "/usr/bin/fetch";
our $GREP    = "/usr/bin/grep";
our $MAKE    = "/usr/bin/make";
our $MD5     = "/sbin/md5";
our $MDCONFIG = "/sbin/mdconfig";
our $MDMFS = "/sbin/mdmfs";
our $MKDIR = "/bin/mkdir";
our $MKDIR_P = "$MKDIR -p";
our $PING    = "/sbin/ping";
our $PKGADD = "/usr/sbin/pkg_add";
our $PKGDEL = "/usr/sbin/pkg_delete";
our $PS      = "/bin/ps";
our $PWD     = "/bin/pwd";
our $RM      = "/bin/rm";
our $RM_F    = "$RM -f";
our $RM_RF   = "$RM -rf";
our $SED     = "/usr/bin/sed";
our $SED_I   = "$SED -i ''";
our $SHA256  = "/sbin/sha256";
our $SYSCTL  = "/sbin/sysctl";
our $TAIL    = "/usr/bin/tail";
our $TAR     = "/usr/bin/tar";
our $TOUCH   = "/usr/bin/touch";
our $UMOUNT = "/sbin/umount";
our $ZFS     =" /sbin/zfs";
our $ZPOOL   = "/sbin/zpool";

our $GMAKE   = "/usr/local/bin/gmake";
our $GPG     = $^O =~ /cygwin/ ? "/bin/gpg" :
               $^O =~ /linux/  ? "/usr/bin/gpg" :
               $^O =~ /darwin/ ? "/opt/local/bin/gpg" :
               "/usr/local/bin/gpg";
our $SVN     = $^O =~ /linux/ ? "/usr/bin/svn" : "/usr/local/bin/svn";
our $MYSQL   = "/usr/local/bin/mysql";
our $MYSQLDUMP = "/usr/local/bin/mysqldump";
our $TARSNAP = "/usr/local/bin/tarsnap";
our $SVNLOOK = "/usr/local/bin/svnlook";
our $RSYNC   = "/usr/local/bin/rsync";
our $SQLITE3 = $^O =~ /darwin/ ? "/opt/local/bin/sqlite3" : "/usr/local/bin/sqlite3";

our $TC = "/space/scripts/tc";

1;
