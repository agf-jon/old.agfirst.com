<?php require_once('../../../Connections/onepixel.php'); ?>
<?php
// Insert a row of information into the table "example"
$cmark = $_GET['cmark'];
  $dbSelect = mysql_select_db('onepixel') or die("This database does not exist."); 
$query = "SELECT * FROM `agfirst_hr_employment` WHERE cmark='$cmark'";
$result = mysql_query($query) or die(mysql_error()); 
$row = mysql_fetch_assoc($result);
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
.styleD {
	font-family: "Times New Roman", Times, serif;
	font-size: 17px;
	color: #7D6E48;
}
-->
</style>
<link href="../agfirst-style2.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style13 {color: #6389AB}
.style14 {color: #00226A}
.style8 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;}
-->
</style>
<style type="text/css">
<!--
.style15 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; font-weight: bold; }
.style11 {font-size: 18px; color: #00226A; font-family: "Times New Roman", Times, serif;}
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
        <td><img src="../images/new-home-header.jpg" width="828" height="94" border="0" usemap="#Map" />
          <map name="Map" id="Map2">
            <area shape="rect" coords="688,72,773,91" href="../contact.html" />
            <area shape="rect" coords="441,71,674,91" href="http://agfirst.com/smmuaccountaccess.htm" />
            <area shape="rect" coords="248,71,429,91" href="../employment.html" />
            <area shape="rect" coords="12,3,235,91" href="../index.html" />
          </map>
          <map name="Map" id="Map">
            <area shape="rect" coords="688,72,773,91" href="#" />
            <area shape="rect" coords="441,71,674,91" href="#" />
            <area shape="rect" coords="248,71,429,91" href="#" />
            <area shape="rect" coords="12,3,235,91" href="#" />
          </map></td>
      </tr>
      <tr>
        <td><br />
          <table width="710" border="0" align="center" cellpadding="2" cellspacing="2">
            <tr>
              <td width="300" valign="top"><table width="210" border="0" align="center" cellpadding="2" cellspacing="2">
                <tr>
                  <td><span class="style11"><a href="javascript:history.go(-1)">RETURN TO LIST </a> </span></td>
                </tr>
              </table></td>
              <td><table width="510" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><img src="images/form-top.gif" width="510" height="35"></td>
                </tr>
                <tr>
                  <td height="333" valign="top" background="images/bg-form.gif" bgcolor="F7F7F6"><table width="480" border="1" align="center" cellpadding="2" cellspacing="2" bordercolor="#CCCCCC">
				      <?php do { ?>
					<tr>
						  <td bgcolor="#2E4D93" class="style15"><font color="#FFFFFF" size="3">&nbsp;<?php echo $row[title] ?></font></td>
                          </tr>
					<tr>
					  <td class="style15"><table width="100%" border="0" cellspacing="2" cellpadding="2">
                          <tr>
                            <td bgcolor="#CCCCCC" class="style8"><strong><font color="#2E4D93">&nbsp;&nbsp;Position: #</font></strong> <?php echo $row[Position] ?></td>
                            <td bgcolor="#CCCCCC" class="style8"><strong><font color="#2E4D93">&nbsp;&nbsp;Location: </font></strong><?php echo $row[Location] ?></td>
                          </tr>
                        </table></td>
					  </tr>
					<tr>
					  <td class="style8"><br>
					    <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                          <td class="style8"><strong>Description:</strong> <br>
                            <?php echo $row[Description] ?><br>
                            <strong><br>
Responsibilities:</strong><br>
<?php echo $row[Responsibilities] ?><strong><br>
<br>
Requirements:</strong> <br>
<?php echo $row[Requirements] ?> EOE - M/W/D/V<br>
<br>
<strong>Salary:</strong> <?php echo $row[Salary] ?></td>
                        </tr>
                      </table>					    
					      <br></td>
					  </tr>
					
					<tr>
					  <td class="style8"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td class="style8"><strong><font color="#2E4D93">Mailing Address:</font></strong> <br>
                              <?php echo $row[Mailing] ?> </td>
                          </tr>
                        </table></td>
					  </tr>
					<tr>
					  <td class="style8"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td class="style8"><strong><font color="#2E4D93">Email: </font></strong><a href="mailto:<?php echo trim($row[Email]) ?>"><?php echo trim($row[Email]) ?></a></td>
                          </tr>
                        </table></td>
					  </tr>
					
					<?php } while ($row = mysql_fetch_assoc($result)); ?>
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
