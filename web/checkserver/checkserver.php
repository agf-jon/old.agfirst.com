<?php session_start(); ?>
<?php $url_query = hide_errors(); ?>
<?php $phpok = checkphp(); ?>
<?php if($phpok){$nowrite = redirect('checkserver_check_sess.php', $url_query);}?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>SiteGrinder 3 CMS Checkserver Script</title>
	
	<style type="text/css" media="all"> b { color: red; }</style>
	
	<script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$.ajax({
				data: {'test': '><'},
				type: 'post',
				url: 'ajax.php',
				success: function(data) {
					$(".post_check").html("OK");
				},
				error: function() {
					$(".post_check").html("<b>POST data containing &gt;&lt; is not allowed.</b>");
					server_fail();
				}
			});
			if($(".permissions_check").html() == 'Checking') {
var test =				$.ajax({
					data: {'test': 'data'},
					type: 'post',
					url: 'permissions.php',
					success: function(data) {
						$(".permissions_check").html("OK");
						if($(".ext_check").html() == 'Checking') {
							$.ajax({
								url: 'test.post',
								success: function(data) {
									$(".ext_check").html("OK");
									check_comment_ext();
								},
								error: function() {
									$(".ext_check").html("<b>The server won't serve files with the .post extension correctly. </b>")
									check_comment_ext();
								},
							});
						}
					},
					error: function() {
						$(".permissions_check").html("<b>Files created by PHP are created with the wrong permissions.</b>");
						$(".ext_check").html("<b>Files created by PHP are created with the wrong permissions. Once that is fixed then we'll be able to check files with custom extensions.</b>");
						server_fail();
					}
				});
			}
			window.console.log(test);
		});
		function server_fail()
		{
			$(".server").html("Server Fail");
			$(".server_msg").html("This server is not able to support the SiteGrinder 3 CMS system");
		}
		function check_comment_ext()
		{
			$.ajax({
				url: 'test.comment',
				success: function(data) {
					if($(".ext_check").html() == "OK") {
						$(".ext_check").html("OK");
					}
				},
				error: function() {
					var msg = "<b>The server won't serve files with the .comment extension correctly.</b>";
					if($(".ext_check").html() == "OK") {
						$(".ext_check").html(msg)
					} else {
						$(".ext_check").append(msg);
					}
				}
			});
		}

	</script>
	
</head>

