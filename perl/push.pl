#!usr/bin/perl
#This is Syntax program of push.

use strict;
use warnings;
use 5.010;

my @revfind;
$revfind[0]=10;
$revfind[1]=13;
$revfind[2]=22;
$revfind[3]=54;
my @showlog;

for (my $i = 0 ; $i < 4 ; ++$i){
 chomp $revfind[$i];
 push @showlog, "$revfind[$i] ";
 say @showlog
}
