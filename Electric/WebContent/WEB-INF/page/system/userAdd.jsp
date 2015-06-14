<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>添加用户</title>
<LINK href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/function.js" ></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/calendar.js"
	charset="gb2312"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/validate.js"></script>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
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
	$.ajax({  
        type : "POST",  
        url : "${pageContext.request.contextPath}/system/elecUserAction_save.do?md5Flag=0",  
        data : $("#Form1").serialize(),  
        success : function(msg) {  
        	window.opener.location.reload();
        	window.close();
        },
        error:function(){
        	alert("添加失败");
        }
    });
	
}
	//使用ajax进行异步校验，校验登录名在数据库是否存在
	//创建ajax引擎
	function createXmlHttpRequest(){
	   var xmlHttp;
	   try{    //Firefox, Opera 8.0+, Safari
	           xmlHttp=new XMLHttpRequest();
	    }catch (e){
	           try{    //Internet Explorer
	                  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
	            }catch (e){
	                  try{
	                          xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	                  }catch (e){}  
	           }
	    }
	   return xmlHttp;
	 }
	 function checkLogonName(){
	 	var logonName = document.getElementById("logonName").value;
	 	//第一步：创建ajax引擎
	 	var xmlHttp = createXmlHttpRequest();
	 	//第二步：事件处理函数，实质上相当一个监听，监听服务器与客户端的连接状态
	 	xmlHttp.onreadystatechange = function(){
	 		if(xmlHttp.readyState==4){
	 			if(xmlHttp.status==200){
	 				var data = xmlHttp.responseText;
	 				//alert(data);
	 				if(data==1){
	 					alert("当前输入的登录名["+logonName+"]已被其他人占用，请重新输入！");
	 					document.getElementById("logonName").value = "";
	 					document.getElementById("logonName").focus();
	 				}
	 			}
	 		}
	 	}
	 	//第三步：与后台服务器建立一个连接
	 	xmlHttp.open("post","http://localhost/Electric/checkLogonName",true);
	 	xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	 	//第四步：发送请求的参数
	 	xmlHttp.send("logonName="+logonName);
	 }
</script>
</head>
<body>
	<s:form name="Form1" id="Form1" >
		<br>
		<table cellSpacing="1" cellPadding="5" width="580" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">

			<tr>
				<td class="ta_01" align="center" colSpan="4"
					background="${pageContext.request.contextPath }/images/b-info.gif">
					<font face="宋体" size="2"><strong>添加用户</strong></font>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">登&nbsp;&nbsp;录&nbsp;&nbsp;名：<font
					color="#FF0000">*</font></td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield  name="logonName" type="text" maxlength="25" id="logonName" size="20" onblur="checkLogonName()"/>
				</td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">用户姓名：<font
					color="#FF0000">*</font>
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="userName" type="text" maxlength="25" id="userName" size="20"/>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:if test="#request.sexList!=null">
						<s:select list="%{#request.sexList}" id="sexID" name="sexID" cssStyle="width: 155px"
								  headerKey="" headerValue=""	
								  listKey="ddlCode" listValue="ddlName"
									>
						</s:select>
					</s:if>
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">所属单位：<font
					color="#FF0000">*</font></td>
				<td class="ta_01" bgColor="#ffffff">
					<s:if test="#request.locList != null">
						<s:select list="%{#request.locList}" id="jctID" name="jctID" cssStyle="width: 155px"
									headerKey="" headerValue=""
									listKey="ddlCode" listValue="ddlName"
									>
						</s:select>
					</s:if>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:password name="logonPwd" type="password" maxlength="25" size="22" showPassword="true"/>
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">确认密码：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:password name="passwordconfirm" type="password" maxlength="25" size="22" showPassword="true"/>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">出生日期：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="birthday" type="date" maxlength="50" size="20"/>
					<!-- <input name="birthday" type="date" maxlength="50" size="20"> -->
					
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">联系地址：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="address" type="text" maxlength="50" size="20"/>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">联系电话：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="contactTel" type="text" maxlength="25" size="20" />
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="mobile"	type="text" maxlength="25" size="20"/>
				</td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">电子邮箱：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="email" type="text" maxlength="50" size="20"/>
				</td>
				<td align="center" bgColor="#f5fafe" class="ta_01">是否在职：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:if test="#request.dutyList">
						<s:select list="%{#request.dutyList}" name="isDuty" cssStyle="width: 155px"
									listKey="ddlCode" listValue="ddlName"
									value="1"
									>
						</s:select>
					</s:if>
				</td>
			</tr>

			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">入职日期：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="onDutyDate"
					type="date" maxlength="50" size="20"/>
				</td>
				<td align="center" bgColor="#ffffff" class="ta_01"></td>
				<td class="ta_01" bgColor="#ffffff"></td>
			</tr>

			<TR>
				<TD class="ta_01" align="center" bgColor="#f5fafe">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3">
					<s:textarea name="remark" cssStyle="WIDTH: 95%" rows="4" cols="52"/>
				</TD>
			</TR>
			<TR>
				<td align="center" colSpan="4" class="sep1"></td>
			</TR>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<input type="button" name="BT_Submit" value="保存" style="font-size: 12px; color: black;" onClick="check_null()"> <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<input style="font-size: 12px; color: black;" type="button" value="关闭" name="Reset1" onClick="window.close()">
				</td>
			</tr>
		</table>
	</s:form>

</body>
</html>
