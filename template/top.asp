<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tbody>
    <tr>
      <td height="120" align="center" valign="bottom" style="background:url(images/top-bg.jpg)"><table width="1000" border="0" cellspacing="0" cellpadding="0">
          <tbody>
            <tr>
              <td height="83" valign="top"><a href="/"><img src="images/logo.jpg" alt="�����н��Ȫ�Ƽ����޹�˾" width="700" height="80" border="0"></a></td>
              <td style="padding-right:10px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tbody>
                    <tr>
                      <td align="right"><a href="/">������ҳ</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="contactus.html" title="��ϵ����">��ϵ����</a></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="right">ȫ���������ߣ�<span class="style6">0755-89328010</span></td>
                    </tr>
                  </tbody>
              </table></td>
            </tr>
          </tbody>
        </table>
        <table width="1000" border="0" cellspacing="0" cellpadding="0">
          <tbody>
            <tr>
              <td width="10"><img src="images/menu-left.jpg" width="10" height="37"></td>
              <td style="background:url(images/menu-bg.jpg)"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tbody>
                    <tr>
                      <td width="2"><img src="images/menu-line.jpg" width="2" height="37"></td>
                      <td width="120" align="center" style="background:url(images/menu-bg2.jpg) center no-repeat;" class="a1"><a href="/" title="������ҳ">��&nbsp;&nbsp;ҳ</a></td>
                      <td width="2"><img src="images/menu-line.jpg" width="2" height="37"></td>
                      <td class="ta1"><a href="aboutus.html" title="��������">��������</a></td>
                      <td width="2"><img src="images/menu-line.jpg" width="2" height="37"></td>
                      <td class="ta1"><a href="product_58.html" title="��Ʒ����">��Ʒ����</a></td>
                      <td width="2"><img src="images/menu-line.jpg" width="2" height="37"></td>
                      <td class="ta1"><a href="news.html" title="��������">��������</a></td>
                      <td width="2"><img src="images/menu-line.jpg" width="2" height="37"></td>
                      <td class="ta1"><a href="zizhi.html" title="��������">��������</a></td>
                      <td width="2"><img src="images/menu-line.jpg" width="2" height="37"></td>
                      <td class="ta1"><a href="sales.html" title="Ӫ������">Ӫ������</a></td>
                      <td width="2"><img src="images/menu-line.jpg" width="2" height="37"></td>
                      <td class="ta1"><a href="feedback.asp" title="���߶���">���߶���</a></td>
                      <td width="2"><img src="images/menu-line.jpg" width="2" height="37"></td>
                      <td class="ta1"><a href="contactus.html" title="��ϵ����">��ϵ����</a></td>
                      <td width="2"><img src="images/menu-line.jpg" width="2" height="37"></td>
                    </tr>
                  </tbody>
              </table></td>
              <td width="10"><img src="images/menu-right.jpg" width="10" height="37"></td>
            </tr>
          </tbody>
      </table></td>
    </tr>
  </tbody>
</table>
<table width="1000" border="0" align="center" cellpadding="0" cellspacing="0">
  <tbody>
    <tr>
      <td height="10"></td>
    </tr>
    <tr>
      <td>
       <div class=banners>
    <div id=idContainer2 class=container>
      <table id=idSlider2 border=0 cellspacing=0 cellpadding=0>
        <tbody>
          <tr>
             <%set rs=server.createobject("adodb.recordset")
sql="select * from banner where ver='cn' order by id desc"
rs.open sql,conn,1,1
do while not rs.eof
%>
            <td class=td_f><a href="<%=rs("url")%>" target="_blank"><img src="<%=rs("p_image")%>" /></a></td>
    <%
rs.movenext
loop
rs.close
set rs=nothing%>
          </tr>
        </tbody>
      </table>
      <ul id=idNum class=num>
      </ul>
    </div>
    <script type=text/javascript src="js/banner.js"></script>
  </div></td>
    </tr>
    <tr>
      <td height="5"></td>
    </tr>
  </tbody>
</table>