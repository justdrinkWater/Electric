<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>
	<s:if test="#request.viewflag == ''">
		设备校准记录编辑
	</s:if>
	<s:else>
		设备校准记录详细信息
	</s:else>
</title>
<link href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/function.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/changePageBackUp.js"></script>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>	
<script type="text/javascript">
function shareOnChange(mySelect){
	if (mySelect.selectedIndex == 0){
	    PPassword.style.display = "none"
	 }
	else{
	    PPassword.style.display = ""
	}
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
		$.ajax({  
	        type : "POST",  
	        url : "equapement/elecAdjustAction_save.do",  
	        data : $("#Form1").serialize(),  
	        success : function(msg) {
	        	alert("编辑成功!");
	        	window.opener.location.reload();
	        	window.close();
	        },
	        error:function(){
	        	alert("sorry,编辑失败!");
	        }
	    }); 
}
</script>
<SCRIPT type="text/javascript">
function submitrequest(action){
  eval("document.location='"+action+"'");
}

</script>
</head>
<body>
	<s:form name="Form1" method="post" id="Form1">
		<br>
		<table cellSpacing="1" cellPadding="5" width="680" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center"
						background="${pageContext.request.contextPath }/images/b-info.gif">
						<font face="宋体" size="2">
						<strong>
							<s:if test="#request.viewflag == ''">
								设备校准记录编辑
							</s:if>
							<s:else>
								设备校准记录详细信息
							</s:else>
						</strong></font>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tbody>
								<tr>
									<td width="153" class="ta_01" align="center" bgColor="#f5fafe"
										height="22">所属单位：</td>
									<td class="ta_01" bgColor="#ffffff">
									<s:if test="#request.jctIDs!=null">
										<s:select list="%{#request.jctIDs}" name="jctID" id="jctID" cssClass="bg" disabled="true"
													listKey="ddlCode" listValue="ddlName"
													value="jctID"
													>
										</s:select>
									</s:if>
									</td>
									<td width="100" class="ta_01" align="center" bgColor="#f5fafe"
										height="22">设备名称：</td>
									<td class="ta_01" bgColor="#ffffff"><font face="宋体"
										color="red"> 
										<s:textfield name="devName" type="text" id="devName" size="19" disabled="true" />
										</font>
									</td>
								</tr>
								<tr>
									<td width="153" class="ta_01" align="center" bgColor="#f5fafe"
										height="22">校准周期：
									</td>
									<td class="ta_01" bgColor="#ffffff" width="224">
										<s:hidden name="devID" id="devID" />
										<s:hidden name="seqID" id="seqID"/>
										<s:textfield name="adjustPeriod" type="text" id="adjustPeriod" size="19" disabled="true"/>
									</td>
									<td width="100" class="ta_01" align="center" bgColor="#f5fafe" height="22">
										使用日期：
									</td>
									<td class="ta_01" bgColor="#ffffff"><font face="宋体" color="red">
										<s:textfield name="useDate" type="text" id="useDate" size="19"  disabled="true"/>
										</font>
									</td>
								</tr>
								<tr>
									<td width="153" class="ta_01" align="center" bgcolor="#f5fafe" height="22">
										设备类型：
									</td>
									<td class="ta_01" bgcolor="#ffffff" width="247">
										<font face="宋体" color="red"> 
										<s:if test="#request.devTypes!=null">
											<s:select list="%{#request.devTypes}"
														name="devType" id="devType" cssClass="bg" disabled="true"
														listKey="ddlCode" listValue="ddlName"
														value="devType">
											</s:select>
										</s:if>
										</font>
									</td>
									<td width="100" class="ta_01" align="center" bgColor="#f5fafe" height="22">
										校准状态：
									</td>
									<td class="ta_01" bgColor="#ffffff" width="224">
									<s:if test="#request.idAdjusts!=null">
										<s:select list="%{#request.idAdjusts}" name="isAdjust" id="isAdjust" cssClass="bg" disabled="true"
													headerKey="0" headerValue=""
													listKey="ddlCode" listValue="ddlName"
													>
										</s:select>
									</s:if>
									</td>
								</tr>
								<tr>
									<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">
										校准日期：
									</td>
									<td class="ta_01" bgcolor="#ffffff">
										<font face="宋体" color="red">
										<s:textfield  name="adjustDate" type="text" size="19" id="adjustDate" disabled="true"/>
										</font>&nbsp;<font color="#FF0000">*</font>
									</td>
									<td class="ta_01" align="center" bgcolor="#ffffff" height="22"></td>
									<td class="ta_01" bgcolor="#ffffff"></td>
								</tr>
								<tr>
									<td class="ta_01" align="center" bgColor="#f5fafe">校准记录：</TD>
									<td class="ta_01" bgColor="#ffffff" colSpan="3">
										<s:if test="#request.isOrNot!=null">
											<s:select list="%{#request.isOrNot}" name="isHaveRecord" id="isHaveRecord" class="bg" cssStyle="width: 50"
													onChange="shareOnChange(this)"
													listKey="ddlCode" listValue="ddlName"
													>
											</s:select>
										</s:if>
										 &nbsp;&nbsp;&nbsp;&nbsp; 
										 <span id=PPassword  style="DISPLAY: none"> 
										 <input	style="font-size: 12px; color: black;" id="BT_Add" type="button" value="详细" name="BT_Add"
											onClick="openWindow('elecAdjustAction_upload.do?devID=<s:property value="#adjust.devID"/>',800,450);" />
										</span>
									</td>
								</tr>
								<tr>
									<td class="ta_01" align="center" bgColor="#f5fafe">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
									<td class="ta_01" bgColor="#ffffff" colSpan="3">
										<s:textarea name="comment" id="comment" cssStyle="WIDTH: 96%" rows="3"/>
									</td>
								</tr>
								<tr>
									<td class="ta_01" align="center" bgColor="#f5fafe" height="22">
										记录描述：
									</td>
									<td height="22" colspan="3" bgColor="#FFFFFF" class="ta_01">
										<font face="宋体" color="red"> </font>
										<s:textarea name="record" id="record" cssStyle="WIDTH: 96%" rows="3"/> 
									</td>
								</tr>
								<tr>
									<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
											<s:if test="#request.viewflag == ''">
												<input type="button" name="BT_Submit" value="修改" id="BT_Submit" style="font-size: 12px; color: black;" onclick="return check();" /> 
											</s:if>
										<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
										<INPUT style="font-size: 12px; color: black;" type="reset" value="关闭" ID="Reset1" NAME="Reset1" onClick="window.close();" />
										<span id="Label1"></span>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</TBODY>
		</table>
	</s:form>
</body>
</HTML>