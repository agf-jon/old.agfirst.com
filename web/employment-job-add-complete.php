<?php require_once('../../../Connections/onepixel.php'); ?>
<?php
// Insert a row of information into the table "example"
$title = $_POST['title'];
$position = $_POST['position'];
$description = $_POST['description'];
$responsibilities = $_POST['responsibilities'];
$requirements = $_POST['requirements'];
$salary = $_POST['salary'];
$mailing = $_POST['mailing'];
$location = $_POST['location'];
$email = $_POST['email'];
  $dbSelect = mysql_select_db('onepixel') or die("This database does not exist."); 
  $insertSQL = "INSERT INTO agfirst_hr_employment (title, position, description, responsibilities, requirements, salary, mailing, location, email) VALUES ('$title', '$position', '$description', '$responsibilities', '$requirements', '$salary', '$mailing', '$location', '$email')";
  $result = mysql_query($insertSQL);
?>
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
	font-family: "Times New Roman", Times, serif;
	font-size: 14px;
	color: #626a4d;
}
.styleD {
	font-family: "Times New Roman", Times, serif;
	font-size: 17px;
	color: #7D6E48;
}
.style11 {font-size: 18px; color: #00226A; font-family: "Times New Roman", Times, serif;}
.style12 {font-size: 20px}
-->
</style>
<link href="../agfirst-style2.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style13 {color: #6389AB}
.style14 {color: #00226A}
.style20 {color: #626a4d}
.style8 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;}
-->
</style>
</head>
<body>
<table width="848" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><table width="828" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/bg-center.jpg" bgcolor="#FFFFFF">
      <tr>
        <td><img src="../images/1.jpg" width="828" height="23" /></td>
      </tr>
      <tr>
        <td><img src="../images/new-home-header.jpg" width="828" height="94" border="0" usemap="#Map" /></td>
      </tr>
      <tr>
        <td><br />
          <table width="710" border="0" align="center" cellpadding="2" cellspacing="2">
            <tr>
              <td width="300" valign="top"><table width="210" border="0" align="center" cellpadding="2" cellspacing="2">
                <tr>
                  <td><a href="employment-job-view.php"><span class="style12">V</span>IEW<span class="style12"> A</span>LL <span class="style12">J</span>OBS</a></td>
                </tr>
              </table></td>
              <td><table width="510" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><img src="images/form-top.gif" width="510" height="35"></td>
                </tr>
                <tr>
                  <td height="333" valign="top" background="images/bg-form.gif" bgcolor="F7F7F6"><table width='444' border='0' align='center' cellpadding='0' cellspacing='0'>
                    <tr>
                      <td width='760' align="center"><p class="style8"> <?php echo "New Job Opportunity: ".$title." has been posted"; ?> </p></td>
                    </tr>
                    <tr>
                      <td align="center"><a href="employment-job-view.php" class="style14">VIEW ALL JOBS</a></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td><img src="images/form-btm.gif" width="510" height="35"></td>
                </tr>
              </table></td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td><img src="../images/btm-div.jpg" width="828" height="19" /></td>
      </tr>
      <tr>
        <td align="center" class="general"><a href="../links-disclaimer.html" class="style14">LINKS</a><span class="style13"> | </span><a href="../privacy-policy.html">PRIVACY POLICY</a><span class="style13"> | </span><a href="../equal-housing-lender.html">EQUAL HOUSING LENDER</a><span class="style13"> | </span><a href="../equal-housing-lender.html">EQUAL CREDIT OPPORTUNITY LENDER </a><span class="style13"> | </span><a href="../equal-housing-lender.html">EQUAL OPPORTUNITY  EMPLOYER</a></td>
      </tr>
      <tr>
        <td align="center" class="general">&nbsp;</td>
      </tr>
      <tr>
        <td align="center" class="general"><a href="../index.html">© 2009 AgFirst Farm Credit Bank. All rights reserved</a><a href="#"></a><br />
          <br /></td>
      </tr>
      <tr>
        <td align="center" bgcolor="CDC08C" class="general"><img src="../images/footer.jpg" width="828" height="15" /></td>
      </tr>
    </table>
    </td>
  </tr>
</table>

<map name="Map" id="Map">
<area shape="rect" coords="688,72,773,91" href="../contact.html" />
<area shape="rect" coords="441,71,674,91" href="http://agfirst.com/smmuaccountaccess.htm" />
<area shape="rect" coords="248,71,429,91" href="../employment.html" />
<area shape="rect" coords="12,3,235,91" href="../index.html" />
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
