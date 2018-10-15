#!/usr/local/bin/perl



require "setup.pl";



$bodytag = '<body><div align="center">' . $mypagetitle . '</div>';

$mystylesheet = '<LINK REL=stylesheet HREF="' . $miscfiles . 'style.css" TYPE="text/css">';



&getvalues;

%cookies = &getcookies;

$goodcookie="";



if ($cookies{"admin"} eq "okay"){

   if($FORM{'action'} eq 'display'){

      &displaydata;}

   elsif($FORM{'action'} eq 'delete'){

      &deletefile;}

   else{

      &displaylist;

   }

}

else{

   if($FORM{'action'} eq 'verify'){

      &verifydata;

   }

   else{

      &passwordpage("Enter your userid and password.");

   }

}



sub passwordpage {

my $messageout = $_[0];



print "Content-type:text/html\n\n";



print <<"HTMLCODE";



<html>

<head>

$mystylesheet

<title>Entry Page</title>

</head>

$bodytag

$messageout<br>

<form method="post" action="admin.cgi">

<input type="hidden" name="action" value="verify">

<table border=0>

<tr>

<td>Enter your user name here:</td><td><input type="text" name="username" size="20" maxlength="80"></td>

</tr>

<tr>

<td>Enter your password here:</td><td><input type="password" name="password" size="20" maxlength="80"></td>

</tr>

</table>

<input type="submit" value="Submit">

</form>

</body>

</html>



HTMLCODE

}



sub verifydata {



if(($FORM{'username'} eq $myusername) && ($FORM{'password'} eq $mypassword)){

   print "Set-Cookie: admin=okay\n";

   &displaylist;

}

else{

   &passwordpage("Re-enter your userid and password.");

}



}



sub displaylist{



opendir(DIR, $datafiles);

@files = sort(grep(/\.dat$/, readdir(DIR)));

closedir(DIR);



print "Content-type:text/html\n\n";



print <<"HTMLCODE";

<html>

<head>

$mystylesheet

<script>

function displaydata(filein){

   document.postform.filedate.value=filein;

   document.postform.submit();

}

</script>

<title>List Of Days With Orders</title>

</head>

$bodytag

Click on the day you wish to view orders for.<p>

<form name="postform" method="post" action="admin.cgi">

<input type="hidden" name="action" value="display">

<input type="hidden" name="filedate">

</form>

HTMLCODE



foreach (@files) {

   my $filedate = substr($_,1,8);

   print '<a href="javascript:displaydata(';

   print "'" . $filedate . "'";

   print ')">';

   print substr($_,1,4) . "-" . substr($_,5,2) . "-" . substr($_,7,2);

   print '</a><br>';

}



print '<br> </body></html>';



}



sub displaydata{



#file location

my $filedate = $FORM{'filedate'};



$timedif*=3600;



my ($sec,$min,$hr,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time+$timedif);

my $longyr = $year + 1900;

my $filename=sprintf("%04d%02d%02d", $longyr, ++$mon, $mday);

my $subtitle=substr($filedate,0,4) . "-" . substr($filedate,4,2) . "-" . substr($filedate,6,2);



my $mybutton = '';

if($filedate ne $filename){

   $mybutton = '<input type="hidden" name="action" value="delete">';

   $mybutton = $mybutton . '<input type="button" value="Delete Orders" onClick="subdelete(this.form);">';

}



$filename = 'o' . $filedate . '.dat';

$orderfile = $datafiles . $filename;



#read data

open(INFO, $orderfile) || die "Can't open orderfile.\n";

@datalines = <INFO>;

close(INFO);



print "Content-type:text/html\n\n";



print <<"HTMLCODE";

<html>

<head>

$mystylesheet

<script>

function subdelete(formin){

   if(confirm("Are you sure you want to delete all orders for this day?")){

      formin.submit();

   }

}

</script>

<title>Orders</title>

</head>

$bodytag

<center><b>$subtitle</b></center>

<form name="dataform" method="post" action="admin.cgi">

<input type="hidden" name="deletefile" value="$filedate">

$mybutton

</form>

HTMLCODE



my $prevval = '00000';

my $curval = '';

my $prevtype = '';

my $curtype = '';



foreach(@datalines){

   $curtype = substr($_,5,1);

   $curval = substr($_,0,5);

   my $rowdata = substr($_,8);

   my ($rowdata1,$rowdata2) = split(/=/,$rowdata);



   if($curtype eq 'o'){

      if($prevtype ne 'o'){

         print '<tr><td colspan=2><table border=1 cellspacing=0 cellpadding=2>';

         print '<tr><th class=order>Product Id</th><th class=order>Product Name</th><th class=order>Options</th><th class=order>Price</th><th class=order>Quantity</th><th class=order>Item Total</th></tr>';

      }

      print '<tr valign="top">';

      $rowdata2 =~ s/²/<\/td><td class=order>/g;

      $rowdata2 =~ s/<td class=order>r;/<td align="right" class=order>/g;

      $rowdata2 =~ s/<td class=order>c;/<td align="center" class=order>/g;

      $rowdata2 =~ s/³/<br>/g;

      print '<td class=order>' . $rowdata2 . '</td>';

      print '</tr>';

   }

   else{

      if($prevtype eq 'o'){

         print '</table></td></tr>';

      }

      if($prevval ne $curval){

         if($prevval ne '00000'){

            print '</table><hr>';

         }

         print '<table border=0 cellspacing=1 cellpadding=1>';

         print '<tr><td colspan="2"><b>Order No: ' . $curval . '</b></td><td></td></tr>';

         $prevval = $curval;

      }

      if($curtype eq 's'){

         print '<tr valign="top">';

         $rowdata2 =~ s/²/<\/td><td class=order>/g;

         $rowdata2 =~ s/<td class=order>r;/<td align="right" class=order>/g;

         print '<td class=order>' . $rowdata2 . '</td>';

         print '</tr>';

      }

      else{

         print '<tr valign="top"><td class=order>' . $rowdata1 . '</td><td class=order>' . $rowdata2 . '</td></tr>';

      }

   }



   $prevtype = $curtype;

}



print <<"HTMLCODE";

</table>

<p>

<div><a href="admin.cgi">List Of Days With Orders</a></div>

<br>&nbsp;

</body>

</html>

HTMLCODE



}



sub filecheck{

my $filetofind = $_[0];

my $filefound = 'N';



opendir(DIR, $datafiles);

@files = sort(grep(/\.dat$/, readdir(DIR)));

closedir(DIR);



foreach (@files) {

   if($filetofind eq $_){

      $filefound = 'Y';

   }

}



return $filefound;

}



sub deletefile{



my $delfile = $FORM{'deletefile'};



$delfile = 'o' . $delfile . '.dat';



if(filecheck($delfile) eq 'Y'){

   $delfile = $datafiles . $delfile;

   $delcnt = unlink $delfile;

}



&displaylist;



}



sub getvalues{

%FORM;



read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});

@pairs = split(/&/, $buffer);



foreach $pair (@pairs) {

   ($name, $value) = split(/=/, $pair);

   $value =~ tr/+/ /;

   $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;

   $FORM{$name} = $value;

}



}



sub getcookies {

   my @cookiearray = split (/; /,$ENV{'HTTP_COOKIE'});

   my %cookies;

   foreach(@cookiearray){

      ($key, $val) = split (/=/,$_);

      $cookies{$key} = $val;

   } 

   return %cookies; 

} 

