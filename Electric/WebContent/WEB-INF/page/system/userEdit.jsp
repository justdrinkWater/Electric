<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title><s:if test="#request.viewflag == ''">
		编辑用户
	</s:if> <s:else>
		查看明细
	</s:else>
</title>
<LINK href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/function.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/calendar.js"
	charset="gb2312"></script>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
		var password = "";  /* 修改密码之前的密码 */
	window.onload = function() {
		password = document.getElementById("logonPwd").value;
		document.getElementById("passwordconfirm").value = password;
	}

	function check_null() {

		var theForm = document.getElementById("Form1");

		if (Trim(theForm.userName.value) == "") {
			alert("用户姓名不能为空");
			theForm.userName.focus();
			return false;
		}
		if (theForm.jctID.value == "") {
			alert("请选择所属单位");
			theForm.jctId.focus();
			return false;
		}

		if (theForm.logonPwd.value != theForm.passwordconfirm.value) {
			alert("两次输入密码不一致，请重新输入");
			return;
		}
		if (checkNull(theForm.contactTel)) {
			if (!checkPhone(theForm.contactTel.value)) {
				alert("请输入正确的电话号码");
				theForm.contactTel.focus();
				return false;
			}
		}

		if (checkNull(theForm.mobile)) {
			if (!checkMobilPhone(theForm.mobile.value)) {
				alert("请输入正确的手机号码");
				theForm.mobile.focus();
				return false;
			}
		}

		if (checkNull(theForm.email)) {
			if (!checkEmail(theForm.email.value)) {
				alert("请输入正确的EMail");
				theForm.email.focus();
				return false;
			}
		}

		if (theForm.remark.value.length > 250) {
			alert("备注字符长度不能超过250");
			theForm.empRemark.focus();
			return false;
		}

		//theForm.action = "${pageContext.request.contextPath }/system/elecUserAction_save.do";
		//别人的代码。。。现在的问题是提交表单后自身关闭，但是现在是自身关闭了
		//但是没有提交表单...
		//theForm.submit();
		var password2 = document.getElementById("logonPwd").value;
		
		var md5Flag = 1;
		if(password2 != password){
			md5Flag = 0;
		}
		var roleflag = document.getElementById("roleflag").value;
		$.ajax({  
            type : "POST",  
            url : "${pageContext.request.contextPath}/system/elecUserAction_save.do?md5Flag="+md5Flag,  
            data : $("#Form1").serialize(),  
            success : function(msg) {
            	if(roleflag==null||roleflag==""){
	          		window.opener.location.reload();
    	        	window.close();
            	}
            },
            error:function(){
            	alert("编辑失败");
            }
        });
		
	}
	
</script>
</head>
<body>
	<s:form name="Form1" id="Form1">
		<br>
		<table cellSpacing="1" cellPadding="5" width="90%" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">

			<tr>
				<td class="ta_01" align="center" colSpan="4"
					background="${pageContext.request.contextPath }/images/b-info.gif">
					<font face="宋体" size="2"> <strong> <s:if
								test="%{#request.viewflag} == null">
								编辑用户
							</s:if> <s:else>
								查看明细
							</s:else>
					</strong>
				</font>
				</td>
			</tr>
				<s:hidden name="userID" id="userID" />
				<s:hidden name="roleflag" id="roleflag"/>	
			<%--<s:hidden name="md5flag" id="md5flag"/>--%>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">登&nbsp;&nbsp;录&nbsp;&nbsp;名：
					<font color="#FF0000">*</font>
				<td class="ta_01" bgColor="#ffffff"><s:textfield
						name="logonName" type="text" maxlength="25" id="logonName"
						size="20" readonly="readonly" /></td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">用户姓名：
					<font color="#FF0000">*</font>
				<td class="ta_01" bgColor="#ffffff"><s:textfield
						name="userName" type="text" maxlength="25" id="userName" size="20" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
				<td class="ta_01" bgColor="#ffffff"><s:select id="sexID"
						name="sexID" cssStyle="width: 155px" list="%{#request.sexList}"
						listKey="ddlCode" listValue="ddlName" value="sexID">
					</s:select></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">所属单位： <font
					color="#FF0000">*</font>
				</td>
				<td class="ta_01" bgColor="#ffffff"><s:select id="jctID"
						name="jctID" cssStyle="width: 155px" list="%{#request.locList}"
						listKey="ddlCode" listValue="ddlName" value="jctID">
					</s:select></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
				<td class="ta_01" bgColor="#ffffff"><s:textfield id="logonPwd"
						name="logonPwd" type="password" maxlength="25" size="22" /></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">确认密码：</td>
				<td class="ta_01" bgColor="#ffffff"><s:textfield
						id="passwordconfirm" name="passwordconfirm" type="password"
						maxlength="25" size="22" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">出生日期：</td>
				<td class="ta_01" bgColor="#ffffff"><s:textfield
						name="birthday" type="date" maxlength="50" size="20" /></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">联系地址：</td>
				<td class="ta_01" bgColor="#ffffff"><s:textfield name="address"
						type="text" maxlength="50" size="20" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">联系电话：</td>
				<td class="ta_01" bgColor="#ffffff"><s:textfield
						name="contactTel" type="text" maxlength="25" size="20" /></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
				<td class="ta_01" bgColor="#ffffff"><s:textfield name="mobile"
						type="text" maxlength="25" size="20" /></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">电子邮箱：</td>
				<td class="ta_01" bgColor="#ffffff"><s:textfield name="email"
						type="text" maxlength="50" size="20" /></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">是否在职：</td>
				<td class="ta_01" bgColor="#ffffff"><s:select id="isDuty"
						name="isDuty" cssStyle="width: 155px" list="%{#request.dutyList}"
						listKey="ddlCode" listValue="ddlName" value="isDuty">
					</s:select></td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">入职日期：</td>
				<td class="ta_01" bgColor="#ffffff"><s:textfield
						name="onDutyDate" type="date" maxlength="50" size="20" /></td>
				<td align="center" bgColor="#f5fafe" class="ta_01">离职日期：</td>
				<td class="ta_01" bgColor="#ffffff"><s:textfield
						name="offDutyDate" type="date" maxlength="50" size="20" /></td>
			</tr>
			<TR>
				<TD class="ta_01" align="center" bgColor="#f5fafe">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3"><s:textarea
						name="remark" cssStyle="WIDTH: 92%;" rows="4" cols="52" /></TD>
			</TR>
			<TR>
				<td align="center" colSpan="4" class="sep1"></td>
			</TR>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<s:if test="#request.viewflag == ''">
						<input type="button" name="BT_Submit" value="保存"
							style="font-size: 12px; color: black;" onClick="check_null()">
					</s:if> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<s:if test="#request.roleflag == '1'">
						<input style="font-size: 12px; color: black;" type="button"
						value="关闭" name="Reset1" onClick="window.close()">
					</s:if>
					</td>
			</tr>
		</table>
	</s:form>
</body>
</html>
