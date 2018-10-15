



/*
 Touch Carousel
Copyright (c) 2010, Greg Murray
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by Greg Murray.
4. Neither the name of Greg Murray nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY Greg Murray ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Greg Murray BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/* Emile */
(function(f,a){var h=document.createElement("div"),g=("backgroundColor borderBottomColor borderBottomWidth borderLeftColor borderLeftWidth borderRightColor borderRightWidth borderSpacing borderTopColor borderTopWidth bottom color fontSize fontWeight height left letterSpacing lineHeight marginBottom marginLeft marginRight marginTop maxHeight maxWidth minHeight minWidth opacity outlineColor outlineOffset outlineWidth paddingBottom paddingLeft paddingRight paddingTop right textIndent top width wordSpacing zIndex").split(" ");function e(j,k,l){return(j+(k-j)*l).toFixed(3)}function i(k,j,l){return k.substr(j,l||1)}function c(l,p,s){var n=2,m,q,o,t=[],k=[];while(m=3,q=arguments[n-1],n--){if(i(q,0)=="r"){q=q.match(/\d+/g);while(m--){t.push(~~q[m])}}else{if(q.length==4){q="#"+i(q,1)+i(q,1)+i(q,2)+i(q,2)+i(q,3)+i(q,3)}while(m--){t.push(parseInt(i(q,1+m*2,2),16))}}}while(m--){o=~~(t[m+3]+(t[m]-t[m+3])*s);k.push(o<0?0:o>255?255:o)}return"rgb("+k.join(",")+")"}function b(l){var k=parseFloat(l),j=l.replace(/^[\-\d\.]+/,"");return isNaN(k)?{v:j,f:c,u:""}:{v:k,f:e,u:j}}function d(m){var l,n={},k=g.length,j;h.innerHTML='<div style="'+m+'"></div>';l=h.childNodes[0].style;while(k--){if(j=l[g[k]]){n[g[k]]=b(j)}}return n}a[f]=function(p,m,j){p=typeof p=="string"?document.getElementById(p):p;j=j||{};var r=d(m),q=p.currentStyle?p.currentStyle:getComputedStyle(p,null),l,s={},n=+new Date,k=j.duration||200,u=n+k,o,t=j.easing||function(v){return(-Math.cos(v*Math.PI)/2)+0.5};for(l in r){s[l]=b(q[l])}o=setInterval(function(){var v=+new Date,w=v>u?1:(v-n)/k;for(l in r){p.style[l]=r[l].f(s[l].v,r[l].v,t(w))+r[l].u}if(v>u){clearInterval(o);j.after&&j.after()}},10)}})("emile",this);

