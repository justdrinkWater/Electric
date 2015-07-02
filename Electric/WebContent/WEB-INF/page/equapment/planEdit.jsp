<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<LINK href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet">
<script type='text/javascript'
	src="${pageContext.request.contextPath }/script/validate.js"></script>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>	
<SCRIPT type="text/javascript">
	function ini() {
		document.all.devType.focus();
	}
	function check() {
		var theForm = document.forms[0];
		if (!checkNull(theForm.devType)) {
			alert("请选择设备类型");
			theForm.devType.focus();
			return false;
		}
		if (Trim(theForm.devType.value) == "") {

			alert("请选择设备类型");
			theForm.devType.focus();
			return false;
		}
		if (Trim(theForm.devName.value) == "") {

			alert("请输入设备名称");
			theForm.devName.focus();
			return false;
		}
		if (Trim(theForm.quality.value) == "") {

			alert("请输入数量");
			theForm.quality.focus();
			return false;
		}
		if (Trim(theForm.qunit.value) == "") {

			alert("请输入数量单位");
			theForm.qunit.focus();
			return false;
		}
		if (Trim(theForm.jctID.value) == "") {

			alert("请输入所属单位");
			theForm.jctId.focus();
			return false;
		}

		if (Trim(theForm.planDate.value) == "") {

			alert("请输入计划时间");
			theForm.planDate.focus();
			return false;
		}

		if (theForm.configure.value.length > 25) {
			alert("配置的长度不能超过25个汉字！");
			theForm.configure.focus();
			return false;
		}
		
		$.ajax({  
	        type : "POST",  
	        url : "equapement/elecDevicePlanAction_save.do",  
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

	function checkNumber(item) {
		if (item.value != "") {
			isNumber1(item);
		}
	}

	function isNumber1(obj) {

		if (obj == null) {
			alert("对象为空!");
			return false;
		}

		var v = obj.value;

		var pattern = /^[0-9]*[1-9][0-9]*$/;
		flag = pattern.test(v);
		if (!flag) {
			alert("请输正整数!");

			obj.select();
			obj.focus();
			return false;
		} else {
			return true;
		}
	}

	function checkDecimal(item) {
		if (item.value != "0" && item.value != "") {
			isDecimal(item);
		}
	}

	function isDecimal(obj) {
		if (obj == null)
			alert("对象为空");

		var v = obj.value;

		var pattern = /^[0-9]+\.\d{1,2}$/;
		flag = pattern.test(v);

		if (!flag) {
			alert("输入格式为: 0.00");
			obj.select();
			obj.focus();
			return false;
		} else {
			return true;
		}
	}
</SCRIPT>
<title>
	<s:if test="#request.viewflag == ''">
		购置计划信息编辑
	</s:if>
	<s:else>
		购置计划详细信息
	</s:else>
</title>
</head>

<body>
	<s:form name="Form1" method="post" id="Form1">
		<s:hidden name="devPlanID" id="devPlanID"/>
		
		<br>
		<table cellSpacing="1" cellPadding="5" width="700" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">

			<tr>
				<td class="ta_01" colSpan="4" align="center"
					background="${pageContext.request.contextPath }/images/b-info.gif">
					<font face="宋体" size="2">
					<strong>
						<s:if test="#request.viewflag == ''">
							购置计划信息编辑
						</s:if>
						<s:else>
							购置计划详细信息
						</s:else>
					</strong></font>
				</td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					设备类型：</td>
				<td class="ta_01" bgColor="#ffffff" width="32%">
					<s:if test="#request.devTypes != null">
							<s:select list="%{#request.devTypes}" id="devType" name="devType" cssClass="bg"
									listKey="ddlCode" listValue="ddlName"
									value="devType">
							</s:select>
						</s:if>
						&nbsp;<font color="#FF0000">*</font>
				</td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					设备名称：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="devName" type="text" maxlength="50" id="devName" size="19"/>
					&nbsp;<font color="#FF0000">*</font>
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="trademark" type="text" maxlength="25" id="trademark" size="19"/>
				&nbsp;
				</td>
				<td class="ta_01" align="center" bgColor="#f5fafe">规格型号：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="specType" type="text" maxlength="25" id="specType" size="19"/>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					厂&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="produceHome" type="text" maxlength="25" id="produceHome" size="19"/>
				</td>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="quality" type="text" maxlength="10" cssStyle="text-align: left" id="quality"
						onblur='checkNumber(this)'/>
					<s:textfield name="qunit" type="text" maxlength="5" id="qunit" cssStyle="width: 105"/>
				 	&nbsp;<font color="#FF0000">*</font>
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;途：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="useness" type="text" maxlength="25" id="useness" size="19"/>
				</td>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					产&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="produceArea" type="text" maxlength="25" id="produceArea" size="19"/>
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					金&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="devExpense" type="text" maxlength="17" id="devExpense" size="19" onblur='checkDecimal(this)'/>
					 元
				</td>
				<td class="ta_01" align="center" bgColor="#f5fafe">使用单位：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="useUnit" type="text" maxlength="25" id="useUnit" size="19"/>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">所属单位：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:if test="#request.jctIDs != null">
						<s:select list="%{#request.jctIDs}" cssClass="bg" name="jctID" id="jctID" cssStyle="width: 148px"
									listKey="ddlCode" listValue="ddlName"
									value="jctID">
						</s:select>
					</s:if>
					&nbsp;<font color="#FF0000">*</font>
				</td>
				<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">计划时间：
				</td>
				<td class="ta_01" bgcolor="#ffffff" width="277">
					<s:textfield name="planDate" type="date" size="19" id="planDate"/>
					&nbsp;<font	color="#FF0000">*</font>
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">校准周期：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="adjustPeriod" type="text" maxlength="4" id="adjustPeriod" size="12" onblur='checkNumber(this)'/>
					<s:if test="#request.apUnits != null">
						<s:select list="%{#request.apUnits}" name="apUnit" id="apUnit"
									listKey="ddlCode" listValue="ddlName" value="apUnit">
						</s:select>
					</s:if>
					&nbsp;
				</td>
				<td class="ta_01" align="center" bgColor="#f5fafe">检修周期：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="overhaulPeriod" type="text" maxlength="4" id="overhaulPeriod" size="12"  onblur='checkNumber(this)'/>
					<s:if test="#request.opUnits != null">
						<s:select list="%{#request.opUnits}" name="opUnit" id="opUnit"
									listKey="ddlCode" listValue="ddlName" value="opUnit">
						</s:select>
					</s:if>&nbsp;
				</td>
			</tr>
			<tr>
				<TD class="ta_01" align="center" bgColor="#f5fafe">
					配&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置：</TD>
				<TD class="ta_01" bgColor="#ffffff" colSpan="3">
					<s:textarea name="configure" id="configure" cssStyle="WIDTH: 88%" rows="3" />
				</TD>
			</tr>
			<tr>
				<td class="ta_01" style="width: 100%" align="center"
					bgColor="#f5fafe" colSpan="4">
					<s:if test="#request.viewflag == ''">
						<input type="button" name="BT_Submit" value="保存" id="BT_Submit"
							style="font-size: 12px; color: black;" onclick="return check();">
					</s:if>
					<font face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font> 
					<input style="font-size: 12px; color: black;" type="reset" value="关闭"
					ID="Reset1" NAME="Reset1" onClick="window.close();"> <span
					id="Label1"></span></td>
			</tr>
		</table>
		<br>
	</s:form>
</body>
</html>
