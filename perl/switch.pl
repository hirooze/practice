#!usr/bin/perl
#This is Syntax program of Switch.pm Module.

use strict;
use warnings;
use 5.010;
use Switch;


my $val = <stdin>;
chomp $val;

switch ($val){
 case 1         {say "test 1"}
 case 2         {say "test 2"}
 else           {say "No matched"}
}
