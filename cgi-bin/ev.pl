#!/usr/local/bin/perl 
print "Content-type: text/html\n\n";
print <<HTML;
<html>
<link rel="stylesheet" type="text/css" href="/reference/index.css">
<head>
<title>CGI Environment</title>
</head>
<body bgcolor="white">
<blockquote>
<p>
<div align="right"><h2>cgi environment</h2>
</div><hr>
<blockquote>
HTML
foreach $env_var (keys %ENV) {
print "<B>$env_var</B> = $ENV{$env_var}<BR>\n";
}
print "</blockquote></blockquote></body></html>\n";
