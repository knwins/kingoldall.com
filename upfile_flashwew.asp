<!--#include file="upload_wj.inc"-->
<%

Function chkfileExt(savefilename)
			feifaExt="html|htm|php|php2|php3|php4|php5|phtml|pwml|inc|asp|aspx|ascx|jsp|cfm|cfc|pl|bat|exe|com|dll|vbs|js|reg|cgi|htaccess|asis"
			fExt = Split(feifaExt, "|")
			
			For i = 0 To UBound(fExt)
			If instr(savefilename,fExt(i))>0 Then '����Ƿ���ڷǷ��ַ���
			response.write("�Ƿ����ļ���ʽ��")
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
 
 fileExt=lcase(file.FileExt)	'�õ����ļ���չ��������.
 call chkfileExt(fileExt) '�������Ǽ���������������ַ��������ڷǷ��ַ��ͱ�
			if file.filesize<100 then
			response.write "<span style=""font-family: ����; font-size: 9pt"">����ѡ����Ҫ�ϴ����ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
			response.end
			end if
			if (filelx<>"jpg") then 
			response.write "<span style=""font-family: ����; font-size: 9pt"">���ļ����Ͳ����ϴ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
			response.end
			end if
			if filelx="jpg" then
			if fileext<>"gif" and fileext<>"jpg" and fileext<>"bmp"  then
			response.write "<span style=""font-family: ����; font-size: 9pt"">ֻ���ϴ�jpg��gif��bmp��ʽ��ͼƬ����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
			response.end
			end if
			end if
			if filelx="jpg" then
			if file.filesize>(1024*1024) then
			response.write "<span style=""font-family: ����; font-size: 9pt"">���ֻ���ϴ� 200K ��ͼƬ�ļ�����[ <a href=# onclick=history.go(-1)>�����ϴ�</a> ]</span>"
			response.end
			end if
			end if

 randomize
 ranNum=int(100*rnd)+100
 filename=filepath&"pro_"&year(now)&month(now)&second(now)&ranNum&"."&fileExt
 if file.FileSize>0 then
  call chkfileExt(filename) '�������Ǽ���������������ַ��������ڷǷ��ַ��ͱ�
  file.SaveToFile Server.mappath(FileName)
  response.write "          "&file.FileName&"�����ϴ��ɹ�!����<br>"
  response.write "          ���ļ�����"&FileName&"<br>"
  response.write "          ���ļ����Ѹ��Ƶ������λ�ã���<a href='javascript:window.close();'><font color=red>�رմ���</font></a>��"
  response.write "<script>window.opener.document."&upload.form("FormName")&"."&upload.form("EditName")&".value='"&FileName&"'</script>"
 end if
 set file=nothing
	next
	set upload=nothing
end if
%>