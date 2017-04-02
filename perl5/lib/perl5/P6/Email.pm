package P6::Email;

## core
use strict;
use warnings FATAL => 'all'; no warnings qw(redefine);
use Carp;

## mp2

## libapreq2

## dist

## cpan
use MIME::Lite ();

## custom

## version
our $VERSION = q$Revision: 50616 $;

## constants

## globals

sub email {
    my %args = @_;

    my $email = MIME::Lite->new( Type => 'multipart/mixed' );

    $args{cc} =~ s/^, //;

    ($args{to}, $args{cc}, $args{bcc}) = ($Email, $Email, $Email) if $Email;

    $email->add(To      => $args{to});
    $email->add(CC      => $args{cc});
    $email->add(BCC     => $args{bcc}) if $args{bcc} ne 'none';
    $email->add(From    => $args{from});
    $email->add(Subject => $args{subject});

    debug("E-Mail: to[$args{to}], cc[$args{cc}], bcc[$args{bcc}], from[$args{from}], subject[$args{subject}]\n");

    foreach my $attachment (@{$args{attachments}}) {
      $email->attach(%$attachment)
    }
    eval { $email->send(Debug => $Verbose >= 4) };

    return $@;
}
