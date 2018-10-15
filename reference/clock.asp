<%@ LANGUAGE="VBSCRIPT" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="index.css">
	<title>clock</title>
<meta HTTP-EQUIV="Refresh" CONTENT="5;URL=clock.asp">
</head>
<body bgcolor="white">

<blockquote>
<div align="right"><h2>asp clock</h2></div><hr>
<ul>
	<li>clock should refresh every 5 seconds.
</ul>
<blockquote>
    <span style="font-size:16pt"><%= Now %></span>
	<p><% For i = 9 To 14 %><span style="font-size: <% = i %>pt"><p>it is <b>working</b>
	<br></span>
	<% Next %>
</blockquote>
</blockquote>

<!-- Google Analytics Tracking Code -->

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-34898365-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

<!-- End Google Analytics Tracking Code -->

</body>
</html>
