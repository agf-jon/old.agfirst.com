// Sliding Menu Script
// copyright Stephen Chapman, 6th July 2005
// you may copy this code but please keep the copyright notice as well
var speed = 6;

var aDOM = 0, ieDOM = 0, nsDOM = 0; var stdDOM = document.getElementById;
if (stdDOM) aDOM = 1; else {ieDOM = document.all; if (ieDOM) aDOM = 1; else {
var nsDOM = ((navigator.appName.indexOf('Netscape') != -1)
&& (parseInt(navigator.appVersion) ==4)); if (nsDOM) aDOM = 1;}}
function xDOM(objectId, wS) {
if (stdDOM) return wS ? document.getElementById(objectId).style:
document.getElementById(objectId);
if (ieDOM) return wS ? document.all[objectId].style: document.all[objectId];
if (nsDOM) return document.layers[objectId];
}
function objWidth(objectID) {var obj = xDOM(objectID,0); if(obj.offsetWidth) return obj.offsetWidth; if (obj.clip) return obj.clip.width; return 0;}
function objHeight(objectID) {var obj = xDOM(objectID,0); if(obj.offsetHeight) return obj.offsetHeight; if (obj.clip) return obj.clip.height; return 0;}
function setObjVis(objectID,vis) {var objs = xDOM(objectID,1); objs.visibility = vis;}
function moveObjTo(objectID,x,y) {var objs = xDOM(objectID,1); objs.left = x; objs.top = y;}
function pageWidth() {return window.innerWidth != null? window.innerWidth: document.body != null? document.body.clientWidth:null;}
function pageHeight() {return window.innerHeight != null? window.innerHeight: document.body != null? document.body.clientHeight:null;}
function posLeft() {return typeof window.pageXOffset != 'undefined' ? window.pageXOffset: document.documentElement.scrollLeft? document.documentElement.scrollLeft: document.body.scrollLeft? document.body.scrollLeft:0;}
function posTop() {return typeof window.pageYOffset != 'undefined' ? window.pageYOffset: document.documentElement.scrollTop? document.documentElement.scrollTop: document.body.scrollTop? document.body.scrollTop:0;}
var xxx = 0; var yyy = 0; var dist = distX = distY = 0; var stepx = 2; var stepy = 0; var mn = 'smenu';
function distance(s,e) {return Math.abs(s-e)}
function direction(s,e) {return s>e?-1:1}
function rate(a,b) {return a<b?a/b:1}
function start() {xxx = -225; yyy = 50; var eX = 0; var eY = 100; dist = distX = distance(xxx,eX); distY = distance(yyy,eY); stepx *= -direction(xxx,eX) * rate(distX,distY); stepy *= direction(yyy,eY) * rate(distY,distX); moveit();
setObjVis(mn,'visible');}
function moveit() {var x = (posLeft()+xxx) + 'px'; var y = (posTop()+yyy) + 'px'; moveObjTo(mn,x,y);}
function mover() {if (dist > 0) {xxx += stepx; yyy += stepy; dist -= Math.abs(stepx);} moveit(); setTimeout('mover()',speed);
}
function slide() {dist = distX; stepx = -stepx; moveit(); setTimeout('mover()',speed*2);return false;}
onload = start;
window.onscroll = moveit;