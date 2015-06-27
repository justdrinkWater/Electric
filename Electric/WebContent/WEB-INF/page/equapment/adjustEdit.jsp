<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>设备校准记录编辑</title>
<link href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/function.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/calendar.js"
	charset="gb2312"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/changePageBackUp.js"></script>
<script type="text/javascript"><!--
function shareOnChange(mySelect)
{
if (mySelect.selectedIndex == 0)
    {
    PPassword.style.display = "none"
    }
else
    PPassword.style.display = ""
}

</script>
<script type="text/javascript">
function ini(){
   document.Form1.isHaving == 1;
   PPassword.style.display = ""
}
function check(){
     
     var theForm = document.forms[0];
   	if (theForm.comment.value.length >250)
		{
		    alert("备注不能超过250个汉字！");
		    theForm.comment.focus();
		    return false;
		}
		if (theForm.record.value.length >250)
		{
		    alert("记录描述不能超过250个汉字！");
		    theForm.record.focus();
		    return false;
		}
	 if(window.opener)
	{
		document.Form1.action="updateDeviceX.do";
		document.Form1.submit();
		alert("保存成功！");
	    //window.opener.Pub.submitActionWithForm('Form1','toDeviceX.do','F1');   
	  
	}
	window.close();
}
</script>
<SCRIPT type="text/javascript">
function submitrequest(action){
  eval("document.location='"+action+"'");
}

</script>
</head>
<body onload="shareOnChange(document.Form1.isHaving)"
	onunload="submitrequest('clearSession.do?action=X')">
	<form name="Form1" method="post" action="#">
		<br>
		<table cellSpacing="1" cellPadding="5" width="680" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center"
						background="${pageContext.request.contextPath }/images/b-info.gif">
						<font face="宋体" size="2"><strong>设备校准记录编辑</strong></font>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tbody>
								<tr>
									<td width="153" class="ta_01" align="center" bgColor="#f5fafe"
										height="22">所属单位：</td>
									<td class="ta_01" bgColor="#ffffff"><select name="jctId"
										id="jctId" class="bg" disabled>
											<option value=""></option>
											<option value="1" selected>540</option>
											<option value="2">560</option>
											<option value="3">成都台</option>
											<option value="4">厦门台</option>
											<option value="5">553台</option>
											<option value="6">201台</option>
											<option value="7">202台</option>
											<option value="8">203台</option>
											<option value="9">哈尔滨台</option>
											<option value="10">西安台</option>
											<option value="11">中心</option>
											<option value="12">北京台</option>
											<option value="13">海南台</option>
										</select>
									</td>
									<td width="100" class="ta_01" align="center" bgColor="#f5fafe"
										height="22">设备名称：</td>
									<td class="ta_01" bgColor="#ffffff"><font face="宋体"
										color="red"> <input name="devName" type="text"
											id="devName" size="19" value="UPS6666" disabled></font></td>
								</tr>
								<tr>

									<td width="153" class="ta_01" align="center" bgColor="#f5fafe"
										height="22">校准周期：</td>
									<td class="ta_01" bgColor="#ffffff" width="224"><input
										name="seqId" type="hidden" id="seqId" size="19" value="7313">
										<input name="devId" type="hidden" id="devId" size="19"
										value="e11c8381ec0f436b992ba0e44dd33cb0"> <input
										name="apunit" type="hidden" id="apunit" size="19" value="月">
										<input name="deviceobject" type="hidden" id="deviceobject"
										size="19" value="1"> <input name="TB_timeW"
										type="text" id="TB_timeW" size="19" value="1月" disabled></td>
									<td width="100" class="ta_01" align="center" bgColor="#f5fafe"
										height="22">使用日期：</td>
									<td class="ta_01" bgColor="#ffffff"><font face="宋体"
										color="red"> <input name="useDate" type="text"
											id="useDate" size="19" value="2007-05-27" disabled></font></td>
								</tr>
								<tr>
									<td width="153" class="ta_01" align="center" bgcolor="#f5fafe"
										height="22">设备类型：</td>
									<td class="ta_01" bgcolor="#ffffff" width="247"><font
										face="宋体" color="red"> <select name="devType"
											id="devType" class="bg" disabled>
												<option value="1" selected>电力设备dd</option>
												<option value="1">电力设备dd</option>
												<option value="2">天线设备</option>
												<option value="3">通讯设备</option>
												<option value="4">防雷设备</option>
												<option value="5">办公设备</option>
												<option value="6">电视机房设备</option>
												<option value="7">发电机房设备</option>
											</select>
									</font></td>
									<td width="100" class="ta_01" align="center" bgColor="#f5fafe"
										height="22">校准状态：</td>
									<td class="ta_01" bgColor="#ffffff" width="224"><select
										name="apstate" id="apstate" class="bg" disabled>
											<option value="0" selected>未校准</option>
											<option value="1">已校准</option>
									</select></td>
								</tr>
								<tr>
									<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">
										校准日期：</td>
									<td class="ta_01" bgcolor="#ffffff"><font face="宋体"
										color="red"> <input disabled name="startDate"
											type="text" size="19" id="startDate" disabled
											value="2007-06-05"></font>&nbsp;<font color="#FF0000">*</font></td>
									<td class="ta_01" align="center" bgcolor="#ffffff" height="22"></td>
									<td class="ta_01" bgcolor="#ffffff"></td>
								</tr>
								<TR>
									<TD class="ta_01" align="center" bgColor="#f5fafe">校准记录：</TD>
									<TD class="ta_01" bgColor="#ffffff" colSpan="3"><select
										name="isHaving" id="isHaving" class="bg" style="width: 50"
										onChange=shareOnChange(this)>
											<option value="0">无</option>
											<option value="1" selected>有</option>
									</select> &nbsp;&nbsp;&nbsp;&nbsp; <span id=PPassword
										style="DISPLAY: none"> <input
											style="font-size: 12px; color: black;" id="BT_Add"
											type="button" value="详细" name="BT_Add"
											onClick="openWindowWithName('ECCUpload.do?ZhengRi1=1&devId=e11c8381ec0f436b992ba0e44dd33cb0&projId=7313',800,450,'ECC');" />
									</span></TD>
								</TR>

								<TR>
									<TD class="ta_01" align="center" bgColor="#f5fafe">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</TD>
									<TD class="ta_01" bgColor="#ffffff" colSpan="3"><textarea
											name="comment" id="comment" style="WIDTH: 96%" rows="3"></textarea></TD>
								</TR>
								<tr>
									<td class="ta_01" align="center" bgColor="#f5fafe" height="22">记录描述：</td>
									<td height="22" colspan="3" bgColor="#FFFFFF" class="ta_01"><font
										face="宋体" color="red"> </font> <textarea name="record"
											id="record" style="WIDTH: 96%" rows="3"></textarea></td>
								</tr>
								<tr>
									<td class="ta_01" style="WIDTH: 100%" align="center"
										bgColor="#f5fafe" colSpan="4"><input type="button"
										name="BT_Submit" value="修改" id="BT_Submit"
										style="font-size: 12px; color: black;"
										onclick="return check();" /> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
										<INPUT style="font-size: 12px; color: black;" type="reset"
										value="关闭" ID="Reset1" NAME="Reset1" onClick="window.close();" />
										<span id="Label1"></span></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>