if ( !window.widgets ) {
 window.widgets = function() {

 var ctx = {
          MSIE : /MSIE/i.test(navigator.userAgent),
          counter : 0,
          debug : true
 };

 function isDefined(_target) {
     return (typeof _target !== "undefined");
 }

 function matchWildcard(pattern,topic) {

     var patpos = 0;
     var patlen = pattern.length;
     var strpos = 0;
     var strlen = topic.length;
     var i=0;
     var star = false;

     while ( strpos+i<strlen ) {
         if ( patpos+i <patlen ) {
             switch ( pattern.charAt(patpos + i) ) {
             case "?":
                 i++;
                 continue;
             case '*':
                 star = true;
                 strpos += i;
                 patpos += i;
                 do {
                     ++patpos;
                     if ( patpos == patlen ) {return true;}
                 } while (pattern.charAt(patpos) == '*');
                 i=0;
                 continue;
             }
             if (topic.charAt(strpos + i) != pattern.charAt(patpos + i)) {
                 if (!star) {return false;}
                 strpos++;
                 i=0;
                 continue;
             }
             i++;
         } else {
             if (!star) {return false;}
             strpos++;
             i=0;
         }
     }
     do {
         if (patpos + i == patlen) {return true;}
     } while(pattern.charAt(patpos + i++)=='*');
     return false;
 }

 function log(message) {
     if ( window.console ) {
         window.console.log( message );
     } else {
         var logger = document.getElementById( "log" );
         if ( logger ) {
              var _m = document.createElement( "div" );
              _m.innerHTML = message;
             logger.appendChild( _m );
         }
     }
 }

 function trim(t) {
     return  t.replace(/^\s+|\s+$/g, "");
 }

 function unsubscribe(_lis) {
     for (var _l=0; _l < ctx.subs.length;_l++ ) {
         if (ctx.subs[_l].id  == _lis.id) {
             ctx.subs.splice(_l,1);
             break;
         }
     }
 }
 function publish(name, args) {
     if (typeof name == "undefined" || typeof args == "undefined"){
         return false;
     }
     if (ctx.debug) {
         log("Publish " + name);
     }

     // check the glue for listeners
     if (ctx.subs){
         for (var _l=0; _l < ctx.subs.length;_l++ ) {
             var _listener = ctx.subs[_l];
                  if ((_listener.topic instanceof RegExp &&
                       _listener.topic.test(name))  ||
                        _listener.topic == name ||
                       (typeof _listener.topic.charAt == 'function' &&
                    matchWildcard(_listener.topic,name))
                ) {

                 // set the topic on payload
                 args.topic = name;
                 if (_listener.action == 'call' && _listener.target) {
                     // get the top level object
                     var Obj;
                     var myo = 'undefined';
                     if (_listener.target.functionHandler) {
                         _listener.target.functionHandler.apply(window,[args]);
                     }
                 }
             }
         }
     }
     return true;
 }

 function subscribe(l, t) {
     if (!isDefined(l)) {
         return null;
     }
     var lis;
     if (typeof l == 'object' && !(l instanceof RegExp)) {
         if (l.topic){
             l.topic = trim(l.topic);
         }
         if (l.topicRegExp){
             l.topic = new RegExp(l.topicRegExp);
         }
         lis = l;
     } else if (typeof t == 'string'){
       lis = {};
       if (l.topicRegExp) {
           lis.topic = new RegExp(l.topicRegExp);
       } else {
           lis.topic = l;
       }
       lis.target = {};
       var _is = t.split('.');
       lis.action = "call";
       lis.target.functionName = _is.pop();
       lis.target.object = _is.join('.');
     } else if (typeof t == 'function') {
       lis = {};
       if (l.topicRegExp) {
           lis.topic =  new RegExp(l.topicRegExp);
       } else {
           lis.topic = l;
       }
       lis.target = {};
       lis.action = "call";
       lis.target.functionHandler = t;
     } else {
       log("Subscribe handler required : " + l);
     }
     if (isDefined(lis)){
         if (!isDefined(ctx.subs)) {
             ctx.subs = [];
         }
         if (lis.topic){
             ctx.subs.push(lis);
         } else {
             log("Subscribe topic required" + l);
             return null;
         }
         return lis;
     }
     return null;
 } 
  
  /**
    * Find the position of an Element
    *
    */
  var getPosition = function( _e ){
         var pX = 0;
         var pY = 0;
         if( _e.offsetParent ) {
             while(true){
                 pY += _e.offsetTop;
                 pX += _e.offsetLeft;
                 if(_e.offsetParent === null){
                     break;
                 }
                 _e = _e.offsetParent;
             }
         } else if(_e.y) {
                 pY += _e.y;
                 pX += _e.x;
         }
         return  {x: pX, y: pY};
     };

     var getDimensions = function( n, min ) {
         if (typeof n == 'undefined' ||
             n === null) {
             return null;
         }
         var _min = 0;
         if (typeof min != "undefined") {
             _min = min;
         }
         var rn = n.parentNode;
         while( rn && true ) {
             if ( rn.clientHeight > _min ) {
                 break;
             }
             if ( rn.parentNode && rn.parentNode.clientHeight ) {
                 rn = rn.parentNode;
             } else {
                break;
             }
         }
         if ( !rn ) {
             return null;
         }
         return { h : rn.clientHeight, w : rn.clientWidth };
     };
 return {
      publish : publish,
      subscribe : subscribe,
      getPosition : getPosition,
      getDimensions : getDimensions,
      log : log
  };
}();

}

