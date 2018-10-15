<html>
<head>
<link rel="stylesheet" type="text/css" href="index.css">
<script language="VBScript">
<!--
Function FeedbackForm_OnSubmit()
     '--- Disallow submit until the form fields have been validated
	 FeedbackForm_OnSubmit = False
	 
	 '--- Get a reference to the form
	 Set theForm = Document.FeedbackForm
	 
	 '--- First, check that UserName has been filled in
	 If Trim(theForm.UserName.Value) = "" Then
	      MsgBox "Enter your name.", vbCritical, "Need output"
		  theForm.UserName.Focus
	 Else
	    '--- Next, check for the e-mail name
	 If Trim(theForm.UserEmail.Value) = "" Then
	    MsgBox "Enter your e-mail address.", vbCritical, "Need output"
        theForm.UserEmail.Focus
	 Else
	    '---Conyinue with submission
		FeedbackForm_OnSubmit = True
	    End If
     End If
End Function
-->
</script>
	<title>asp mail</title>
</head>
<body bgcolor="white">
<blockquote>
<div align="right"><h2>asp mail</h2></div><hr>
	<ul>
	<li>Please submit the form. <br>If server supports CDO you will
	receive e-mail confirmation in few minutes.
	</ul>
	<blockquote>
	<form name="FeedbackForm" action="confirm.asp" method="POST">
	<table cellspacing="6">
	<tr><td>Name</td><td><input type="TEXT" name="UserName" align="middle" size="25"> <span style="color:red">*</span></td></tr>
	<tr><td>E-Mail</td><td><input type="TEXT" name="UserEmail" align="middle" size="25"> <span style="color:red">*</span></td></tr>
	<tr><td></td><td><input align="middle" type="SUBMIT" value="Submit"><input align="middle" type="RESET" value="Clear"></td></tr>
	</table>
  </blockquote>

</form>
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
