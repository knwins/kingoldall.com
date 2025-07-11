
var oldimg="img1";//上一张图片
var oldef=1;//上一标点
var sumlen=0;
var time1;
var oldimg1="img1";//上一张图片
var oldef1=1;//上一标点
var sumlen1=0;
var time2;
var timenum=0;//变化状态

$(document).ready(function() {
    //浮动信息
    $(".float_showmidea").css({"left":$(window).width()-($(".float_showmidea").width()+5),"top":"5px"});
    $(".float_showmidea").prepend("<div align=\"right\" style=\"position:absolute;top:0px;right:5px;margin:2px;padding:3px;  font-size:14px;cursor:pointer;border:1px solid #b1b2b1;line-height:100%;z-index:999999; width:16px;height:16px \" class=\"closeshowmidea\">×</div>");
    $(window).scroll(function(){ 
//        alert("ffff");
         $(".float_showmidea").css({"top":($(window).scrollTop()+5)}); 
    }) ;
    
    $(".closeshowmidea").click(function() {
        $(".float_showmidea").hide();
    });


    var myar = setInterval('AutoScroll(".news_sy_left")', 5000)
    $(".news_sy_left").hover(function() { clearInterval(myar); }, function() { myar = setInterval('AutoScroll(".news_sy_left")', 2000) }); //当鼠标放上去的时候，滚动停止，鼠标离开的时候滚动开始    
    
    //自动播放
      time1=setInterval("ProductBottomImg()",8000);

    //首页底部产品切换
    var clickimg=0;
    $(".mended_top>a>img").click(function() {
        $(this).attr("src","images/xsy01.jpg");
        clearInterval(time1);
        if($(this).attr("id")=="rows1"&&clickimg==1)
        {
            $("#rows2").attr("src","images/xsy02.jpg");
            clickimg=0;
            timenum=0;
        }
        else if($(this).attr("id")=="rows2"&&clickimg==0)
        {
             $("#rows1").attr("src","images/xsy02.jpg");
             clickimg=1;
             timenum=1; 
        }
        $(".mended_main>ul").animate({left:"-364px"},1000,function() {
                $(this).css({left:"0px"}).find("li:first").appendTo(this);
                $(this).find("li:first").appendTo(this);
                $(this).find("li:first").appendTo(this);
                $(this).find("li:first").appendTo(this);
        });
        //延长一倍时间
        time1=setInterval("ProductBottomImg()",8000);
    });
    
    
    //鼠标移上产品类型图片停止动画
    $(".mended_main").mouseover(function() {

        clearInterval(time1);
    }).mouseout(function() {
        time1=setInterval("ProductBottomImg()",8000);
    });
    //鼠标移上出现对应的类型名称
//     $(".mended_main>ul>li").mouseover(function() {
//            $(this).find("div").css({"display":""});
//        }).mouseout(function() {
//            $(this).find("div").css({"display":"none"});
//        });
    
    //首页左下角视屏播放
//    $(".flv_main>ul>li").click(function() {
//        $(".big_swf").css({"left":($(window).width()-$(".big_swf").width())/2,"top":($(window).height()-$(".big_swf").height())/2});
//        $(".big_swf").css({"display":""});
//    });


    //首页弹出浮动ＤＶ
    $(".flv_bf>a").click(function() {
         $(".indexfloat_div").css({"height":$(document).height(),"display":""});
        $(".big_swf").css({"left":($(window).width()-$(".big_swf").width())/2,"top":($(window).height()-$(".big_swf").height())/2});
        $(window).scroll(function(){ 
         $(".big_swf").css({"top":($(window).scrollTop()+($(window).height()-$(".big_swf").height())/2+floattop)}); 
        }) ;
        $(".big_swf").css({"display":""});
        videostr="paradise/DownLoad/FLV/FLV4.flv";
        if (swfobject.hasFlashPlayerVersion("9")) {
	        var params = {
		        quality: "high",
		        scale: "noscale",
		        wmode: "transparent",
		        allowscriptaccess: "always",
		        allowFullScreen: "true"
		        
	        };
	        var flashvars = {};
			flashvars.flvPath = videostr;

	        var attributes = {
		        id: "IndexVideo",
		        name: "IndexVideo"
	        };
        	
	        swfobject.embedSWF("IndexVideo.swf", "IndexVideo", "100%", "100%", "9.0.124", "expressInstall.swf", flashvars, params, attributes);
        }
        else 
            $("#IndexVideo").html("<a href=\"http://www.adobe.com/go/getflashplayer\"><img src=\"inages/noflash.bmp\" /></a><p>您的Flash版本太低，请更新您的Flash播放器</p>");
    });
    $(".flv_main>ul>li").click(function() {
        $(".indexfloat_div").css({"height":$(document).height(),"display":""});
        $(".big_swf").css({"left":($(window).width()-$(".big_swf").width())/2,"top":($(window).height()-$(".big_swf").height())/2});
        $(window).scroll(function(){ 
         $(".big_swf").css({"top":($(window).scrollTop()+($(window).height()-$(".big_swf").height())/2+floattop)}); 
        }) ;
        $(".big_swf").css({"display":""});
        var videostr="";
        if($(this).attr("class")=="flv01")
        {
            videostr="media/indextvc.flv";
        }
        else if($(this).attr("class")=="flv02")
        {
            videostr="paradise/DownLoad/Flv/b1.flv";
        }
        else if($(this).attr("class")=="flv03")
        {
            videostr="paradise/DownLoad/FLV/FLV1.flv";
        }
        
        if (swfobject.hasFlashPlayerVersion("9")) {
	        var params = {
		        quality: "high",
		        scale: "noscale",
		        wmode: "transparent",
		        allowscriptaccess: "always",
		        allowFullScreen: "true"
		        
	        };
	        var flashvars = {};
			flashvars.flvPath = videostr;

	        var attributes = {
		        id: "IndexVideo",
		        name: "IndexVideo"
	        };
        	
	        swfobject.embedSWF("IndexVideo.swf", "IndexVideo", "100%", "100%", "9.0.124", "expressInstall.swf", flashvars, params, attributes);
        }
        else 
            $("#IndexVideo").html("<a href=\"http://www.adobe.com/go/getflashplayer\"><img src=\"inages/noflash.bmp\" /></a><p>您的Flash版本太低，请更新您的Flash播放器</p>");
    });
    
    imagePreview();
});

