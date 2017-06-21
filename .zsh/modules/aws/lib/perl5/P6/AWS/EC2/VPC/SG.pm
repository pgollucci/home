package P6::AWS::EC2::VPC::SG;
use parent 'P6::Object';

## core
use strict;
use warnings FATAL => 'all';
use Carp;

## Std
use Data::Dumper;

## CPAN
use JSON ();

## Globals

## SDK
use P6::Util ();

## Constants

## methods

## private
sub _fields {

  {
    security_group_id => "",
    json => ""
  }
}

sub _post_init {
  my $self = shift;
  my %args = @_;

  my $security_group_id = $self->security_group_id();

  my ($rv, $json_str) = P6::Util::execute("aws ec2 describe-security-groups --group-ids $security_group_id", { output => 1, silent => 1 });

  my $json = JSON->new()->allow_nonref()->pretty();
  my $scalar  = eval { $json->decode($json_str) };
  return $@ if $@;
  $self->json($scalar->{SecurityGroups}->[0]);

  return;
}

sub display {
  my $self = shift;
  my %args = @_;

  my $scalar = $self->json();

  print $scalar->{GroupName};
  print "($scalar->{GroupId})\n";
  print $scalar->{Description};
  print "\n\n";

  print P6::Util::rprint(5, "I/E");
  print P6::Util::rprint(7, "Proto");
  print P6::Util::rprint(12, "Port");
  print P6::Util::rprint(17, "From");
  print "\n";
  print ("-" x 40);
  print "\n";

  foreach my $ip_perm (sort @{$scalar->{IpPermissions}}) {

    foreach my $ip_range (sort @{$ip_perm->{IpRanges}}) {
      print P6::Util::rprint(5, "IN");
      print P6::Util::rprint(7, $ip_perm->{IpProtocol} eq -1 ? 'ALL' : $ip_perm->{IpProtocol});

      if ($ip_perm->{IpProtocol} eq -1 || ($ip_perm->{FromPort} == 0 && $ip_perm->{ToPort} == 65535)) {
	print P6::Util::rprint(12, "ALL");
      }
      elsif ($ip_perm->{FromPort} == $ip_perm->{ToPort}) {
	print P6::Util::rprint(12, $ip_perm->{ToPort});
      }
      else {
	print P6::Util::rprint(12, "$ip_perm->{FromPort}-$ip_perm->{ToPort}");
      }

      print P6::Util::rprint(17, $ip_range->{CidrIp});
      print " (COIN)" if $ip_range->{CidrIp} eq "10.0.0.0/8";
      print " (VPN)"  if $ip_range->{CidrIp} eq "172.18.0.0/15" || $ip_range->{CidrIp} eq "172.28.0.0/16";
      print "\n";
    }

    foreach my $ip_range (sort @{$ip_perm->{UserIdGroupPairs}}) {
      print P6::Util::rprint(5, "IN");
      print P6::Util::rprint(7, $ip_perm->{IpProtocol} eq -1 ? 'ALL' : $ip_perm->{IpProtocol});

      if ($ip_perm->{IpProtocol} eq -1 || ($ip_perm->{FromPort} == 0 && $ip_perm->{ToPort} == 65535)) {
	print P6::Util::rprint(12, "ALL");
      }
      elsif ($ip_perm->{FromPort} == $ip_perm->{ToPort}) {
	print P6::Util::rprint(12, $ip_perm->{ToPort});
      }
      else {
	print P6::Util::rprint(12, "$ip_perm->{FromPort}-$ip_perm->{ToPort}");
      }

      if ($scalar->{OwnerId} == $ip_range->{UserId}) {
	if ($ip_range->{GroupId} eq $scalar->{GroupId}) {
	  print P6::Util::rprint(17, "LOCAL/$ip_range->{GroupId} (myself)");
	}
	else {
	  my ($rv, $group_name) = P6::Util::execute("aws --output text ec2 describe-security-groups --group-ids $ip_range->{GroupId} --query 'SecurityGroups[].GroupName'", { output => 1, silent => 1 });
	  $group_name =~ s/^\s+|\s+$//g;
	  print P6::Util::rprint(17, "LOCAL/$ip_range->{GroupId} ($group_name)");
	}
      }
      else {
	print P6::Util::rprint(17, "$ip_range->{UserId}/$ip_range->{GroupId}");
      }
      print "\n";
    }
  }

  print "--\n";

  foreach my $ip_perm (sort @{$scalar->{IpPermissionsEgress}}) {
    foreach my $ip_range (sort @{$ip_perm->{IpRanges}}) {
      print P6::Util::rprint(5, "OUT");
      print P6::Util::rprint(7, $ip_perm->{IpProtocol} eq -1 ? 'ALL' : $ip_perm->{IpProtocol});

      if ($ip_perm->{IpProtocol} eq -1 || ($ip_perm->{FromPort} == 0 && $ip_perm->{ToPort} == 65535)) {
	print P6::Util::rprint(12, "ALL");
      }
      elsif ($ip_perm->{FromPort} == $ip_perm->{ToPort}) {
	print P6::Util::rprint(12, $ip_perm->{ToPort});
      }
      else {
	print P6::Util::rprint(12, "$ip_perm->{FromPort}-$ip_perm->{ToPort}");
      }

      print P6::Util::rprint(17, $ip_range->{CidrIp});
      print "\n";
    }

    foreach my $ip_range (sort @{$ip_perm->{UserIdGroupPairs}}) {
      print P6::Util::rprint(5, "OUT");
      print P6::Util::rprint(7, $ip_perm->{IpProtocol} eq -1 ? 'ALL' : $ip_perm->{IpProtocol});

      if ($ip_perm->{IpProtocol} eq -1 || ($ip_perm->{FromPort} == 0 && $ip_perm->{ToPort} == 65535)) {
	print P6::Util::rprint(12, "ALL");
      }
      elsif ($ip_perm->{FromPort} == $ip_perm->{ToPort}) {
	print P6::Util::rprint(12, $ip_perm->{ToPort});
      }
      else {
	print P6::Util::rprint(12, "$ip_perm->{FromPort}-$ip_perm->{ToPort}");
      }

      if ($scalar->{OwnerId} == $ip_range->{UserId}) {
	if ($ip_range->{GroupId} eq $scalar->{GroupId}) {
	  print P6::Util::rprint(17, "LOCAL/$ip_range->{GroupId} (myself)");
	}
	else {
	  my ($rv, $group_name) = P6::Util::execute("aws --output text ec2 describe-security-groups --group-ids $ip_range->{GroupId} --query 'SecurityGroups[].GroupName'", { output => 1, silent => 1 });
	  $group_name =~ s/^\s+|\s+$//g;
	  print P6::Util::rprint(17, "LOCAL/$ip_range->{GroupId} ($group_name)");
	}
      }
      else {
	print P6::Util::rprint(17, "$ip_range->{UserId}/$ip_range->{GroupId}");
      }

      print "\n";
    }
  }


  return;
}

1;
