// JavaScript Document



// The javascript:
window.onload = loadIndex;
var flag=false;
function inString(str)
{
return str.replace(/[^A-Za-z 0-9 \.,\?""!@#\$%\^&\*\(\)-_=\+;:<>\/\\\|\}\{\[\]`~]*/g, '') ; 
}

function toMyString(str)
{
return str.replace(/[^A-Za-z 0-9 \/\\\|]*/g, '') ; 
}
function loadIndex() {
xmlSearch = new XMLHttpRequest(); 
						var mainxmlpath=mainpath.concat("DocumentIndex.xml")
            xmlSearch.open("GET", mainxmlpath, false);     // here we need the path to xml document                   
            xmlSearch.send();                        
            xmlSearch=xmlSearch.responseXML; 
			
			
			
}


function searchIndex() { // search the index (duh!)
		
	xmlSearch = new XMLHttpRequest(); 
						var mainxmlpath=mainpath.concat("DocumentIndex.xml")
            xmlSearch.open("GET", mainxmlpath, false);     // here we need the path to xml document                   
            xmlSearch.send();                        
            xmlSearch=xmlSearch.responseXML; 


	// get the search term from a form field with id 'searchme'

	var searchterm = document.getElementById("searchme").value;
	var allitems = xmlSearch.getElementsByTagName("page");
	//var total = 
	results = new Array;
	pages=new Array;
	if (searchterm.length < 3) {
		alert("Enter at least three characters");
	} else {
		
		for (var i=0;i<allitems.length;i++) {
// see if the XML entry matches the search term,
// and (if so) store it in an array
			if (!allitems[i].lastChild)
				var name="";
			else
				var name = allitems[i].lastChild.nodeValue.replace(/[^A-Za-z 0-9 \.,\?""!@#\$%\^&\*\(\)-_=\+;:<>\/\\\|\}\{\[\]`~]*/g, '');
			
			var exp = new RegExp(searchterm,"igm");
			
			if ( name.match(exp) != null) {
			results.push(allitems[i]);
			pages.push(i);
			}
			
		}
		
// send the results to another function that displays them to the user
	showResults(results, pages, searchterm);
	}
}



function showResults(results, pages, searchterm) {
  if (flag)
	{
	 var resultshere = document.getElementById("maintbl");
	 if ( resultshere.hasChildNodes() )
		{
		while ( resultshere.childNodes.length >= 1 )
		{
			resultshere.removeChild( resultshere.firstChild );       
		} 
	}

 }
 
	if (results.length > 0) {
// if there are any results, put them in a list inside the "resultshere" div
	
		var resultshere = document.getElementById("maintbl");
	if (flag==false)
		{var child= document.getElementById("childimg");
		resultshere.removeChild(child);
		}
		var header = document.createElement("h5");
		
		var searchedfor = document.createTextNode("You've searched for "+searchterm);
		resultshere.appendChild(header);
		header.appendChild(searchedfor);
		
		row=new Array();
cell=new Array();

row_num=results.length; //edit this value to suit
cell_num=2; //edit this value to suit

tab=document.createElement('table');
tab.setAttribute('id','newtable');

tbo=document.createElement('tbody');

var searchTxtIndex=-1;
var searchTxt;
for(c=0;c<row_num;c++){
row[c]=document.createElement('tr');

			var pgnum=++pages[c];
			var source=mainpath.concat("Thumbnail_"+pgnum+".jpg");
			
			var listitem = document.createElement("img");
			var anchor=document.createElement("a");
			anchor.setAttribute('href','iphone.html?'+pgnum);
			listitem.setAttribute('src',source);
			
			anchor.appendChild(listitem);

cell[0]=document.createElement('td');

cell[0].appendChild(anchor);
row[c].appendChild(cell[0]);

cell[1]=document.createElement('td');


searchTxtIndex=results[c].lastChild.nodeValue.toLowerCase().search(searchterm.toLowerCase());
searchTxt=results[c].lastChild.nodeValue.substr(searchTxtIndex-150,300);
cont=document.createTextNode(toMyString(searchTxt.substr(0,150)));
spn=document.createElement("span");
spn.setAttribute('style','font-weight:bold; text-align:justify');
spn.appendChild(cont);

contSearchTerm=document.createTextNode(toMyString(searchterm.toLowerCase()));
spnSearchTerm=document.createElement("span");
spnSearchTerm.setAttribute('style','font-weight:bold; text-align:justify; color:red;');
spnSearchTerm.appendChild(contSearchTerm);

cont2=document.createTextNode(toMyString(searchTxt.substr(150+searchterm.length,300)));
spn2=document.createElement("span");
spn2.setAttribute('style','font-weight:bold; text-align:justify');
spn2.appendChild(cont2);

cell[1].appendChild(spn);
cell[1].appendChild(spnSearchTerm);
cell[1].appendChild(spn2);
row[c].appendChild(cell[1]);
//}
tbo.appendChild(row[c]);
}
tab.appendChild(tbo);
resultshere.appendChild(tab);
}
		
		
	else {
// else tell the user no matches were found
		var resultshere = document.getElementById("resultshere");
		var para = document.createElement("p");
		var notfound = document.createTextNode("Sorry, I couldn't find anything like "+searchterm +"!");
		resultshere.appendChild(para);
		para.appendChild(notfound);
	}
	flag=true;
	
	
}