/**********************************************************************************************************************************************************************/
//新闻效果
AutoLeft=function() {
        $(".news_sy_left").find("ul:first").animate({marginTop:"25px"},500,function(){
            $(this).css({marginTop:"0px"}).find("li:last").prependTo(this);
        });
    }
    
    AutoRight=function() {
        $(".news_sy_left").find("ul:first").animate({
            marginTop: "-25px"
        }, 500, function() {
            $(this).css({ marginTop: "0px" }).find("li:first").appendTo(this);
        });
    }
    
    function AutoScroll(obj) {

        $(obj).find("ul:first").animate({
            marginTop: "-25px"
        }, 500, function() {
            $(this).css({ marginTop: "0px" }).find("li:first").appendTo(this);
        });
    }

/**********************************************************************************************************************************************************************/
//鼠标移动显示名称
this.imagePreview = function(){   
    xOffset = 35;
    yOffset = 30;
    // 可以自己设定偏移值

$(".mended_main>ul>li").hover(function(e){
    $(".sbgs").html($(this).attr("id"));
    $(".sbgs").css("top",(e.pageY - xOffset) + "px").css("left",(e.pageX - yOffset) + "px").css("display","");},function(){$(".sbgs").css("display","none");}); 
    $(".mended_main>ul>li").mousemove(function(e){$(".sbgs").css("top",(e.pageY - xOffset) + "px").css("left",(e.pageX - yOffset) + "px");
});   


};
/**********************************************************************************************************************************************************************/

//关闭首页弹出浮动ＤＶ层
closeVideo=function()
{
    $(".big_swf").css({"display":"none"});
    $(".swf").html("");
    $(".indexfloat_div").css({"display":"none"});
}

function ImageTimeShow()
{
    if(oldef==sumlen)
     {
        $("#img"+oldef).hide(500);
        $(".js_left>img").attr("src","images/index_08.jpg");
        $(".js_left>img:eq(0)").attr("src","images/index_09.jpg");
        $("#img1").show(500);

        oldimg="img1";
        oldef=1;
     }
     else
     {
        $("#img"+oldef).hide(500);
        $(".js_left>img").attr("src","images/index_08.jpg");
        $(".js_left>img:eq("+(oldef)+")").attr("src","images/index_09.jpg");
        oldef++;
        oldimg="img"+oldef;
        $("#img"+(oldef)).show(500);
       
     }
}

function IndexTimeShow()
{
    if(oldef1==sumlen1)
     {
        $("#cenimg"+oldef1).hide(500);
        $(".banner_sy_min>li").attr("src","images/index_fl_cen1.png");
        $(".banner_sy_min>li:eq(0)").attr("src","images/index_fl_cen2.png");
        $("#cenimg1").show(500);
        oldef1=1;
     }
     else
     {
        $("#cenimg"+oldef1).hide(500);
        $(".banner_sy_min>li").attr("src","images/index_fl_cen1.png");
        $(".banner_sy_min>li:eq("+(oldef1)+")").attr("src","images/index_fl_cen2.png");
        oldef1++;
        $("#cenimg"+oldef1).show(500);
     }
}

//延长一倍时间
function ImageTwoTime()
{
    time1=setInterval("ImageTimeShow()",3000);
}

/********************************************************************************************************************************************************/
//首页中底部效果
/********************************************************************************************************************************************************/

ProductBottomImg=function() {
    if(timenum==0)
    {
        $("#rows2").attr("src","images/xsy01.jpg");
        $("#rows1").attr("src","images/xsy02.jpg");
        timenum=1;
        clickimg=1;
    }
    else if(timenum==1)
    {
         $("#rows1").attr("src","images/xsy01.jpg")
         $("#rows2").attr("src","images/xsy02.jpg");
        timenum=0;
        clickimg=0;
    }
    $(".mended_main>ul").animate({left:"-364px"},1000,function() {
        $(this).css({left:"0px"}).find("li:first").appendTo(this);
        $(this).find("li:first").appendTo(this);
        $(this).find("li:first").appendTo(this);
        $(this).find("li:first").appendTo(this);
    });
}
