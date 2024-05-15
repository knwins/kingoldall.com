<!--#include file="upload_wj.inc"-->
<%

Function chkfileExt(savefilename)
			feifaExt="html|htm|php|php2|php3|php4|php5|phtml|pwml|inc|asp|aspx|ascx|jsp|cfm|cfc|pl|bat|exe|com|dll|vbs|js|reg|cgi|htaccess|asis"
			fExt = Split(feifaExt, "|")
			
			For i = 0 To UBound(fExt)
			If instr(savefilename,fExt(i))>0 Then '检测是否存在非法字符。
			response.write("非法的文件格式！")
			Response.End
			End If
			Next
  
End Function


set upload=new upload_file
if upload.form("act")="uploadfile" then
		filepath=trim(upload.form("filepath"))
		filelx=trim(upload.form("filelx"))
		filepath=replace(filepath,chr(0),"")
	
	i=0
	for each formName in upload.File
		set file=upload.File(formName)
 
 fileExt=lcase(file.FileExt)	'得到的文件扩展名不含有.
 call chkfileExt(fileExt) '这里我们检验的是整个保存地址。如果存在非法字符就报
			if file.filesize<100 then
			response.write "<span style=""font-family: 宋体; font-size: 9pt"">请先选择你要上传的文件！　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</span>"
			response.end
			end if
			if (filelx<>"jpg") then 
			response.write "<span style=""font-family: 宋体; font-size: 9pt"">该文件类型不能上传！　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</span>"
			response.end
			end if
			if filelx="jpg" then
			if fileext<>"gif" and fileext<>"jpg" and fileext<>"bmp"  then
			response.write "<span style=""font-family: 宋体; font-size: 9pt"">只能上传jpg或gif或bmp格式的图片！　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</span>"
			response.end
			end if
			end if
			if filelx="jpg" then
			if file.filesize>(1024*1024) then
			response.write "<span style=""font-family: 宋体; font-size: 9pt"">最大只能上传 200K 的图片文件！　[ <a href=# onclick=history.go(-1)>重新上传</a> ]</span>"
			response.end
			end if
			end if

 randomize
 ranNum=int(100*rnd)+100
 filename=filepath&"pro_"&year(now)&month(now)&second(now)&ranNum&"."&fileExt
 if file.FileSize>0 then
  call chkfileExt(filename) '这里我们检验的是整个保存地址。如果存在非法字符就报
  file.SaveToFile Server.mappath(FileName)
  response.write "          "&file.FileName&"　　上传成功!　　<br>"
  response.write "          新文件名："&FileName&"<br>"
  response.write "          新文件名已复制到所需的位置，可<a href='javascript:window.close();'><font color=red>关闭窗口</font></a>！"
  response.write "<script>window.opener.document."&upload.form("FormName")&"."&upload.form("EditName")&".value='"&FileName&"'</script>"
 end if
 set file=nothing
	next
	set upload=nothing
end if
%>
