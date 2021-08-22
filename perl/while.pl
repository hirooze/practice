#! /usr/bin/perl
#This is Syntax program of while.
#
use 5.010;
use strict;
use warnings;

my $i = 1;
while ($i <= 10){
 say $i;
 ++$i;
}

while (--$i) {
 next unless $i % 2;
 say "Fight!!!\$i == $i";
}