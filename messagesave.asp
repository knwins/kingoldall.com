<%
company=request.form("company")
user=request.form("user")
address=request.form("address")
phone=request.form("phone")
suliang=request.form("suliang")
title=request.form("title")
content=request.form("content")
email=request.form("email")
mymail=request.form("mymail")
mailsubject="�ͻ�������Ϣ"
content = "<span style='font-family:Verdana,; font-size:9pt;'>�ͻ��ύ��Ϣ����:<br>��˾���Q:"&company&"<br>�M��:"&user&" <br>�Ԓ:"&phone&"<br>��Ʒ����:"&title&"<br>��������:"&suliang&"<br>���ԃ���:"&content&"<br>��ַ:"&address&"<br><br>ϵͳ������Ϣ����ǻظ�!</span>"

Set msg = Server.CreateObject("JMail.Message")
msg.silent = true
msg.Logging = true
msg.Charset = "gb2312"
msg.MailServerUserName = "yingjc1983@126.com" '��Ϊ������ĵ�¼�ʺţ�ʹ��ʱ�����Ϊ�Լ��������¼�ʺ�
msg.MailServerPassword = "yidvfhpdw_2012" '��Ϊ������ĵ�¼���룬ʹ��ʱ�����Ϊ�Լ��������¼����
msg.From = "yingjc1983@126.com" '������Email
msg.FromName = "��������" '����������
msg.AddRecipient mymail '�ռ���Email
msg.Subject = mailsubject '�ʼ�����
msg.Body = content '�ʼ�����
msg.contenttype ="text/html"
msg.Send ("smtp.126.com") 'SMTP��������ַ
msg.close()
set msg = nothing
response.write"<SCRIPT language=JavaScript>alert('�ύ�ɹ�,��˾������ظ���!');"
response.write"this.location.href='index.html';</SCRIPT>" 
%> 