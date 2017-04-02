package P6::DT;

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## mp2

## libapreq2

## dist

## cpan
#use Date::Business ();

## custom
use P6::Cmd ();
use P6::Util ();

## version
our $VERSION = q$Revision: 45731 $;

## constants
use constant SECS_IN_MIN => 60;
use constant SECS_IN_HOUR => SECS_IN_MIN * 60;
use constant SECS_IN_DAY  => SECS_IN_HOUR * 24;

## globals

## internal globals
my %months = (
              Jan => '01',
              Feb => '02',
              Mar => '03',
              Apr => '04',
              May => '05',
              Jun => '06',
              Jul => '07',
              Aug => '08',
              Sep => '09',
              Oct => '10',
              Nov => '11',
              Dec => '12',
             );

sub now       { custom(f => "%Y%m%d-%H%M%S") }
sub today     { custom() }
sub yesterday { custom(w => '-1d') }

sub today_start { custom(s => 1) }
sub today_end   { custom(e => 1) }

sub yesterday_start { custom(w => '-1d', s => 1) }
sub yesterday_end   { custom(w => '-1d', e => 1) }

sub seven_ago_start  { custom(w => '-7d', s => 1) }
sub seven_ago_end    { custom(w => '-7d', e => 1) }

sub eight_ago_start  { custom(w => '-8d', s => 1) }
sub eight_ago_end    { custom(w => '-8d', e => 1) }

sub thirty_ago_start { custom(w => '-30d', s => 1) }
sub ninety_ago_start { custom(w => '-90d', s => 1) }

sub custom {
    my %args = @_;

    $args{f} ||= '%Y%m%d';

    $args{w} ||= '';
    if ($args{w} =~ /H/) {
        $args{f} .= "-%H0000" if $args{s};
        $args{f} .= "-%H5959" if $args{e};
    }
    elsif ($args{w} =~ /y/) {
        $args{f} .= "%Y0101-000000" if $args{s};
        $args{f} .= "%Y1231-235959" if $args{e};
    }
    elsif ($args{w} =~ /M/) {
        $args{f} = "%Y%m01-000000" if $args{s};
        $args{f} = "%Y%m31-235959" if $args{e};
    }
    else { # w =~ /w/ and rest
        $args{f} .= "-000000" if $args{s};
        $args{f} .= "-235959" if $args{e};
    }

    my $v = "";
    $v = "-v $args{w}" if $args{w};

    my $cmd = qq{$P6::Cmd::DATE $v +"$args{f}"};
    P6::Util::debug("date: $cmd\n");

    ## de-taint
    $cmd =~ /(.*)/; $cmd = $1;
    local %ENV = ( PATH => '/bin' );

    my $d = `$cmd`;
    chomp $d;

    $d
}

sub mysql_hires {
    local $_ = shift;

    no warnings qw(uninitialized);
    if (/(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})(?:\.(\d{6}))?\+(\d{2}:\d{2})?/) {
        return ("$1-$2-$3 $4:$5:$6", $7 || 0);
    }
    elsif (/(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})-(\d{2}:\d{2})/) {
        return ("$1-$2-$3 $4:$5:$6", 0); ## XXX: throwing TZ away
    }
    else {
        P6::Util::error("Unsupported hires input date format [$_]\n");
    }

    return;
}

sub mysql {
    my ($dt) = @_;

    my $mysql;
    my $mm;
    if ($dt =~ m!(\d+)/(...)/(\d+):(\d+):(\d+):(\d+)!) {
        $mm = $months{$2};
        $mysql = "$3-$mm-$1 $4:$5:$6";
    }
    elsif ($dt =~ /(...), (\d{2}) (...) (\d{4}) (\d{2}):(\d{2}):(\d{2})/) {  # not in UTC
        $mm = $months{$3};
        $mysql = "$4-$mm-$2 $5:$6:$7";
    }
    elsif ($dt =~ m/(...) (...) (\d+) (\d+):(\d+):(\d+) (\d+)/) {
        $mm = $months{$2};
        $mysql = "$7-$mm-$3 $4:$5:$6";
    }
    elsif ($dt =~ /(...) +(\d+) (\d+):(\d+):(\d+)/) {
        my $yyyy = (localtime(time))[5] + 1900;
        $mm = $months{$1};
        $mysql = "$yyyy-$mm-$2 $3:$4:$5";
    }
    elsif ($dt =~ /(\d{4})(\d{2})(\d{2})-(\d{2})(\d{2})(\d{2})/) {
        $mysql = "$1-$2-$3 $4:$5:$6";
    }
    elsif ($dt =~ /(\d{4})(\d{2})(\d{2})-\d+/) {
        $mysql = "$1-$2-$3 00:00:00";
    }
    elsif ($dt =~ /(\d{2})-(...)-(\d{4}) (\d{2}):(\d{2}):(\d{2})/) {
        $mm = $months{$2};
        $mysql = "$3-$mm-$1 $4:$5:6";
    }
    else {
        P6::Util::error("Unsupported input date format [$dt]\n");
    }

    $mysql;
}

sub hhmmss_2_secs {
    my ($time) = @_;

    my ($days, $hhmmss);
    if ($time =~ /\+/) {
        ($days, $hhmmss) = split /\+/, $time;
    }
    elsif ($time =~ /min/) {
        $time =~ s/ min//;
        $hhmmss = "00:$time:00";
    }
    else {
        $hhmmss = $time;
    }
    my ($hh, $mm, $ss) = split /:/, $hhmmss;

    my $seconds = $ss;
    $seconds += $mm * SECS_IN_MIN;
    $seconds += $hh * SECS_IN_HOUR;
    $seconds += $days * SECS_IN_DAY if $days;

    $seconds;
}

sub diff {
    my ($date1, $date2) = @_;

    $date1 =~ s/ .*//; $date1 =~ s/-//g;
    $date2 =~ s/ .*//; $date2 =~ s/-//g;

    my $d1 = Date::Business->new(DATE => $date1);
    my $d2 = Date::Business->new(DATE => $date2);

    my $delta = $d1->diffb($d2);

    return $delta;
}

1;
