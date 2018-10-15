<?php require_once('../../../Connections/onepixel.php'); ?>
<?php
session_start();
//echo  $_SESSION['vcheck'];
//echo  "sdfasdf";
if($_SESSION['vcheck'] != 'AgFirstJobs'){header("Location: invalid.php");}
$title = $_POST['title'];
$responsibilities = $_POST['responsibilities'];
$requirements = $_POST['requirements'];
$salary = $_POST['salary'];
$mailing = $_POST['mailing'];
$location = $_POST['location'];
$email = $_POST['email'];
  $dbSelect = mysql_select_db('onepixel') or die("This database does not exist."); 
$query = "SELECT * FROM `agfirst_hr_employment` ORDER BY Location ASC";
$result = mysql_query($query) or die(mysql_error()); 
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
.style8 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;}
.style22 {color: #626a4d}
-->
</style>
<script type="text/javascript" src="slideh.js">
</script>
<link href="button-style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="slide.css" type="text/css" />
</head>
<body onLoad="start();changeText()">
<div id="smenu"><div id="sleft">
<table width="304" border="0"  bordercolor="#CCCCCC" cellspacing="0" cellpadding="0" style="tinytableopacity">
  <tr>
    <td width="217" height="298" valign="top"><table width="217" height="289" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="26" valign="top" background="bg-menu.gif" bgcolor="#2E5073"><img src="images/cms-help-top.gif" width="217" height="26" /></td>
      </tr>
      <tr>
        <td height="257" align="center" valign="top" background="images/cms-help-bg.gif" bgcolor="2E5073"><table width="98%" border="0" align="right" cellpadding="2" cellspacing="2">
          <tr>
            <td align="center"><img src="images/menu-title.jpg" width="194" height="56" /></td>
          </tr>
          <tr>
            <td align="center"><p class="navigation"><a href="employment-job-add.php">ADD NEW POSITION</a></p></td>
          </tr>
          <tr>
            <td valign="top"><span class="general"><BR>
              <B><font color="#FFFFFF">To ADD a NEW POSITION</font></B><BR>
               Click the ADD NEW POSITION button.<br />
            </span></td>
          </tr>
          <tr>
            <td><span class="general"><BR><B><font color="#FFFFFF">To EDIT or UPDATE A POSITION</font></B><BR>
               Click the TITLE to edit or update job listing.</span></td>
          </tr>
          <tr>
            <td><span class="general"><BR><B><font color="#FFFFFF">To DELETE A POSITION</font></B><BR> 
              Click the corresponding DELETE button.</span>
                <span class="general"><BR>
                <BR><B><font color="#FFFFFF">To HIDE these instructions</font></B><BR>Click the HELP MENU TAB.</span>
                <span class="general"><BR><BR><B><font color="#FFFFFF">To LOGOUT</font></B><BR>Close this Window.</span></td>
          </tr>
          <tr>
            <td align="center"><span class="general"><font size=1>Internet Explorer 7.0 and higher or FireFox 2.0 and higher are recommended when using this application.</font></span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="38" style="background-image:url(images/cms-help-bg.gif); filter: alpha (opacity=50); -moz-opacity:.50;">&nbsp;</td>
      </tr>
    </table>
    </td>
    <td width="200" valign="top"><img src="images/cms-help.gif" width="87" height="289" border="0" usemap="#Map"></td>
  </tr>
</table><map name="Map" id="Map"><area shape="rect" coords="6,24,76,268" href="#" onClick="return slide();return false;"/></map>
</div></div>
<table width="848" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td><table width="828" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/bg-center.jpg" bgcolor="#FFFFFF">
      <tr>
        <td><img src="../images/1.jpg" width="828" height="23" /></td>
      </tr>
      <tr>
        <td><img src="../images/new-home-header.jpg" width="828" height="94" border="0" usemap="#Map1"/></td>
      </tr>
      <tr>
        <td><br />
          <table width="710" border="0" align="center" cellpadding="2" cellspacing="2">
            <tr>
              <td width="300" valign="top"><table width="210" border="0" align="center" cellpadding="2" cellspacing="2">
                <tr>
                  <td><span class="style11"><a href="employment-job-add.php"><span class="style12">A</span>DD<span class="style12"> N</span>EW <span class="style12">P</span>OSITION</a></span></td>
                </tr>
                
              </table></td>
              <td><table width="510" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><img src="images/form-top.gif" width="510" height="35"></td>
                </tr>
                <tr>
                  <td height="333" valign="top" background="images/bg-form.gif" bgcolor="F7F7F6"><table width="480" border="0" align="center" cellpadding="2" cellspacing="2">
                    <tr>
                      <td align="center"><font face="Verdana,Geneva,Arial,Helvetica" size="2"><span class="style5"><span class="style12">EMPLOYMENT OPPORTUNITIES LISTING</span></span></font></td>
                      </tr>
                  </table>
                    <table width="480" border="0" align="center" cellpadding="2" cellspacing="2">
                      <tr>
                        <td width="320" align="center" valign="top" class="style8">TITLE </td>
                        <td width="90" valign="top"><span class="style8">POSITION#</span></td>
                        <td width="80" valign="top" nowrap><span class="style8">| LOCATION</span></td>
                        <td width="70" valign="top" nowrap><span class="style8">| DELETE</span></td>
                      </tr>
                      <?php while($row = mysql_fetch_array($result)) {; echo '
					<tr onMouseOver="this.className = \'hlt\';" onMouseOut="this.className = \'\';" >
                      <td><p class="navigation3"><a href="employment-job-edit.php?cmark='.$row[cmark].'"	>'.$row[title].'</a></p></td>
                      <td>| '.$row[Position].'</td>
                      <td>| '.$row[Location].'</td>
                      <td><p class="navigation2"><a href="employment-job-remove-complete.php?cmark='.$row[cmark].'&title='.$row[title].'" onClick="return confirm(\'Please verify you would like to DELETE the following \n  \n Title: '.$row[title].'  \n Position: '.$row[Position].' \n \')">Delete</a></p></td>
                    </tr>'; } ?>
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
<map name="Map1" id="Map1">
<area shape="rect" coords="688,72,773,91" href="../contact.html" />
<area shape="rect" coords="441,79,674,99" href="http://agfirst.com/smmuaccountaccess.htm" />
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
<script type="text/javascript">
function changeText(){
	return slide();return false;
}
</script>