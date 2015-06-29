<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet" />
<script language="javascript"
	src="${pageContext.request.contextPath }/script/function.js"></script>
<script language="javascript"
	src="${pageContext.request.contextPath }/script/changePageBackUp.js"></script>
<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
td, select {
	font-size: 12px;
}
-->
</style>
<script>
<!--
	function CheckOthers(form) {
		for (var i = 0; i < form.elements.length; i++) {
			var e = form.elements[i];
			//		if (e.name != 'chkall')
			if (e.checked == false) {
				e.checked = true;// form.chkall.checked;
			} else {
				e.checked = false;
			}
			e.checked = false;
		}
	}

	function CheckAll(form) {
		for (var i = 0; i < form.elements.length; i++) {
			var e = form.elements[i];
			//		if (e.name != 'chkall')
			e.checked = true// form.chkall.checked;
		}
	}
//-->
</script>
</head>
<body>
	<form name="Form1" method="post">
		<table width="100%" border="0" cellpadding="0" cellspacing="1"
			bordercolor="#f5fafe" bgcolor="#AFD1F3" id="table8">
			<tr>
				<td width="47" align="center" bgColor="#F5FAFE" class="ta_01">选择</td>
				<td width="147" bgColor="#F5FAFE" class="ta_01">设备名称</td>
				<td width="50" bgColor="#F5FAFE" class="ta_01">所属单位</td>
			</tr>
			<s:if test="#request.deviceList!=null">
				<s:iterator value="%{#request.deviceList}" var="device">
				<tr>
					<td width="47" align="center" bgColor="#F5FAFE" class="ta_01">
						<span style="CURSOR: hand; HEIGHT: 22px">
							<input type="checkbox" name="devID" id="devID" value="<s:property value="#device.devID"/>">
						</span>
					</td>
					<td class="ta_01" bgColor="#F5FAFE">
						<s:property value="#device.devName"/>
					</td>
					<td class="ta_01" bgColor="#F5FAFE">
						<s:property value="#device.jctID"/>
					</td>
				</tr>
				</s:iterator>
			</s:if>
		</table>
	</form>
</body>
</html>
