
  
 window.onorientationchange = detectIPadOrientation;  
 function detectIPadOrientation () {  
  
    if ( orientation == 0 ) {  
     //alert ('Portrait Mode, Home Button bottom');  
    window.location="ipad.html";
	}  
    else if ( orientation == 90 ) {  
		//alert ('Landscape Mode, Home Button right');  
		window.location="ipadflip.html";
    }  
    else if ( orientation == -90 ) {  
    // alert ('Landscape Mode, Home Button left');  
	window.location="ipadflip.html";
    }  
    else if ( orientation == 180 ) {  
     //alert ('Portrait Mode, Home Button top');  
	 window.location="ipad.html";
    }  
 }  
 
