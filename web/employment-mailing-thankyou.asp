<%

Contact_FirstName=Request.Form("yourname")
Contact_Email=Request.Form("email")
vmail=Request.Form("vmail")
%>
<% If vmail = "yes" Then
	Response.Write("")
Else
	Response.Write("FORM SUBMIT NOT VALIDATED")
End If
%>
<% If vmail = "yes" Then
Set myMail=CreateObject("CDO.Message")
myMail.Subject="AgFirst Employment Mailing List Request"
myMail.From="no-reply@agfirst.com"
myMail.To="cmccroskey@agfirst.com"
'myMail.To="james.whittington@vc3.com"
myMail.Bcc="photo@onepixelworld.com"
myMail.TextBody="The following person has requested to be added to AgFirst's Employment Mailing List:" & vbNewline & vbNewline & _
 "Name: " & Contact_FirstName & "" & vbNewline & vbNewline & _
 "Email Address: " & Contact_Email & "" & vbNewline & vbNewline & _
 ""
myMail.Send
set myMail=nothing
Else
	Response.Write("")
End If
%>
<%
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>AgFirst Farm Credit Bank</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #cbcbcb;
}
-->
</style>
<style type="text/css">
<!--
.style5 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	color: #626a4d;
}
.styleD {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 17px;
	color: #7D6E48;
}
.style11 {font-size: 18px; color: #00226A; font-family: Times New Roman, Times, serif;}
.style12 {font-size: 20px}
-->
        </style>
<link href="agfirst-style2.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style13 {color: #6389AB}
.style14 {color: #00226A}
.style15 {color: #990000}
.style3 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
}
-->
</style>
</head>
<body onLoad="MM_preloadImages('images/btn-news2.jpg','images/btn-account2.jpg','images/btn-news-finance2.jpg','images/btn-correspondent2.jpg','images/text-news.jpg','images/text-account.jpg','images/text-financials.jpg','images/text-home-loans.jpg','images2/btn-sm-about2.jpg','images2/btn-sm-news2.jpg','images2/btn-sm-capital2.jpg','images2/btn-sm-correspondent2.jpg','images2/btn-sm-find-lender2.jpg')">
<table width="848" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><table width="828" border="0" align="center" cellpadding="0" cellspacing="0" background="images/bg-center.jpg" bgcolor="#FFFFFF">
      <tr>
        <td><img src="images/1.jpg" width="828" height="23" /></td>
      </tr>
      <tr>
        <td><img src="images/new-home-header.jpg" width="828" height="94" border="0" usemap="#Map" /></td>
      </tr>
      <tr>
        <td><br />
          <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="55" valign="top"><a href="about.html" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','images2/btn-sm-about2.jpg',1)"><img src="images2/btn-sm-about.jpg" name="Image16" width="263" height="32" border="0" id="Image16" /></a><a href="financial-reports.html" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image17','','images2/btn-sm-news2.jpg',1)"><img src="images2/btn-sm-news.jpg" name="Image17" width="263" height="29" border="0" id="Image17" /></a><a href="capital-markets.html" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image18','','images2/btn-sm-capital2.jpg',1)"><img src="images2/btn-sm-capital.jpg" name="Image18" width="263" height="29" border="0" id="Image18" /></a><a href="correspondent-lending.html" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image19','','images2/btn-sm-correspondent2.jpg',1)"><img src="images2/btn-sm-correspondent.jpg" name="Image19" width="263" height="29" border="0" id="Image19" /></a><a href="find-a-lender.html" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image20','','images2/btn-sm-find-lender2.jpg',1)"><img src="images2/btn-sm-find-lender.jpg" name="Image20" width="263" height="29" border="0" id="Image20" /></a><img src="images2/btn-menu2-blank6.jpg" /></td>
            <td width="11" valign="top"><img src="images/spacer.gif" width="4" height="200" /></td>
            <td width="494" valign="top"><table width="437" height="144" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td><img src="images2/photo-grapes.jpg" width="472" height="173" /></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td valign="top">&nbsp;</td>
            <td valign="top">&nbsp;</td>
            <td valign="top"><table width="460" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td valign="top"><p class="style11"><span class="style11"><span class="style12">E</span>MPLOYMENT MAILING LIST</span></p>
                  <div align="justify">
                  <p align="center" class="style3">Thank you for your request. 
                      Your email will <br>
                      be added to 
                      our employment mailing list.</p>
                    <p align="center" class="style3">&nbsp;</p>
                    <p align="center" class="style3">&nbsp;</p>
                    <p align="center" class="style3"><br>
                        <br>
                    </p>
                  </div>                  <p class="style11">&nbsp;</p></td>
              </tr>
            </table></td>
          </tr>
        </table>          </td>
      </tr>
      <tr>
        <td><img src="images/btm-div.jpg" width="828" height="19" /></td>
      </tr>
      <tr>
        <td align="center" class="general"><a href="links-disclaimer.html" class="style14">LINKS</a><span class="style13"> | </span><a href="privacy-policy.html">PRIVACY POLICY</a><span class="style13"> | </span><a href="equal-housing-lender.html">EQUAL HOUSING LENDER</a><span class="style13"> | </span><a href="equal-housing-lender.html">EQUAL CREDIT OPPORTUNITY LENDER </a><span class="style13"> | </span><a href="equal-housing-lender.html">EQUAL OPPORTUNITY  EMPLOYER</a></td>
      </tr>
      <tr>
        <td align="center" class="general">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" class="general"><a href="index.asp">? 2009 AgFirst Farm Credit Bank. All rights reserved</a><a href="#"></a><br />
          <br /></td>
      </tr>
      <tr>
        <td align="center" bgcolor="CDC08C" class="general"><img src="images/footer.jpg" width="828" height="15" /></td>
      </tr>
    </table>
    </td>
  </tr>
</table>

<map name="Map" id="Map">
<area shape="rect" coords="688,72,773,91" href="contact.html" />
<area shape="rect" coords="441,71,674,91" href="ssmuaccountaccess.html" />
<area shape="rect" coords="248,71,429,91" href="employment.html" />
<area shape="rect" coords="12,3,235,91" href="index.asp" />
</map>
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
