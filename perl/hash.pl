#!usr/bin/perl
#This is Syntax program of hash.

use strict;
use warnings;
use 5.010;

my %hash;
$hash{1} = ",01";
$hash{2} = ",02";
$hash{5} = ",five";

my @test = @hash {"5" , "2" , "1"};
say @test;
