<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<script type='text/javascript'
	src="${pageContext.request.contextPath }/script/calendar.js"></script>
<LINK href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet">
<script type='text/javascript'
	src="${pageContext.request.contextPath }/script/validate.js"></script>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
/* 	function ini() {
		document.all.devType.focus();
	} */
	function check() {
		var theForm = document.forms[0];
		if (theForm.devType.value == "0") {
			alert("请选择设备类型");
			theForm.devType.focus();
			return false;
		}
		if (Trim(theForm.devName.value) == "") {
			alert("请输入设备名称");
			theForm.devName.focus();
			return false;
		}
		if (theForm.devState.value == "0") {
			alert("请选择设备状态");
			theForm.devState.focus();
			return false;
		}
		if (Trim(theForm.quality.value) == "") {
			alert("请输入数量");
			theForm.quality.focus();
			return false;
		}
		if (theForm.jctID.value == "0") {
			alert("请输入所属单位");
			theForm.jctID.focus();
			return false;
		}
		if (theForm.runDescribe.value.length > 250) {
			alert("运行情况描述不能超过250个汉字！");
			theForm.runDescribe.focus();
			return false;
		}
		if (theForm.comment.value.length > 250) {
			alert("备注不能超过250个汉字！");
			theForm.comment.focus();
			return false;
		}
 	 	if (Trim(theForm.overhaulPeriod.value) != ""
				&& theForm.opUnit.value == "0") {
			alert("请选择检修周期！");
			theForm.opUnit.focus();
			return false;
		}
		if (Trim(theForm.adjustPeriod.value) != ""
				&& theForm.apUnit.value == "0") {
			alert("请选择校准周期！");
			theForm.apUnit.focus();
			return false;
		} 
		
		$.ajax({  
	        type : "POST",  
	        url : "equapement/elecDeviceAction_save.do",  
	        data : $("#Form1").serialize(),  
	        success : function(msg) {  
	        	window.opener.location.reload();
	        	window.close();
	        },
	        error:function(){
	        	alert("编辑失败");
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
</script>
<title>
	<s:if test="#request.viewflag == ''">
			仪器设备信息编辑
	</s:if>
	<s:else>
			仪器设备详细信息
	</s:else>
</title>
</head>

<body>
	<s:form name="Form1" method="post" id="Form1">
		<input type="hidden" name="goaddto" id="goaddto" value="1">
		&nbsp;
		<table cellSpacing="1" cellPadding="5" width="680" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" colSpan="4" align="center"
					background="${pageContext.request.contextPath }/images/b-info.gif">
					<font face="宋体" size="2">
					<strong>
							<s:if test="#request.viewflag == ''">
									仪器设备信息编辑
							</s:if>
							<s:else>
									仪器设备详细信息
							</s:else>
					</strong></font>
				</td>
			</tr>
				<s:hidden name="devID" id="devID"/>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">设备名称：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="devName" type="text" maxlength="25" id="devName" size="19"/>
					&nbsp;<font color="#FF0000">*</font>
				</td>
				<td class="ta_01" align="center" bgColor="#f5fafe">所属单位：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:if test="#request.jctIDs != null">
						<s:select list="%{#request.jctIDs}" cssClass="bg" name="jctID" id="jctID" cssStyle="width: 148px"
									headerKey="0" headerValue=""
									listKey="ddlCode" listValue="ddlName">
						</s:select>
					</s:if>
					&nbsp;<font color="#FF0000">*</font>
				</td>
			</tr>
			<tr>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">设备类型：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:if test="#request.devTypes != null">
						<s:select list="%{#request.devTypes}" id="devType" name="devType" cssClass="bg"
								headerKey="0" headerValue=""
								listKey="ddlCode" listValue="ddlName">
						</s:select>
					</s:if>
						&nbsp;<font color="#FF0000">*</font>
				</td>
				<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
					数&nbsp;&nbsp;量：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="quality" type="text" maxlength="70" id="quality" size="19" onblur='checkNumber(this)' cssStyle="text-align: left;width:40"/>
				 	<s:textfield name="qunit" type="text" maxlength="5" id="qunit" cssStyle="width: 105"/>
						&nbsp;<font color="#FF0000">*</font>
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					金&nbsp;&nbsp;额：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="devExpense" type="text" maxlength="17" id="devExpense" size="19" onblur='checkDecimal(this)'/>
					&nbsp;元&nbsp;
				</td>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					配&nbsp;&nbsp;置：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="configure" type="text" maxlength="50" id="configure" size="19"/>
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">规格型号：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="specType" type="text" maxlength="25" id="specType" size="19"/>
				</td>
				<td class="ta_01" align="center" bgColor="#f5fafe" height="30">
					品&nbsp;&nbsp;牌：
				</td>
				<td class="ta_01" bgColor="#ffffff" height="30">
					<s:textfield name="trademark" type="text" maxlength="25" id="trademark" size="19"/>
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">设备状态：</td>
				<td class="ta_01" bgcolor="#ffffff" align="left">
					<s:if test="#request.devStates != null">
						<s:select list="%{#request.devStates}" name="devState" id="devState" cssClass="bg"
								headerKey="0" headerValue=""
								listKey="ddlCode" listValue="ddlName" value="devState">
						</s:select>
					</s:if>
				</td>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					厂&nbsp;&nbsp;家：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="produceHome" type="text"  id="produceHome" />
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					产&nbsp;&nbsp;地：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="produceArea" type="text"  id="produceArea" />
				</td>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					用&nbsp;&nbsp;途：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="useness" type="text"  id="useness" />
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">使用单位：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="useUnit" type="text" maxlength="25" id="useUnit" size="19" />
					<font face="宋体" color="red"> </font>
				</td>
				<td class="ta_01" align="center" bgColor="#f5fafe">检修周期：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="overhaulPeriod" type="text" maxlength="25" id="overhaulPeriod" size="3" onblur='checkNumber(this)'/>
					<s:if test="#request.opUnits != null">
						<s:select list="%{#request.opUnits}" name="opUnit" id="opUnit"
									headerKey="" headerValue=""
									listKey="ddlCode" listValue="ddlName" value="opUnit">
						</s:select>
					</s:if>
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe" height="30">使用日期：</td>
				<td class="ta_01" bgColor="#ffffff" height="30">
					<s:textfield name="useDate" type="date" id="useDate"  />
				</td>
				<td class="ta_01" align="center" bgColor="#f5fafe">校准周期：</td>
				<td class="ta_01" bgColor="#ffffff">
					<s:textfield name="adjustPeriod" type="text" maxlength="25" id="adjustPeriod" size="3" onblur='checkNumber(this)'/>
					 <s:if test="#request.apUnits != null">
						<s:select list="%{#request.apUnits}" name="apUnit" id="apUnit"
									headerKey="" headerValue=""
									listKey="ddlCode" listValue="ddlName" value="apUnit">
						</s:select>
					</s:if>
					 &nbsp;
				</td>
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">运行情况描述：</td>
				<td class="ta_01" bgColor="#ffffff" colSpan="3">
					<s:textarea name="runDescribe" id="runDescribe" cssStyle="WIDTH: 96%" rows="3"/>
				</td>
					
			</tr>
			<tr>
				<td class="ta_01" align="center" bgColor="#f5fafe">
					备&nbsp;&nbsp;注：</td>
				<td class="ta_01" bgColor="#ffffff" colSpan="3">
					<s:textarea name="comment" id="comment" cssStyle="WIDTH: 96%" rows="3"/>
				</td>
			</tr>
			<tr>
				<td class="ta_01" style="width: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<s:if test="#request.viewflag == ''">
						<input type="button" name="BT_Submit" value="保存" id="BT_Submit" style="font-size: 12px; color: black;" onclick="check()">
					</s:if>
					<font face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font> 
					<input style="font-size: 12px; color: black;" type="reset" value="关闭" ID="Reset1" NAME="Reset1" onClick="window.close();"> 
					<span id="Label1"></span>
				</td>
			</tr>
		</table>
	  <br>
	</s:form>
</body>
</html>