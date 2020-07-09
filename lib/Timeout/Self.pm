package Timeout::Self;

# AUTHORITY
# DATE
# DIST
# VERSION

# IFUNBUILT
use strict;
use warnings;
# END IFUNBUILT

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
 use Timeout::Self 30;
 # do stuffs

From the command line:

 % perl -MTimeout::Self=30 yourscript.pl


=head1 DESCRIPTION

This module lets you set a time limit on program execution, by installing a
handler in C<< $SIG{ALRM} >> that simply dies, and then calling C<alarm()> with
the specified number of seconds.

Caveat: it doesn't play perfectly nice with programs that fork. While the alarm
handler gets cloned to the child process by Perl, the alarm is not set again so
the child process will not time out. You can call alarm() again in the child
process if you want to timeout the child too.


=head1 SEE ALSO

L<Sys::RunUntil> can timeout your script by number of clock seconds or CPU
seconds. It performs C<fork()> at the beginning of program run.

Timing out a process can also be done by a supervisor process, for example see
L<Proc::Govern>, L<IPC::Run> (see C<timeout()>).

=cut
