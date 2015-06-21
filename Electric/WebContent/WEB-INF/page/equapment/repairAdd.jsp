
<%@ page language="java" pageEncoding="UTF-8"%>








<html>
<head>
<title>设备检修记录添加</title>

<link href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet">
<script language="javascript" src="${pageContext.request.contextPath }/script/function.js"></script>
		<script language="javascript" src="${pageContext.request.contextPath }/script/calendar.js" charset="gb2312"></script>
		<script language="javascript" src="${pageContext.request.contextPath }/script/changePageBackUp.js"></script>
<script language="javascript">
function shareOnChange(mySelect)
{
   if (mySelect.selectedIndex == 0)
    {
    PPassword.style.display = ""
    
    }
   else
    PPassword.style.display = "none"
}

</script>

<SCRIPT type="text/javascript">

     function check(){
         var theForm = document.forms[0];
   
	    
	    if(Trim(theForm.startDate.value)==""){
	
	    	alert("请输入校准日期");
			theForm.startDate.focus();
			return false;
	    }
	   if(theForm.comment.value.length>250){
     
        	alert("备注字符长度不能超过250");
			theForm.comment.focus();
			return false; 
        }
        if(theForm.record.value.length>250){
     
        	alert("记录描述字符长度不能超过250");
			theForm.record.focus();
			return false; 
        }
	 if(window.opener)
	{
		document.Form1.action="addDeviceJ.do";
		document.Form1.submit();
		alert("保存成功！");
		
	    window.opener.Pub.submitActionWithForm('Form1','toDeviceJ.do','F1'); 
	    
	}
	window.close();
}
</SCRIPT>
<SCRIPT type="text/javascript">
function submitrequest(action){
     eval("document.location='"+action+"'");
}

</SCRIPT>
</head>
<body  onunload="submitrequest('clearSession.do?action=J')">

<form name="Form1" method="post" >
           <br>
			<table  cellSpacing="1" cellPadding="5" width="680" align="center" bgColor="#eeeeee" style="border:1px solid #8ba7e3" border="0">
				<TBODY>			
				 <tr>
			        <td class="ta_01" align="center" background="${pageContext.request.contextPath }/images/b-info.gif">
			         <font face="宋体" size="2"><strong>设备检修记录添加</strong></font>
			        </td>
		          </tr>
					<tr>
						<td>
							<table cellpadding="0" cellspacing="0" border="0" width="100%">
								<tbody>

<tr>
									<td width="153" class="ta_01" align="center" bgColor="#f5fafe" height="22">所属单位：</td>
									<td class="ta_01" bgColor="#ffffff">	<select name="jctId" id="jctId" class="bg" disabled>
							<option value=""></option>
							
					
				
				
						
						 <option value="1" selected>
								540
							</option>
						
						
				 
						
						
					        <option value="2">
								560
							</option>
					
				 
						
						
					        <option value="3">
								成都台
							</option>
					
				 
						
						
					        <option value="4">
								厦门台
							</option>
					
				 
						
						
					        <option value="5">
								553台
							</option>
					
				 
						
						
					        <option value="6">
								201台
							</option>
					
				 
						
						
					        <option value="7">
								202台
							</option>
					
				 
						
						
					        <option value="8">
								203台
							</option>
					
				 
						
						
					        <option value="9">
								哈尔滨台
							</option>
					
				 
						
						
					        <option value="10">
								西安台
							</option>
					
				 
						
						
					        <option value="11">
								中心
							</option>
					
				 
						
						
					        <option value="12">
								北京台
							</option>
					
				 
						
						
					        <option value="13">
								海南台
							</option>
					
				 
				
				
				
				
				
						</select></td>
<td width="100" class="ta_01" align="center" bgColor="#f5fafe" height="22">
									设备名称：</td>
									<td class="ta_01" bgColor="#ffffff"><font face="宋体" color="red">
<input name="devName" type="text" id="devName" size="19" value="UPS789" disabled></font></td>									

								</tr>
									<tr>
									
									<td width="153" class="ta_01" align="center" bgColor="#f5fafe" height="22">
									检修周期：</td>
									<td class="ta_01" bgColor="#ffffff" width="224">
									
					<input name="TB_timeW" type="text" id="TB_timeW" size="19"  value="1月" disabled></td>
