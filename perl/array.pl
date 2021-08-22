#!usr/bin/perl
#This is Syntax program of Array.

use strict;
use warnings;
use 5.010;

#配列の定義
my @array;
$array[0] = "test1";
$array[1] = "test2";
$array[2] = "test3";
say "@array";

#配列の定義（どっちでもできる）
my @colors = ("green" , "yellow" , "red");
say "signal is @colors";

#配列の定義（どっちでもできる）
my ($left, $center, $right) = @colors;
say "left signal is $left";
say "center signal is $center";
say "right signal is $right";

my $num = 1;

#通常書式の配列
#my @month = (undef, "Jan", "Feb" , "Mar" , "Apr" , "May" , "Jun" , "Jul" , "Aug" , "Sep" , "Oct" , "Nov" , "Dec");

#qw演算子を使った配列の書式
my @month = qw/ undef jan feb mar apr may jun jul aug sep oct nov dec /;
#※ただし、半角スペースが入ったら区切られるため、一続きの文字じゃないとダメ
#※スラッシュを書くと配列が終わる
#※始めと終わりの区切り文字は「/」でなくても、同じ文字であれば何でもよい

#ドットドット演算子（..）
my @ary_month = @month[1..2];
my @ber_month = @month[9..12];

say "aryが付く月は@ary_month、berが付く月は@ber_monthです";

#マジックインクリメント
my @arr1 = "a".."z";
my @arr2 = "aa".."zz";

#リストコンテキスト
say "List Context";
say "\@arr1:@arr1";
say "\@arr2:@arr2";

#スカラーコンテキスト
say "Scalar Context";
say "\@arr1:", @arr1 + 0;
say "\@arr2:", @arr2 + 0;

#scalar関数による強制スカラーコンテキスト
say "\@arr1:", scalar @arr1;
say "\@arr2:", scalar @arr2;

