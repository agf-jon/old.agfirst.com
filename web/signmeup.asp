
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Yes! Sign me up for Account Access.</title>
</head>

<body bgColor="White">
<p align="center"><center><img src="42_banner.jpg" WIDTH="537" HEIGHT="131"> </center>
<p align="center"><b><font face="Arial" size="1"><a href="login.asp">BACK</a></font><a href="login.asp">
<BR>
</a></b></p>
<table BORDER="1" CELLSPACING="1" CELLPADDING="7" WIDTH="567" align="center" background="background.gif">
<tr><td WIDTH="27%" VALIGN="top">
  
          <div Align="CENTER"><font face="Arial" size="2"><img SRC="securekey.gif" WIDTH="36" HEIGHT="13"> 
            Information will be kept strictly confidential. This is our <a href="privacy.asp">privacy policy</a>.</font></div>
          
        
          
          <!--webbot BOT="GeneratedScript" PREVIEW=" " startspan --><script Language="JavaScript" Type="text/javascript"><!--
function FrontPage_Form1_Validator(theForm)
{

  if (theForm.F_Name.value == "")
  {
    alert("Please enter a value for the \"F_Name\" field.");
    theForm.F_Name.focus();
    return (false);
  }

  if (theForm.F_Name.value.length < 1)
  {
    alert("Please enter at least 1 characters in the \"F_Name\" field.");
    theForm.F_Name.focus();
    return (false);
  }

  if (theForm.F_Name.value.length > 20)
  {
    alert("Please enter at most 20 characters in the \"F_Name\" field.");
    theForm.F_Name.focus();
    return (false);
  }

  var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzƒŠŒŽšœžŸÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿ";
  var checkStr = theForm.F_Name.value;
  var allValid = true;
  var validGroups = true;
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
  }
  if (!allValid)
  {
    alert("Please enter only letter characters in the \"F_Name\" field.");
    theForm.F_Name.focus();
    return (false);
  }

  var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzƒŠŒŽšœžŸÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿ \t\r\n\f";
  var checkStr = theForm.MI.value;
  var allValid = true;
  var validGroups = true;
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
  }
  if (!allValid)
  {
    alert("Please enter only letter and whitespace characters in the \"MI\" field.");
    theForm.MI.focus();
    return (false);
  }

  if (theForm.L_Name.value == "")
  {
    alert("Please enter a value for the \"L_Name\" field.");
    theForm.L_Name.focus();
    return (false);
  }

  if (theForm.L_Name.value.length < 1)
  {
    alert("Please enter at least 1 characters in the \"L_Name\" field.");
    theForm.L_Name.focus();
    return (false);
  }

  if (theForm.L_Name.value.length > 20)
  {
    alert("Please enter at most 20 characters in the \"L_Name\" field.");
    theForm.L_Name.focus();
    return (false);
  }

  var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzƒŠŒŽšœžŸÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿ \t\r\n\f";
  var checkStr = theForm.L_Name.value;
  var allValid = true;
  var validGroups = true;
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
  }
  if (!allValid)
  {
    alert("Please enter only letter and whitespace characters in the \"L_Name\" field.");
    theForm.L_Name.focus();
    return (false);
  }

  if (theForm.Address1.value == "")
  {
    alert("Please enter a value for the \"Address1\" field.");
    theForm.Address1.focus();
    return (false);
  }

  if (theForm.Address1.value.length < 1)
  {
    alert("Please enter at least 1 characters in the \"Address1\" field.");
    theForm.Address1.focus();
    return (false);
  }

  if (theForm.Address1.value.length > 41)
  {
    alert("Please enter at most 41 characters in the \"Address1\" field.");
    theForm.Address1.focus();
    return (false);
  }

  if (theForm.City.value == "")
  {
    alert("Please enter a value for the \"City\" field.");
    theForm.City.focus();
    return (false);
  }

  if (theForm.City.value.length < 1)
  {
    alert("Please enter at least 1 characters in the \"City\" field.");
    theForm.City.focus();
    return (false);
  }

  if (theForm.City.value.length > 20)
  {
    alert("Please enter at most 20 characters in the \"City\" field.");
    theForm.City.focus();
    return (false);
  }

  if (theForm.State.value == "")
  {
    alert("Please enter a value for the \"State\" field.");
    theForm.State.focus();
    return (false);
  }

  if (theForm.State.value.length < 2)
  {
    alert("Please enter at least 2 characters in the \"State\" field.");
    theForm.State.focus();
    return (false);
  }

  if (theForm.State.value.length > 2)
  {
    alert("Please enter at most 2 characters in the \"State\" field.");
    theForm.State.focus();
    return (false);
  }

  var checkOK = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyzƒŠŒŽšœžŸÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿ";
  var checkStr = theForm.State.value;
  var allValid = true;
  var validGroups = true;
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
  }
  if (!allValid)
  {
    alert("Please enter only letter characters in the \"State\" field.");
    theForm.State.focus();
    return (false);
  }

  if (theForm.Zip.value == "")
  {
    alert("Please enter a value for the \"Zip\" field.");
    theForm.Zip.focus();
    return (false);
  }

  if (theForm.Zip.value.length < 5)
  {
    alert("Please enter at least 5 characters in the \"Zip\" field.");
    theForm.Zip.focus();
    return (false);
  }

  if (theForm.Zip.value.length > 5)
  {
    alert("Please enter at most 5 characters in the \"Zip\" field.");
    theForm.Zip.focus();
    return (false);
  }

  var checkOK = "0123456789-";
  var checkStr = theForm.Zip.value;
  var allValid = true;
  var validGroups = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid)
  {
    alert("Please enter only digit characters in the \"Zip\" field.");
    theForm.Zip.focus();
    return (false);
  }

  if (theForm.SSN_TIN.value == "")
  {
    alert("Please enter a value for the \"SSN_TIN\" field.");
    theForm.SSN_TIN.focus();
    return (false);
  }

  if (theForm.SSN_TIN.value.length < 9)
  {
    alert("Please enter at least 9 characters in the \"SSN_TIN\" field.");
    theForm.SSN_TIN.focus();
    return (false);
  }

  if (theForm.SSN_TIN.value.length > 9)
  {
    alert("Please enter at most 9 characters in the \"SSN_TIN\" field.");
    theForm.SSN_TIN.focus();
    return (false);
  }

  var checkOK = "0123456789-";
  var checkStr = theForm.SSN_TIN.value;
  var allValid = true;
  var validGroups = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid)
  {
    alert("Please enter only digit characters in the \"SSN_TIN\" field.");
    theForm.SSN_TIN.focus();
    return (false);
  }

  if (theForm.phone.value == "")
  {
    alert("Please enter a value for the \"phone\" field.");
    theForm.phone.focus();
    return (false);
  }

  if (theForm.phone.value.length < 9)
  {
    alert("Please enter at least 9 characters in the \"phone\" field.");
    theForm.phone.focus();
    return (false);
  }

  if (theForm.phone.value.length > 9)
  {
    alert("Please enter at most 9 characters in the \"phone\" field.");
    theForm.phone.focus();
    return (false);
  }

  var checkOK = "0123456789-";
  var checkStr = theForm.phone.value;
  var allValid = true;
  var validGroups = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid)
  {
    alert("Please enter only digit characters in the \"phone\" field.");
    theForm.phone.focus();
    return (false);
  }

  if (theForm.E_Mail.value == "")
  {
    alert("Please enter a value for the \"E_Mail\" field.");
    theForm.E_Mail.focus();
    return (false);
  }

  if (theForm.E_Mail.value.length < 1)
  {
    alert("Please enter at least 1 characters in the \"E_Mail\" field.");
    theForm.E_Mail.focus();
    return (false);
  }

  if (theForm.E_Mail.value.length > 40)
  {
    alert("Please enter at most 40 characters in the \"E_Mail\" field.");
    theForm.E_Mail.focus();
    return (false);
  }

  if (theForm.securityanswer.value == "")
  {
    alert("Please enter a value for the \"securityanswer\" field.");
    theForm.securityanswer.focus();
    return (false);
  }

  if (theForm.securityanswer.value.length < 1)
  {
    alert("Please enter at least 1 characters in the \"securityanswer\" field.");
    theForm.securityanswer.focus();
    return (false);
  }

  if (theForm.securityanswer.value.length > 40)
  {
    alert("Please enter at most 40 characters in the \"securityanswer\" field.");
    theForm.securityanswer.focus();
    return (false);
  }
  return (true);
}
//--></script><!--webbot BOT="GeneratedScript" endspan --><form action="process.asp" method="POST" id="form1" onsubmit="return FrontPage_Form1_Validator(this)" name="FrontPage_Form1" language="JavaScript">
          <input type="hidden" name="Aca" value="42">
          <div align="center">
          <table border="0" width="500" cellpadding="4" height="319" bgcolor="#E7E7D6">
            <tr>
             <td colspan="3" height="33" align="center"><b><font face="Arial" size="4">Yes! Sign me up for Account
              Access.</font>
              </b></td>
            </tr>
            <center>
            <tr>
             <td colspan="3" height="45" valign="top">
              <p style="word-spacing: 0; margin: 0"><b><font face="Arial" size="2">We
              will send you an email which will direct you to a secure site
              where you will obtain your password.</font></b></td>
            </tr>
          <tr>
              <td width="79" height="30"><font face="Arial" size="1">First Name:<!--webbot
                bot="Validation" S-Data-Type="String" B-Allow-Letters="TRUE"
                B-Value-Required="TRUE" I-Minimum-Length="1"
                I-Maximum-Length="20" --><input id="text2" name="F_Name" size="20" maxlength="20"></font></td>
              <td width="78" height="30"><font face="Arial" size="1">MI:<br>
                <!--webbot bot="Validation" S-Data-Type="String"
                B-Allow-Letters="TRUE" B-Allow-WhiteSpace="TRUE" --><input type="text" id="text14" name="MI" size="1"></font></td>
              <td width="177" height="30"><font face="Arial" size="1">Last Name<br>
                <!--webbot bot="Validation" S-Data-Type="String"
                B-Allow-Letters="TRUE" B-Allow-WhiteSpace="TRUE"
                B-Value-Required="TRUE" I-Minimum-Length="1"
                I-Maximum-Length="20" --><input id="text3" name="L_Name" size="20" maxlength="20"></font></td>
          </tr>
          <tr>
             <td width="340" colspan="3" height="30"><font face="Arial" size="1">Name of Business: (If
              Applicable)&nbsp;<br>
              <input id="text1" name="Bus_Name" style="HEIGHT: 22px; WIDTH: 393px" size="60"></font></td>
          </tr>
          <tr>
              <td width="340" colspan="3" height="30"><font face="Arial" size="1">Street/Mailing Address:<br>
                <!--webbot bot="Validation" B-Value-Required="TRUE"
                I-Minimum-Length="1" I-Maximum-Length="41" --><input id="text4" name="Address1" size="41" maxlength="41"></font></td>
          </tr>
          <tr>
              <td width="81" height="30"><font face="Arial" size="1">City:<br>
                </font><font face="Arial" size="2"><!--webbot bot="Validation"
                B-Value-Required="TRUE" I-Minimum-Length="1"
                I-Maximum-Length="20" --><input id="text6" name="City" size="20" maxlength="20"></font></td>
              <td width="141" height="30"><font face="Arial" size="1">State:<br>
                </font><font face="Arial" size="2"><!--webbot bot="Validation"
                S-Data-Type="String" B-Allow-Letters="TRUE"
                B-Value-Required="TRUE" I-Minimum-Length="2"
                I-Maximum-Length="2" --><input id="text7" name="State" style="HEIGHT: 22px; WIDTH: 41px" size="2" maxlength="2"></font></td>
              <td width="112" height="30"><font face="Arial" size="1">Zip Code:<br>
                </font><font face="Arial" size="2"><!--webbot bot="Validation"
                S-Data-Type="Integer" S-Number-Separators="x"
                B-Value-Required="TRUE" I-Minimum-Length="5"
                I-Maximum-Length="5" --><input id="text8" name="Zip" style="HEIGHT: 22px; WIDTH: 92px" size="5" maxlength="5"></font></td>
          </tr>
           
          </table>
          
            </center>
          </div>
          <div align="center">
            <center>
          
          <table border="0" width="500" height="208" bgcolor="#E7E7D6" cellpadding="4">
          <tr>
             <td width="584" colspan="3" height="30"><b>
              <font face="Arial" size="1" color="#990000">
              Please enter the Taxpayer ID               number of the business or the Social Security Number of the Primary Borrower.&nbsp;
              The Primary Borrower is the first person listed on the billing
              statement.</font></b></td>
            </tr>

          <tr>
              <td width="154" height="25"><font face="Arial" size="1">Social
                Security/Taxpayer ID
                Number:&nbsp; <font color="#990000">(No
                Dashes)<br>
                </font><!--webbot bot="Validation" S-Data-Type="Integer"
                S-Number-Separators="x" B-Value-Required="TRUE"
                I-Minimum-Length="9" I-Maximum-Length="9" --><input id="text9" name="SSN_TIN" size="9" maxlength="9"></font></td>
              <td width="127" valign="top" height="25"><font face="Arial" size="1">Daytime
                Phone&nbsp;<br>
                <!--webbot bot="Validation" S-Data-Type="Integer"
                S-Number-Separators="x" B-Value-Required="TRUE"
                I-Minimum-Length="9" I-Maximum-Length="9" --><input id="text16" name="phone" size="11" maxlength="9"></font></td>
              <td width="279" valign="top" height="25"><font face="Arial" size="1">Your
                email address&nbsp;<br>
                <!--webbot bot="Validation" B-Value-Required="TRUE"
                I-Minimum-Length="1" I-Maximum-Length="40" --><input id="text12" name="E_Mail" size="35" maxlength="40"></font></td>
            </tr>

            <tr>
              <td width="584" colspan="3" height="25"><font face="Arial" size="1">Enter
                a loan number from your billing statement &nbsp;</font><input type="text" name="loanumber1" size="2"><input type="text" name="loanumber2" size="3"><input type="text" name="loannumber3" size="3"><input type="text" name="loannumber4" size="10"></td>
            </tr>
            <tr>
              <td width="584" colspan="3" height="21"><font face="Arial" size="1"><b>For
                security purposes only, please answer the following question.</b>
                The correct response to this question will allow us to remind
                you of your password should you ever forget it.&nbsp;</font></td>
            </tr>
            <tr>
              <td width="584" colspan="3" height="25" valign="middle"><font face="Arial" size="1"><b>What
                is your mother's maiden name? </b><!--webbot bot="Validation"
                B-Value-Required="TRUE" I-Minimum-Length="1"
                I-Maximum-Length="40" --><input id="text17" name="securityanswer" size="35" maxlength="40"></font></td>
            </tr>
            <tr>
              <td width="584" colspan="3" height="25">&nbsp;</td>
            </tr>
            <tr>
              <td width="584" colspan="3" height="25">
                <p align="center"><input type="submit" value="Submit" id="submit1" name="submit1" style="background-color: #990000; color: #FFFFFF"><input type="reset" value="Reset" id="reset1" name="reset1" style="background-color: #990000; color: #FFFFFF"></td>
            </tr>
          </table>
            
            </center>
          </div>
          <center>&nbsp;&nbsp;</center>
         </form> 
          
</td>
</tr>

</table>

<div align="center"><strong><a HREF="login.asp"><font face="Arial" size="1">Back</font></a></strong></div>
<font face="Arial" size="1">
<center>Send mail to <a href="mailto:abuddin@peedeefarmcredit.com?subject=Questions and Comments about Pee Dee Farm Credit Online Account Information.">abuddin@peedeefarmcredit.com</a> 
 with questions or comments about this web site<br>
Copyright © 2000&nbsp;
Pee Dee Farm Credit</center></font>


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
