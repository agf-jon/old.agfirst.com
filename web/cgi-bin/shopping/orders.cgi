#!/usr/local/bin/perl



require "setup.pl";



$ordernofile = $datafiles . $ordernos;



#file lock status

$EXCLUSIVE = 2;

$UNLOCK = 8;



$timedif*=3600;



($sec,$min,$hr,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time+$timedif);

$year += 1900;

$filename=sprintf("%04d%02d%02d", $year, ++$mon, $mday);



#order file

$orderfile = $datafiles . "o" . $filename . ".dat";



#open file or die

open (FILE, "+< $ordernofile") || die "Cannot open ordernofile.\n";

flock (FILE, $EXCLUSIVE) || die "Cannot flock ordernofile.\n";



$count = <FILE>;#assign count the value

chomp $count;



#set to begining of file

seek (FILE, 0, 0) || die "Cannot rewind counter file\n";



$count++; #increment

print FILE $count; #write to file



#get data

read(STDIN, $postdata, $ENV{'CONTENT_LENGTH'});

@pairs = split(/&/, $postdata);

foreach $pair (@pairs) {

    ($name, $value) = split(/=/, $pair);

    $value =~ tr/+/ /;

    $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

    $value =~ s/<(([^ >]|\n)*)>//g; #remove tags

    $FORM{$name} = $value;

}



#open or create file

unless (-e $orderfile){

   open (ORDERS, ">$orderfile") || die "Error creating orderfile.  $!\n";

} else {

   open (ORDERS, ">>$orderfile") || die "Error opening orderfile.  $!\n";

}



#lock orders file

flock ORDERS, $EXCLUSIVE;



#close counter file

close (FILE);



#be sure we are at the end

seek ORDERS, 0, 2;



foreach $key (sort(keys(%FORM))) {

   printf ORDERS ("%05d", $count);

   print ORDERS "$key=$FORM{$key}\n";

}



flock (ORDERS,$UNLOCK);

close (ORDERS);



$counttext = sprintf ("%05d", $count);



print 'Location: ' . $thankspage . '?' . $counttext . "\n\n";

