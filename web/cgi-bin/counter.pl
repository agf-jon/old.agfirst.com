#!/usr/bin/perl
$countfile = "cgi-bin\\counter.txt"; 
if (open (COUNT,"$countfile")) {    $count = <COUNT>;
$count =~ s/\n$//;
close(COUNT);
}$count++;
open (COUNT,">$countfile") || die "Can't create count file: $!\n";
print COUNT $count;
close(COUNT);
print "\n\n";
print $count;