<td width="100" class="ta_01" align="center" bgColor="#f5fafe" height="22">
									使用日期：</td>
									<td class="ta_01" bgColor="#ffffff"><font face="宋体" color="red">
<input name="TB_timeW" type="text" id="TB_timeW" size="19" value="2007-04-28" disabled></font></td>
								</tr>
<tr>
<td width="153" class="ta_01" align="center" bgcolor="#f5fafe" height="22">
					设备类型：</td>
					<td class="ta_01" bgcolor="#ffffff" width="247">
				<select name="devType" id="devType" class="bg" disabled>
							
						
						
						
						 <option value="1" selected>
								电力设备dd
							</option>
						
						
					        <option value="1">
								电力设备dd
							</option>
					
				 
						
						
					        <option value="2">
								天线设备
							</option>
					
				 
						
						
					        <option value="3">
								通讯设备
							</option>
					
				 
						
						
					        <option value="4">
								防雷设备
							</option>
					
				 
						
						
					        <option value="5">
								办公设备
							</option>
					
				 
						
						
					        <option value="6">
								电视机房设备
							</option>
					
				 
						
						
					        <option value="7">
								广播机房设备
							</option>
					
				 
				
						</select>
</td>
<td width="100" class="ta_01" align="center" bgColor="#ffffff" height="22"></td>
									<td class="ta_01" bgColor="#ffffff" width="224">
								</td>


</tr>

<tr>
<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">
					检修日期：</td>
					<td class="ta_01" bgcolor="#ffffff">
					<font face="宋体" color="red">
					<input name="startDate" type="text" size="19" id="startDate" onclick="JavaScript:calendar(this)"></font>&nbsp;<font color="#FF0000">*</font></td>
									
									
<td class="ta_01" align="center" bgcolor="#ffffff" height="22"></td>
					<td class="ta_01" bgcolor="#ffffff"></td>
						
					
								</tr>
<TR>
<TD class="ta_01" align="center" bgColor="#f5fafe">检修记录：</TD>
<TD class="ta_01" bgColor="#ffffff" colSpan="3">
<select   name="isHaving" id="isHaving" class="bg" style="width:50"  name=ifshare onChange=shareOnChange(this)>
  
  <option value="1">有</option>
  <option value="0"  selected>无</option>
</select>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <span  id=PPassword style="DISPLAY: none">
  <input style="font-size:12px; color:black; height=22;width=55"  id="BT_Add" type="button" value="详细" name="BT_Add" onClick="openWindowWithName('TianJiaJ.do?ZhengRi1=1&devId=c51da3d47c814b488d4a4206c7a1703f',800,450,'ECC');" />
  </span>
</TD>
</TR>

<TR>
<TD class="ta_01" align="center" bgColor="#f5fafe">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</TD>
<TD class="ta_01" bgColor="#ffffff" colSpan="3"><textarea name="comment" id="comment" style="WIDTH:96%" rows="3"></textarea></TD>
</TR>
			<tr>
<td class="ta_01" align="center" bgColor="#f5fafe" height="22">记录描述：</td>
								  <td height="22" colspan="3" bgColor="#FFFFFF" class="ta_01"><font face="宋体" color="red"> </font>
								    <input name="devId" type="hidden" id="devId" class="bg" size="15"  value="c51da3d47c814b488d4a4206c7a1703f">							
				<textarea name="record" id="record" style="WIDTH:96%" rows="3"></textarea></td>									
</tr>

<tr>
					<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4"><input type="button" name="BT_Submit" value=" 保存"   onclick="return check();" id="BT_Submit" style="font-size:12px; color:black; height=22;width=55" /><FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT><INPUT style="font-size:12px; color:black; height=22;width=55"  type="reset" value=" 关闭" ID="Reset1" NAME="Reset1" onClick="window.close();" />
						<span id="Label1"></span>					</td>
				</tr >

								</tbody>

								</table>
								</td>
					</tr>
				
				</TBODY>
			</table>
		</form>
	</body>
</HTML>