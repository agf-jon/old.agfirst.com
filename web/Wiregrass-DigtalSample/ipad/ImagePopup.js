//-----------------------------------------------------------------------------
// Author   : Sudipta Das
// Date     : 18-Nov-2008
// Purpose  : This script is to show a pop-up image.
//-----------------------------------------------------------------------------
function Large(obj)
{
    var imgbox=document.getElementById("imgbox");
    imgbox.style.visibility='visible';
   // var img = document.createElement("img");    
   var img = document.getElementById("zoomImg");
	img.src=obj;
	
   img.style.width=String((parseInt(ImgWidth)*2))+'px';
   img.style.height=String((parseInt(ImgHeight)*2))+'px';
    
    if(img.addEventListener){
        img.addEventListener('mouseout',Out,false);
    } else {
        img.attachEvent('onmouseout',Out);
    }             
    //imgbox.innerHTML='';    
    //imgbox.appendChild(img);    
   imgbox.style.left='0px';
   imgbox.style.top='0px';     
}  

function Out()
{
	scrollTo(0,0);
	
	document.getElementById("imgbox").style.visibility='hidden';
	if (document.getElementById("imgbox").childNodes[0])
	{
		//document.getElementById("imgbox").removeChild(document.getElementById("imgbox").childNodes[0]);
 		document.getElementById("zoomImg").style.width="0px";
		document.getElementById("zoomImg").style.height="0px";
	}
	
	
}

function getElementLeft(elm) 
{
    var x = 0;

    //set x to elm’s offsetLeft
    x = elm.offsetLeft;

    //set elm to its offsetParent
    elm = elm.offsetParent;

    //use while loop to check if elm is null
    // if not then add current elm’s offsetLeft to x
    //offsetTop to y and set elm to its offsetParent

    while(elm != null)
     {
        x = parseInt(x) + parseInt(elm.offsetLeft);
        elm = elm.offsetParent;
     }
     
     return x;
}

function getElementTop(elm) 
{
    var y = 0;

    //set x to elm’s offsetLeft
    y = elm.offsetTop;

    //set elm to its offsetParent
    elm = elm.offsetParent;

    //use while loop to check if elm is null
    // if not then add current elm’s offsetLeft to x
    //offsetTop to y and set elm to its offsetParent

    while(elm != null)
     {
        y = parseInt(y) + parseInt(elm.offsetTop);
        elm = elm.offsetParent;
     }
     
     return y;
}

/* -- Capture date from calendar popup window -- */