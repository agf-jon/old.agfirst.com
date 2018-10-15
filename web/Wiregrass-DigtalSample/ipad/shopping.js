// JavaScript Document
function get_cookie ( cookie_name )
{
  var results = document.cookie.match ( '(^|;) ?' + cookie_name + '=([^;]*)(;|$)' );

  if ( results )
    return ( unescape ( results[2] ) );
  else
    return null;
}

function delete_cookie ( cookie_name )
{
  var cookie_date = new Date ( );  // current date & time
  cookie_date.setTime ( cookie_date.getTime() - 1 );
  document.cookie = cookie_name += "=; expires=" + cookie_date.toGMTString();
}

function delete_all_cookie ( )
{
  var cookie_date = new Date ( );
  var i,x,y,ARRcookies=document.cookie.split(";");
for (i=0;i<ARRcookies.length;i++)
  {
  x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
  y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
  x=x.replace(/^\s+|\s+$/g,"");
  cookie_date.setTime ( cookie_date.getTime() - 1 );
  document.cookie = x += "=; expires=" + cookie_date.toGMTString();
  }
}

function getCookieByIndex(index)
{
var x,y,ARRcookies=document.cookie.split(";");
 if (index<=ARRcookies.lenght)
 {
  x=ARRcookies[index].substr(0,ARRcookies[i].indexOf("="));
  y=ARRcookies[index].substr(ARRcookies[i].indexOf("=")+1);
  x=x.replace(/^\s+|\s+$/g,"");
  return x;
  }
}
function getCookieQuantity()
{
var ARRcookies=document.cookie.split(";");
    return ARRcookies.length-1;
  
}





function set_cookie ( name, value, exp_y, exp_m, exp_d, path, domain, secure )
{
  var cookie_string = name + "=" + escape ( value );

  if ( exp_y )
  {
    var expires = new Date ( exp_y, exp_m, exp_d );
    cookie_string += "; expires=" + expires.toGMTString();
  }

  if ( path )
        cookie_string += "; path=" + escape ( path );

  if ( domain )
        cookie_string += "; domain=" + escape ( domain );
  
  if ( secure )
        cookie_string += "; secure";
 
  if (get_cookie(name))
						alert("This item has been already added.");
					else
						{
							
  document.cookie = cookie_string;
  document.getElementById('shoppingCart').innerHTML=getCookieQuantity()+" items";
						}
}




function showMyShoppingCart()
{
	
	document.getElementById('sCart').style.visibility="visible";
	var cartItem,i,x,y,ARRcookies=document.cookie.split(";");
	document.getElementById('sCart').innerHTML="<table width='500' border='0'><tr height='30'><td  style=' background-color:#525252; font-family:Arial, Helvetica, sans-serif; font-size:10pt; font-weight:bold; color:#CCC;'>&nbsp; Your Wish List <span style='text-align:right;'>Close</span></td></tr>";
	for (i=0;i<ARRcookies.length-1;i++)
 	 {
	  x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
	  y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
	  x=x.replace(/^\s+|\s+$/g,"");
	  cartItem="<tr> <td width='300' align='left' style='color:#ccc;  font-style:italic; font-weight:bold;'>&nbsp;&nbsp;"+x+"  </td><td width='100' style=' color:#ccc;'><input id='qty' type='text' value='1' size='4'></td><td width='100' align='right' style=' color:#ccc;  font-style:italic; font-weight:bold;'>$"+y+"&nbsp;&nbsp;</td> </tr>";
		document.getElementById('sCart').innerHTML=document.getElementById('sCart').innerHTML+cartItem;	  
	}
	document.getElementById('sCart').innerHTML=document.getElementById('sCart').innerHTML+"</table>";
	
	
}
