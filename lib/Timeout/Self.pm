package Timeout::Self;

# DATE
# VERSION

sub import {
    my $package = shift;
    die "Please specify timeout value" unless @_;
    $SIG{ALRM} = sub { die "Timeout\n" };
    alarm(shift);
}

1;
# ABSTRACT: Run alarm() at the start of program to timeout run

=head1 SYNOPSIS

In a script:

 # run for at most 30 seconds
 use Timeout::Self qw(30);

From the command line:

 % perl -MTimeout::Self=30 yourscript.pl


=head1 DESCRIPTION

This module simply installs a $SIG{ALRM} that dies, and an alarm() call with a
certain value.

=cut
