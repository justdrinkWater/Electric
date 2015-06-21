
<%@ page language="java" pageEncoding="UTF-8"%>







<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="http://localhost:8090/DRMS/">
    
    <title></title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="${pageContext.request.contextPath }/script/function.js"></script>
		<script language="javascript" src="${pageContext.request.contextPath }/script/calendar.js" charset="gb2312"></script>
		<script language="javascript" src="${pageContext.request.contextPath }/script/changePageBackUp.js"></script>
    <style type="text/css">
<!--
body {
	background-color: #FFFFFF;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
td,select  {
	font-size: 12px;
}
-->
</style>
  <script>
<!--
function CheckOthers(form)
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
//		if (e.name != 'chkall')
			if (e.checked==false)
			{
				e.checked = true;// form.chkall.checked;
			}
			else
			{
				e.checked = false;
			}
			e.checked = false;
	}
}

function CheckAll(form)
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
//		if (e.name != 'chkall')
			e.checked = true// form.chkall.checked;
	}
}
//-->
</script>
  </head>
  
  <body>
  <form name="Form1" method="post" language="javascript" action="#">
    <table width="95%" border="0" cellpadding="0" cellspacing="1" bordercolor="#f5fafe" bgcolor="#AFD1F3" id="table8">
            
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01">选择</td>
                <td width="147" bgColor="#F5FAFE" class="ta_01">设备名称</td>
                <td width="50" bgColor="#F5FAFE" class="ta_01">所属单位</td>
              </tr>
             
             
             
             
             
              
					
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="ab15b1290c004d53af24bd2ce8845fa4" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">UPS123</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="aa07b80f0c104ba38ebfb049c375997f" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">UPS44444</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="e11c8381ec0f436b992ba0e44dd33cb0" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">UPS6666</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="c51da3d47c814b488d4a4206c7a1703f" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">UPS789</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="8b788d86e15743af9d99871cd1a625b3" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">UPS99999</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="12a794ed3ae243ffa4dcad631ea756c9" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">UPSaaa</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="feb787e55063498286b265bcc3f2a80d" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">UPSbbb</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="3ab65799250542dd95bf6750e929818d" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">大头鬼</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="7ad11c5f9d9a47d9984c0e8bfc0bdb34" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">短波天线123-1</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="98d9d475173a4946926315946ea5273b" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">短波天线123-10</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="e4ee1fa474a2416a8ddd26f3f3436297" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">短波天线123-11</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="6f89665a03444a54a0bf6fb7e235333c" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">短波天线123-12</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="dabe3ec0a04b42f0a9150d8f0561b844" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">全密封电力变压器123</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="e2fa26276a2f499ea4144ace4ea2189a" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">卫星接收天线11111</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="b9d8c568d9464ca48284f232cdbc2b7a" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">卫星接收天线123</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="7cb028992989425eadae2419c23144e7" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">卫星接收天线qqqqqq</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="0f0f387284ad4a1692ec8058d9aa9e90" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">卫星接收天线wwwwww</td>
                <td class="ta_01" bgColor="#F5FAFE">540</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="ee1cf4ceb3fa440a9699fd8c6dad7d30" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">测试经济界</td>
                <td class="ta_01" bgColor="#F5FAFE">560</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="b465f4f90e674595939b4a27ac0e9e55" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">大大大</td>
                <td class="ta_01" bgColor="#F5FAFE">560</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="cead44193f7b499bb8ded9653c6e9a93" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">大二</td>
                <td class="ta_01" bgColor="#F5FAFE">560</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="1bd1def8b7fe48d8893f5a54580473a6" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">大三</td>
                <td class="ta_01" bgColor="#F5FAFE">560</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="05d826f229914a7789c61caae64d64d5" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">大一</td>
                <td class="ta_01" bgColor="#F5FAFE">560</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="d9cf7e522e8b4ff69fca4a32e8fd56f0" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">高压开关柜-4123</td>
                <td class="ta_01" bgColor="#F5FAFE">560</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="3508c0c6598b495f96c948502a78414e" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">蓄电池-1CESHI</td>
                <td class="ta_01" bgColor="#F5FAFE">560</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="4617b1ed422046eb913a8cc49c792484" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">123</td>
                <td class="ta_01" bgColor="#F5FAFE">成都台</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="95d3f5520b0a41febaca4c1a6d41a7b9" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">大额</td>
                <td class="ta_01" bgColor="#F5FAFE">成都台</td>
              </tr>
             
					
              <tr>
                <td width="47" align="center" bgColor="#F5FAFE" class="ta_01"><span style="CURSOR:hand; HEIGHT:22px">
                  <input type="checkbox" name="devId" value="efd526fbabc74e56a6644175a240114f" />
                </span></td>
                <td class="ta_01" bgColor="#F5FAFE">大撒</td>
                <td class="ta_01" bgColor="#F5FAFE">厦门台</td>
              </tr>
             
				
				
				
          </table></form> 
  </body>
</html>
