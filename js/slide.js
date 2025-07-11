
var xsImgTextheight = text_height;

document.write("<style type=\"text/css\">#slidearea { width:" + xsImgSize[0] + "px; height:" + xsImgSize[1] + "px; margin: 0 auto; } #slidefooter {width:" + xsImgSize[0] + "px; margin: 0 auto;} #slidenext, #slideprev {display: block; overflow: hidden;} #slideprev {float: left; } #slidenext {float: right; } #slidetext { margin: 0; width:" + (parseInt(xsImgSize[0])-40) + "px !important; width:" + (parseInt(xsImgSize[0])-46) + "px; overflow: hidden; text-align: center; }</style>")

//¡§a????????¨¤¡§¡§¡§¡èy???¡è?
var flag=false;
function DrawImage(ImgD){
var image=new Image();
var iwidth = 878; //??¡ì¡§¡ã??¡§oD¡§a¡§a????¡§a?¡§¡§
var iheight = 200; //??¡ì¡§¡ã??¡§oD¡§a¡§a??????¡§¡§
image.src=ImgD.src;
if(image.width>0 && image.height>0){
flag=true;
if(image.width/image.height>= iwidth/iheight){
if(image.width>iwidth){ 
ImgD.width=iwidth;
ImgD.height=(image.height*iwidth)/image.width;
}else{
ImgD.width=image.width; 
ImgD.height=image.height;
}
}
else{
if(image.height>iheight){ 
ImgD.height=iheight;
ImgD.width=(image.width*iheight)/image.height; 
}else{
ImgD.width=image.width; 
ImgD.height=image.height;
}
}
}
} 

document.write("<div id=\"slidearea\">")
if (xsImgs.length != 0) {
	document.write("<a href=\""+ xsImgLinks[0] +"\" target=\"_blank\"><img src=\"" + xsImgs[0] + "\" onload=\"imgLoadNotify();\" \/><\/a>")
}
document.write("<\/div>")

if (xsImgTextheight != 0) {
	document.write("<div id=\"slidefooter\">")
	if (xsImgTexts.length != 0) {
		document.write("<a id=\"slideprev\" title=\"¡§|?¡§¡ã??¡è¡§¡ä\" href=\"#\" onclick=\"rewind();return false\">&laquo;<\/a><a id=\"slidenext\" title=\"??¡§¡ã??¡è¡§¡ä\" href=\"#\" onclick=\"forward();return false\">&raquo;<\/a><p id=\"slidetext\"><a href=\""+ xsImgLinks[0] +"\" target=\"_blank\">"+ xsImgTexts[0] +"<\/a><\/p>")
	}
	document.write("<\/div>")
}


var arrPreload = new Array();
var begImg  = 0;
var arrPreload = new Array();
var spd = 2;

function init()
{
    preloadRange(0,_PRELOADRANGE-1);

    curImg = begImg;
    if (curImg < 0 || curImg > xsImgs.length - 1)
	curImg = xsImgs.length - 1;
    changeSlide();
    setTimeout("play()", 2000)
}



var curImg = 0;
var timerId = -1;
var interval = 2500;
var imgIsLoaded = false;

var current_transition = 15;
var flag = true;
var bFirst = false;


var transitions = new Array;
transitions[0] = "progid:DXImageTransform.Microsoft.Fade(duration=1)";
transitions[1] = "progid:DXImageTransform.Microsoft.Blinds(Duration=1,bands=20)";
transitions[2] = "progid:DXImageTransform.Microsoft.Checkerboard(Duration=1,squaresX=20,squaresY=20)";
transitions[3] = "progid:DXImageTransform.Microsoft.Strips(Duration=1,motion=rightdown)";
transitions[4] = "progid:DXImageTransform.Microsoft.Barn(Duration=1,orientation=vertical)";
transitions[5] = "progid:DXImageTransform.Microsoft.GradientWipe(duration=1)";
transitions[6] = "progid:DXImageTransform.Microsoft.Iris(Duration=1,motion=out)";
transitions[7] = "progid:DXImageTransform.Microsoft.Wheel(Duration=1,spokes=12)";
transitions[8] = "progid:DXImageTransform.Microsoft.Pixelate(maxSquare=10,duration=1)";
transitions[9] = "progid:DXImageTransform.Microsoft.RadialWipe(Duration=1,wipeStyle=clock)";
transitions[10] = "progid:DXImageTransform.Microsoft.RandomBars(Duration=1,orientation=vertical)";
transitions[11] = "progid:DXImageTransform.Microsoft.Slide(Duration=1,slideStyle=push)";
transitions[12] = "progid:DXImageTransform.Microsoft.RandomDissolve(Duration=1,orientation=vertical)";
transitions[13] = "progid:DXImageTransform.Microsoft.Spiral(Duration=1,gridSizeX=40,gridSizeY=40)";
transitions[14] = "progid:DXImageTransform.Microsoft.Stretch(Duration=1,stretchStyle=push)";
transitions[15] = "special case";
var transition_count = 15;

var _PRELOADRANGE = 5;

function preloadRange(intPic,intRange) {
	var divStr = "";
	for (var i=intPic; i<(intPic+intRange); i++) {
		arrPreload[i] = new Image();
		arrPreload[i].src = xsImgs[i];	
	} 
	return false;
}

function imgLoadNotify()
{
    imgIsLoaded = true;
}

function changeSlide(n)
{	
    if (document.all)
	{    	
		var do_transition;
		if (current_transition == (transition_count)) 
		{
			do_transition = Math.floor(Math.random() * transition_count);
		} 
		else 
		{
			do_transition = current_transition;
		}
		document.all.slidearea.style.filter=transitions[do_transition];
		document.all.slidearea.filters[0].Apply();			
    }
    
    imgIsLoaded = false;
	
	if (xsImgs.length !=0) {
		var slideImage = "<img src=\"" + xsImgs[curImg] + "\"/>";
		document.getElementById("slidearea").innerHTML = slideImage ;
		
		if (xsImgTextheight != 0) {
			var slideText = "<a href=\""+ xsImgLinks[curImg] +"\" target=\"_blank\">"+ xsImgTexts[curImg] +"<\/a>";
			document.getElementById("slidetext").innerHTML = slideText ;
		}
	
		if (document.all) 
		{			
			document.all.slidearea.filters[0].Play();		
		}
	}
}

function forward()
{
	imgIsLoaded = false;
	if (!arrPreload[curImg+1])
	{
		curImg++;
		if (curImg >= xsImgs.length) 
		{ 
			curImg = 0;
		} 
	} 
	else 
	{
		curImg++;
		if (curImg >= xsImgs.length) 
		{  
			curImg = 0;
		}
	}
	changeSlide();
}

function rewind()
{
	curImg--;
	if (curImg < 0)
	{
		curImg = xsImgs.length-1;		
	}
	changeSlide();
}

function stop()
{
    window.clearInterval(timerId);
    timerId = -1;
    imgIsLoaded = true;
}

function play()
{
    if (timerId == -1) 
		timerId = window.setInterval('forward();', interval);
}


init();