<body>
	<noscript><h2>Javascript is disabled in your browser. The remote CMS requires Javascript. Please enable it in your browser options.</h2></noscript>
	<br /><br /><a style="background-color:#ffffff;" href="checkserver.php">Check Again</a><br />
	<a style="background-color:#ffffff;" href="checkserver.php?errors=true">Check Again(Display PHP Errors)</a><br /><br />
	<!--
	Version 0.57 of this script.
	Last Edit: Chris Perkins 5/10/2010
	Last Edit: Daniel Searles 2/01/2011 10:00 AM PST
	-->
	<?php
	function checkserver($phpok, $nowrite = false)
	{
		//$openSSL = false;
		$session_save_path = false;
		$sessions = false;
		$file_write = false;
		$php_file_permissions = false;
		$file_ext = false;
		$ftp_file_edit = false;
		$curl    = false;
		$libxml = false;
		$dom = false;
		$pcre = false;
		$SimpleXML = false;
		$date = false;
		$gd = false;
		$file_uploads = ini_get('file_uploads');  //upload_max_filesize
		$safe_mode_off_or_gid_on = (!ini_get('safe_mode')) || ini_get('safe_mode_gid');
		$local_open_basedir = ini_get('open_basedir');

		$allextensions = false;

		//if(extension_loaded('openSSL')){ $openSSL = true;}
		if(is_dir(session_save_path())){ 
			$session_save_path = true;
		} elseif(!empty($local_open_basedir)) {
			$cantchecksessionsavepath = true;
			$session_save_path = true;
		}
		if($phpok) {
			if(check_sessions()){ $sessions = true;}
			if(check_file_write()) { $file_write = true;}
			if(create_file_for_permissions_check()) { $php_file_permissions = true; }
			if(create_files_for_ext_check()) { $file_ext = true; }
			if(check_ftp_file_write("ftp_user_edit_check.htm")) { $ftp_file_edit = true;}
		}
		if(extension_loaded('curl')){ $curl = true;}
		if(extension_loaded('libxml')){ $libxml = true;}
		if(extension_loaded('dom')){ $dom = true;}
		if(extension_loaded('pcre')){ $pcre = true;}
		if(extension_loaded('SimpleXML')){ $SimpleXML = true;}
		if(extension_loaded('date')){ $date = true;}
		if(extension_loaded('gd')){ $gd = true;}

		$allextensions =  $session_save_path & $sessions & $file_write & $ftp_file_edit & $curl & $libxml & $dom & $pcre & $SimpleXML & $date & $gd & $file_uploads & $safe_mode_off_or_gid_on;

		if($allextensions && $phpok)
		{   

		  echo '<h1 class="server">Server OK</h1>
		  <h2 class="server_msg">This server will support the SiteGrinder 3 CMS system</h2>';

		}
		else
		{ 
		   // -->
		   ?> <h1 class="server">Server Fail</h1>
		<h2 class="server_msg">This server is not able to support the SiteGrinder 3 CMS system</h2>

		   <?php
		  //<!--
		}
		if(!$phpok)
		{
		  $v = phpversion();
		  echo "<h3>This server is running PHP version $v<br />But PHP version 5 or later is required</h3>";
		}
		echo "<table>";
		//tablerow( "openSSL: ",  $openSSL ? "ON" : "<b>MISSING</b>");
		if(!$cantchecksessionsavepath) {
			tablerow( "session_save_path: "   ,  $session_save_path ? "OK" : "<b>DIRECTORY DOES NOT EXIST</b>");
		}
		if($phpok) {
			if($nowrite) {
				tablerow( "sessions: "   ,  "<b>SESSIONS CAN'T BE TESTED UNTIL PHP CAN WRITE FILES</b>");
			} else {
				tablerow( "sessions: "   ,  $sessions ? "OK" : "<b>SESSIONS ARE NOT CONFIGURED</b>");
			}
			tablerow( "File Write: "   ,  $file_write ? "OK" : "<b>PHP CAN&apos;T WRITE/EDIT/DELETE FILES</b>");
			tablerow( "PHP File Permissions: "   ,  $php_file_permissions ? "Checking" : "<b>PHP CAN&apos;T WRITE/EDIT/DELETE FILES</b>", ' class="permissions_check"');
			tablerow( "File Extension Check: "   ,  $file_ext ? "Checking" : "<b>PHP CAN&apos;T WRITE/EDIT/DELETE FILES</b>", ' class="ext_check"');
			tablerow( "FTP User Files Edit: "   ,  $ftp_file_edit ? "OK" : "<b>PHP CAN&apos;T EDIT FTP USER FILES</b>");
		}
		tablerow( "cURL: "   ,  $curl ? "OK" : "<b>MISSING</b>");
		tablerow( "libxml: " ,  $libxml ? "OK" : "<b>MISSING</b>");
		tablerow( "dom: "    ,  $dom ? "OK" : "<b>MISSING</b>");
		tablerow( "pcre: "   ,  $pcre ? "OK" : "<b>MISSING</b>");
		tablerow( "SimpleXML: ",  $SimpleXML ? "OK" : "<b>MISSING</b>");
		tablerow( "date: "   ,  $date ? "OK" : "<b>MISSING</b>");
		tablerow( "GD: "     ,  $gd   ? "OK" : "<b>MISSING</b>");
		tablerow( "file_uploads: "   ,  $file_uploads ? "OK" : "<b>OFF</b>");
		tablerow( "safe_mode is Off <br /> -or- <br />safe_mode_gid is On: ", $safe_mode_off_or_gid_on ? "OK" : "<b>Please turn <i>safe_mode_gid</i> to On or turn <i>safe_mode</i> to Off</b>");
		tablerow("PHP:"      , phpversion());
		tablerow("POST data:", "Checking", ' class="post_check"');
		echo "</table><br /><br /><br />";


	}

	if($_REQUEST['checked'] == 'true' || $nowrite || !$phpok) {
		checkserver($phpok, $nowrite);
		phpinfo();
	}

	//--> <h3>This server is not running PHP.  PHP 5 and later is required.</h3>
	?>

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

	<?php
	
	function tablerow($a, $b, $attr = '')
	{
	  echo "<tr><td align='right'>$a</td><td$attr>$b</td></tr>";
	}
	
	function redirect($filename, $url_query)
	{
		if($_REQUEST['checked'] != 'true') {
				$contents = '<?php session_start();
					$_SESSION["check"] = true;
					?>
					<script type="text/javascript">	window.location="checkserver.php'.$url_query.'checked=true";</script>
	';
				if(file_put_contents($filename, $contents) !== false) {
					echo '<script type="text/javascript">	window.location="'.$filename.'";</script>';
				} else {
					return true;
				}
		} else {
			if(file_exists($filename)) {
				unlink($filename);
			}
		}
		return false;
	}

	function checkphp()
	{
		$v = floatval(phpversion());
		return(5 <= $v); //do not use greater than, needs to be html 
	}

	function check_sessions()
	{
		if($_SESSION['check'] === true) {
			unset($_SESSION['check']);
			return true;
		}
		return false;
	}

	function check_file_write()
	{
		$filename = 'checkserver_check.php';
		if(file_put_contents($filename, 'Create File') === false) {
			return false;
		}

		$file = file_get_contents($filename);

		if($file != 'Create File') {
			return false;
		}

		$file = 'Edit';

		if(file_put_contents($filename, $file) === false) {
			return false;
		}

		$file = file_get_contents($filename);

		if($file != 'Edit') {
			return false;
		}

		if(!unlink($filename)) {
			return false;
		}

		return true;
	}

	function check_ftp_file_write($filename)
	{
		if(file_put_contents($filename, time()) === false) {
			return false;
		}
		return true;
	}
	
	function create_file_for_permissions_check()
	{
		if(file_exists('permissions.php')) {
			if(!unlink('permissions.php')) {
				return false;
			}
		}
		if(file_put_contents('permissions.php', '<?php print_r($_REQUEST); ?>') === false) {
			return false;
		}
		return true;
	}

	function create_files_for_ext_check()
	{
		if(file_exists('test.post')) {
			if(!unlink('test.post')) {
				return false;
			}
		}
		if(file_put_contents('test.post', 'test') === false) {
			return false;
		}
		if(file_exists('test.comment')) {
			if(!unlink('test.comment')) {
				return false;
			}
		}
		if(file_put_contents('test.comment', 'test') === false) {
			return false;
		}
		return true;
	}

	function hide_errors()
	{
		ini_set('display_errors', 'On');
		ini_set('display_startup_errors', 'On');
		$reporting = 0;
		$query = '?';

		if(!empty($_REQUEST['errors'])) {
			if($_REQUEST['errors'] == 'true') {
				$reporting = E_ALL ^ E_NOTICE;
				$query = '?errors=true&';
			}
		}

		error_reporting($reporting);
		return $query;
	}
	?>
