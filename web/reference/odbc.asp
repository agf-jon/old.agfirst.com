<html>
<head>
<link rel="stylesheet" type="text/css" href="index.css">
	<title>odbc</title>
</head>
<body bgcolor="white">
<blockquote>
<div align="right"><h2>odbc test</h2></div><hr>
<%
      if Request("REQUESTTYPE") <> "POST" then
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '   % If the request does not contain REQUESTTYPE = "POST
   '   % then display Form Page
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
      dsn = Session("dsn")
      dbuser = Session("dbuser")
      dbpass = Session("dbpass")
      dbtable = Session("dbtable")
      dbfield = Session("dbfield")
      dbwhere = Session("dbwhere")
%>
<form ACTION="odbc.asp" method="POST">
<input type="hidden" name="REQUESTTYPE" value="POST">
<br>
<table>
<tr><td>You are authenticated as: </td><td><% = Request.ServerVariables("LOGON_USER")%></td></tr>
<tr><td>Your IP Address is: </td><td><% = Request.ServerVariables("REMOTE_ADDR")%></td></tr>
<tr><td>System DSN:</td><td><input TYPE="TEXT" NAME="datasource" VALUE="<% = dsn %>" size="20"></td></tr>
<tr><td>Username:</td><td><input TYPE="TEXT" NAME="username" VALUE="<% = dbuser %>" size="20"></td></tr>
<tr><td>Password:</td><td><input TYPE="Password" NAME="password" VALUE="<% = dbpass %>" size="20"></td></tr>
<tr><td>Table:</td><td><input TYPE="TEXT" NAME="table" VALUE="<% = dbtable %>" size="20"></td></tr>
<tr><td align="right">WHERE</td><td></td></tr>
<tr><td>Field to Query:</td><td><input TYPE="TEXT" NAME="field" VALUE="<% = dbfield %>" size="20"></td></tr>
<tr><td>Value to Query:</td><td><input TYPE="TEXT" NAME="where" VALUE="<% = dbwhere %>" size="20"></td></tr>
<tr><td></td><td><input TYPE="Submit" VALUE="Query Database"></td></tr>
</table>
</form>
<%
 
   else
   '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '% Perform Query to Database
   '%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '   % Request the datsource  from the Previous Form
   '   % Set the Session variable so we can retrieve the
   '   % value for the next query
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
      dsn  = Request("datasource")
      Session("dsn") = dsn
 
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '   % Request the username  from the Previous Form
   '   % Set the Session variable so we can retrieve the
   '   % value for the next query
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
      dbuser  = Request("username")
      Session("dbuser") = dbuser
 
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '   % Request the password from the Previous Form
   '   % Set the Session variable so we can retrieve the
   '   % value for the next query
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
      dbpass = Request("password")
      Session("dbpass") = dbpass
 
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '   % Request the table from the Previous Form
   '   % Set the Session variable so we can retrieve the
   '   % value for the next query
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
      dbtable = Request("table")
      Session("dbtable") = dbtable
 
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '   % Request the table from the Previous Form
   '   % Set the Session variable so we can retrieve the
   '   % value for the next query
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
      dbfield = Request("field")
      Session("dbfield") = dbfield
 
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '   % Request the table from the Previous Form
   '   % Set the Session variable so we can retrieve the
   '   % value for the next query
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
      dbwhere = Request("where")
      Session("dbwhere") = dbwhere
 
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '   % Check to see if any of the requested values are blank, IF they
   '   % are, then inform the user which variables are blank ELSE
   '   % Continue with the query
   '   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      if dsn = "" OR dbuser = "" OR dbtable = "" then
 
         Response.write "Error in SQL Statement:<BR>"
         if dsn = "" then
            Response.write "<FONT COLOR=RED>Missing System DSN<P>"
         end if
         if dbuser = "" then
            Response.write "<FONT COLOR=RED>Missing Username<P>"
         end if
         if dbtable = "" then
            Response.write "<FONT COLOR=RED>Missing Tablename<P>"
         end if
            Response.write "<FORM ACTION=adoselect.asp><INPUT TYPE=SUBMIT VALUE=ReQuery></FORM>"
       else
   '      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '      % Create the Conn Object and open it
   '      % with the supplied parameters
   '      % System DSN, UserID, Password
   '      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
         Set Conn = Server.CreateObject("ADODB.Connection")
         Set rs = Server.CreateObject("ADODB.RecordSet")
         Conn.Open dsn, dbuser, dbpass
 
   '      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '      % Build the SQL Statement and assign it
   '      % to the variable sql.  Concatinating the dbtable and the SELECT
   '      % statement
   '      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         if dbfield = "" OR dbwhere ="" then
         sql="SELECT * FROM " & dbtable
         else
 
   '      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '      % IF dbfield and dbwhere are specified, then
   '      % change the SQL statement to use the WHERE clause
   '      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '
         sql="SELECT * FROM " & dbtable
         sql = sql & " WHERE " & dbfield
         sql = sql & " LIKE '%" & dbwhere & "%'"
         end if
 
   '      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '      % For Debugging, Echo the SQL Statement
   '      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         Response.Write "<b>SQL STATEMENT:</b>" & sql & "<hr>"
 
   '      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '      % Open the RecordSet (RS) and pass it
   '      % the connection (conn) and the SQL Statement (sql)
   '      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         RS.Open sql, Conn
         %>
<div align="center"><center>

<table BORDER="1">
  <tr>
<%
   '         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '         % Loop through Fields Names and print out the Field Names
   '         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
            For i = 0 to RS.Fields.Count - 1
            %>
    <td><% = RS(i).Name %></td>
<% Next %>
  </tr>
<%
   '         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '         % Loop through rows, displaying each field
   '         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            Do While Not RS.EOF
            %>
  <tr>
<% For i = 0 to RS.Fields.Count - 1 %>
    <td VALIGN="TOP"><% = RS(i) %>
</td>
<% Next %>
  </tr>
<%
            RS.MoveNext
            Loop
   '         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   '         % Make sure to close the Result Set and the Connection object
   '         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            RS.Close
            Conn.Close
            %>
</table>
</center></div><%
         end if
      end if
   %>
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