widgets.Carousel = function(wargs) {

    var _widget = this;
    var items = [];
    var index = 0;
    var count = 1;
    var itemCount = total;
    var timeout = 35;
    var topic = "/widgets/carousel";
    var subscribe = ["/widgets/carousel"];
    var counter = 0;
    var showNav = true;
    var increment = 25;
    var itemHeight = 100;
    var itemWidth = 100;
    var baseWidth = "100%";
    var fader = null;
    _widget.node = document.getElementById(wargs.uuid);
    _widget.navTop = null;
    _widget.scrollJump = 1;
    var template;
    var scrollCount = 1;
    widgets.MSIE = /MSIE/.test(navigator.userAgent);
    var horizontalScroll = true;
    var scrollTimeout = 5000;
    var scrollCarousel = false;
    var scrolling = false;
    var fadeInterval = 150;
    var opacitysetting = 1;
    var scrollJump = 1;
    var scrollInterval = 1000;
    var scroll;
    var themes = {
      ocean : 'ocean',
      kame : 'kame'
   };
    var currentTheme = themes['ocean'];
    if ( wargs.args ) {
        if (wargs.args.itemCount) {
            itemCount = Number(wargs.args.itemCount);
        }
        if ( typeof wargs.args.showNavigation === "boolean" ) {
            showNav = wargs.args.showNavigation;
        }
        if ( wargs.args.filter ) {
            filter = wargs.args.filter;
        }
        if ( wargs.args.scrollTimeout ) {
            scrollTimeout = wargs.args.scrollTimeout;
        }
        if ( wargs.args.increment ) {
            increment = wargs.args.increment;
        }
        if ( wargs.args.itemWidth ) {
            baseWidth = wargs.args.itemWidth;
        }
        if ( typeof wargs.args.scrollCarousel === "boolean" ) {
            scrollCarousel = wargs.args.scrollCarousel;
        }
        if ( wargs.args.theme ) {
            currentTheme = wargs.args.theme;
        }
        if ( typeof wargs.args.navTop === "number" ) {
            _widget.navTop = wargs.args.navTop;
        }
        if ( typeof wargs.args.scrollJump === "number" ) {
            _widget.scrollJump = wargs.args.scrollJump;
        }
        if ( typeof wargs.args.scrollInterval === "number" ) {
            scrollInterval = wargs.args.scrollInterval;
        }
    }
    if ( widgets.MSIE === true && baseWidth === "100%" ) {
        var _dim = widgets.getDimensions(_widget.node);
        if (_dim != null) {
            itemWidth = _dim.w;
        }
    }
    if ( /%/i.test(baseWidth) ) {
        var _w = new Number(baseWidth.split('%')[0]);
        var _dim = widgets.getDimensions(_widget.node);
        if (_dim != null) {
            itemWidth = (_dim.w - 12) / _w * 100;
        }
    } else {
        itemWidth = baseWidth;
    }
    if ( horizontalScroll )  {
        scroll = itemWidth;
    } else {
        scroll = itemHeight + 4;
    }
    if ( wargs.subscribe ) {
        if (typeof wargs.subscribe === "string") {
            subscribe = [];
            subscribe.push( wargs.subscribe );
        } else {
            subscribe = wargs.subscribe;
        }
    }

    if (wargs.publish) {
        publish = wargs.publish;
    }

    _widget.timerFunction = function(){
        if ( !scrollCarousel ) {
            return;
        }
        if (items && (index < items.length - 1)) {
            _widget.getNext();
            _widget.timer = setTimeout( _widget.timerFunction, scrollTimeout );
        } else {
            _widget.reset( function() {;
                _widget.timer = setTimeout( _widget.timerFunction, scrollTimeout );
            });
        }
    };

    this.reset = function( _callback ) {
        updateNav();
        setTimeout(function(){
            fade('out', function(){
                _widget.container.style.display = "none";
                _widget.container.style.left = "0px";
                setTimeout(function(){
                    fade('in', function(){
                        _widget.select(0);
                        if ( typeof _callback === "function") {
                            _callback.apply({},[]);
                        }
                    });
                }, fadeInterval);
            });
        }, fadeInterval);
    };

    function setOpacity(opacity, target){
        if ( typeof target === "string" ) {
            target = document.getElementById( id );
        }
        if (!target) {
            return;
        }
        if (typeof target.style.filter != 'undefined') {
            target.style.filter = "alpha(opacity:" + (opacity * 100) + ")";
        } else {
            target.style.opacity = opacity;
        }
    }

    function fade( type, _callback ){

        setOpacity(opacitysetting, _widget.container );
        var _done = false;
        if ( type == "in" ) {
            opacitysetting += 0.1;
            if (opacitysetting > .2) _widget.container.style.display = "block";
            if (opacitysetting >= 1) 
                _done = true;
        } else if ( type == "out" ) {
                opacitysetting -= 0.1;
                if (opacitysetting <= 0) {
                    _done = true;
                }
            }
        if ( _done ) {
            if (typeof _callback == "function") {
                _callback();
            }
        } else {
            setTimeout(function(){
                fade(type, _callback);
            }, fadeInterval);
        }
    }

    if ( scrollCarousel === true ) {
        _widget.timer = setTimeout(_widget.timerFunction, scrollTimeout);
    }

    this.pause = function() {
        pauseScroller();
    };

    function pauseScroller() {
        // return if we are already stopped
        if ( scrollCarousel === false ) {
            return;
        }
       if ( _widget.scrollTimer ) {
            clearTimeout( _widget.scrollTimer );
       }
       setTimeout(function() {
           if ( _widget.timer ) {
               clearTimeout( _widget.timer );
           }
           _widget.timer = setTimeout(_widget.timerFunction, scrollTimeout);
       }, 15000); 
    }

    this.addItem = function(item) {
        if (!item.id) item.id = items.length;
        var id = item.id;
        var text = _widget.applyTemplate(item, template);

        if (typeof item.id == 'undefined') item.id =  counter++; 
        var div = document.createElement("div");
         _widget.container.appendChild(div); 
        div.innerHTML = text;
        div.style.zIndex = 1;
        div.style.width = itemWidth + "px";
        div.style.height = itemHeight + "px";
        div.style.display = 'inline';
        if (horizontalScroll) {
           // get the content node
           var content = document.getElementById(wargs.uuid+ "_item_" + id);
           content.style.height = itemHeight - 50 + "px";
           if (widgets.MSIE) div.style.styleFloat = "left";
           div.style.cssFloat = "left";
        }
        div.id = wargs.uuid + "_item_" + item.id;
        item.div = div;
        items.push(item);
        var _sel = document.createElement("div");
        _sel.index = id;
        _sel.onclick = function(e) {
            if (scrolling) return;
            pauseScroller();
            var _t;
            if (!e) _t = window.event.srcElement;
            else _t = e.target;
             _widget.select(_t.index);
        };
        _sel.appendChild(document.createTextNode((id + 1) ));
        _sel.className = "carousel-id carousel-id-" + currentTheme;
        _widget.mid.appendChild(_sel);
        item.menu = _sel;
        return id;
    };

    this.select = function(itemId){
        for (var _i=0; _i < items.length; _i++) {
           var item = items[_i];
           if (item.id == itemId) {
               _widget.showIndex(_i);
               item.menu.className += "carousel-id carousel-id-" + currentTheme + " carousel-id-selected-" + currentTheme;
           } else {
               item.menu.className = "carousel-id carousel-id-" + currentTheme;
           }
        }
    };

    this.applyTemplate = function(obj, _t) {
        for (var i in obj) {
            var token = "@{" + i + "}";
            while (_t.indexOf(token) != -1) {
                _t = _t.replace(token, obj[i]);
            }
        }
        return _t;
    };
    
    function updateNav() {
        if ( index === 0 ) {
            setOpacity( .1, _widget.prev );
        } else {
            setOpacity( 1, _widget.prev );
        }
        if ( index === items.length -1 ) {
            setOpacity( .1, _widget.next );
        } else {
            setOpacity( 1, _widget.next );
        }
        scrolling = false;
    }

    this.showIndex = function( targetIndex ) {
        if (targetIndex < index ||
            targetIndex >= index + count) {
            if (targetIndex < index) {
               var _cb = function() {
                 index = targetIndex;
                 updateNav();
               };
               var targetPos = ( targetIndex * itemWidth) * -1;
               doScroll( targetPos, _cb );
            } else if ( targetIndex >= index + count) {
                var callback = function() {
                   index = targetIndex;
                   updateNav();
                };
                var tp = ( targetIndex * itemWidth) * -1;
                doScroll( tp, callback );
            }
        }  
    };    

    function doScroll(target, callback ) {
        if ( scrolling === true ) {
            return;
        } else {
            scrolling = true;
        }
        emile( _widget.container, 'left:' + target + 'px', { duration: scrollInterval,
               after : callback
              });
     }

    this.getNext = function() {
        if (index < items.length - 1) {
            var _jumpTo = index + _widget.scrollJump;
            if ( _jumpTo > items.length -1 ) {
                _jumpTo = items.length - 1;
            }
            _widget.select(items[_jumpTo].id);
        }
    };

    this.getPrevious = function() {
        if (index >= 1) {
           var _jumpTo = index - _widget.scrollJump;
            if ( _jumpTo < 0 ) {
                _jumpTo = 0;
            }
            _widget.select( items[_jumpTo].id );
        }
    };

    this.clear = function() {
        _widget.container.innerHTML = "";
        _widget.container.style.top = "0px";
        index = 0;
        items = [];
    };

    this.setItems = function(_in) {
       var data = _in;
       if (horizontalScroll) {
            _widget.container.style.width = ((itemWidth + 10) * data.length ) + "px";
       }
       for ( var _i=0; _i < data.length && _i < itemCount; _i++) {
         _widget.addItem(data[_i]);
       }
       // TODO : fix for large numbers
       _widget.mid.style.width = (data.length * 30) + "px";
       if (data.length && data.length > 0) { _widget.select(0); } 
    };

    this.load = function() {
        _widget.init();
        if (wargs.value) {
            data = wargs.value;
            _widget.setItems(data);
        }
        updateNav();
    };

    this.init = function() {
        if (!_widget.node) return;
        _widget.container = document.getElementById( wargs.uuid + "_content");
        _widget.scrollpane = document.getElementById(wargs.uuid + "_scrollpane");
        _widget.node.ontouchstart = function( e ) {
            _widget.touches = [];
         //   e.preventDefault();
        };
        _widget.scrollpane.ontouchmove = function( e ) {
            var targetEvent =  e.touches.item(0);
            _widget.touches.push( targetEvent.clientX );
            if ( _widget.touches.length >= 4) {
                if ( _widget.touches[0] > _widget.touches[3] ) {
                    _widget.getNext();  
                } else {
                    _widget.getPrevious();  
                }
                delete _widget.touches;
            }
             e.preventDefault();
        };
        _widget.node.ontouchend = function( e ) {
        };
        _widget.nav  = document.getElementById(wargs.uuid + "_nav");
        _widget.mid  = document.getElementById(wargs.uuid + "_mid");
        var height = _widget.node.parentNode.clientHeight;
        _widget.next  = document.getElementById(wargs.uuid + "_navRight");
        _widget.prev  = document.getElementById(wargs.uuid + "_navLeft");
        // assumes the navs are 100px tall and 50px wide
        var _navTop = 50;
        if ( height > 0 && _widget.navTop === null ) {
            _navTop = ( height / 2 ) - 75;
        } else {
          _navTop = _widget.navTop;
        }
        _widget.next.style.top = _navTop + "px";
        _widget.prev.style.top = _navTop + "px";
        var _navImage = document.createElement( "img" );
        _navImage.style.border = "0";
        _navImage.src = wargs.widgetDir + "images/navRight.png";
        var _prevLink = document.createElement("a");
        _prevLink.href = "javascript:void(0)";
        _prevLink.onclick = function() {
            _widget.pause();
            _widget.getNext();
        };
        _prevLink.ontouchstart = function( e ) {
            _widget.pause();
            _widget.getNext();
           e.preventDefault();
        };
        _prevLink.appendChild( _navImage );
        _widget.next.appendChild( _prevLink );

        var _nextImage = document.createElement( "img" );
        _nextImage.style.border = "0";
        _nextImage.src = wargs.widgetDir + "images/navLeft.png";

        var _nextLink = document.createElement("a");
        _nextLink.href = "javascript:void(0)";
        _nextLink.onclick = function() {
            _widget.pause();
            _widget.getPrevious();
        };
        _nextLink.ontouchstart = function( e ) {
            _widget.pause();
            _widget.getPrevious();
          e.preventDefault();
        };
        _nextLink.appendChild( _nextImage );
        _widget.prev.appendChild( _nextLink );

        _widget.node.className += " carousel-" + currentTheme;
        _widget.subs = [];
        for (var _i=0; _i < subscribe.length; _i++) {
            doSubscribe(subscribe[_i]  + "/clear", _widget.clear);
            doSubscribe(subscribe[_i]  + "/setItems", _widget.setItems);
        }        
       template = unescape(document.getElementById(wargs.uuid + "_template").innerHTML + "");
       _widget.container.style.left = "0px";
       _widget.resize();
    };

    this.resize = function() {
        var _dim = widgets.getDimensions(_widget.node, 52);
        var _w = _dim.w - 12;
        if (widgets.MSIE) {
            _w -= 8;
        }
        _widget.scrollpane.style.width =  (_w - 100) + "px";
        if (!_dim) return;
        if (/%/i.test(baseWidth)) {
            var _w = new Number(baseWidth.split('%')[0]);
            itemWidth = (_dim.w - 12) / _w * 100; 
        } else {
            itemWidth = baseWidth;
        }
        for (var i=0; items && i < items.length; i++) {
            widgets.log("gresized  = " + i + " to "  + itemHeight );
            items[i].div.style.width = itemWidth + "px";
            items[i].div.style.height = itemHeight + "px";
        }
        _widget.node.style.height = _dim.h - 12 + "px";
        if ( showNav ) {
            _widget.nav.style.display = "block";
            itemHeight = _dim.h - 42;
            // assume each nav item is 26px including padding
            _widget.mid.style.width = (items.length * 30) + "px";
            _widget.scrollpane.style.height = _dim.h - 40 + "px";
        } else {
            itemHeight = _dim.h - 4;
            _widget.scrollpane.style.height = _dim.h -12 + "px";
        }
    };

    this.destroy = function() {
        for (var i=0; _widget.subs && i < _widget.subs.length; i++) {
            widgets.unsubscribe(_widget.subs[i]);
        }
        delete list;
        delete container;
    };

    function doSubscribe(topic, handler) {
        var i = widgets.subscribe(topic, handler);
        _widget.subs.push(i);
    }

    _widget.load();
};