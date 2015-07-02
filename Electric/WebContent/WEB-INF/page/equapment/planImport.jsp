<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>导入设备购置计划</title>
<link href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/function.js"></script>
<SCRIPT type="text/javascript">
	function checkFile() {
		var fileInputContext = document.Form1.file.value;
		var fileExtension = fileInputContext.substring(fileInputContext
				.lastIndexOf(".") + 1, fileInputContext.length);//获取上传文件的后缀名
		document.Form1.fileExtension.value = fileExtension;
	    document.Form1.action="equapment/elecDevicePlanAction_importExcel.do";
	    document.Form1.submit();
	    alert("上传成功！！");
	}
</SCRIPT>
</head>
<body>
	<s:form action="equapment/elecDevicePlanAction_importExcel.do" method="post"
		enctype="multipart/form-data" id="Form1" name="Form1">
		<br>
		<table border="0" width="100%" cellspacing="0" cellpadding="0">
			<tr>
				<td class="ta_01" align="center"
					background="${pageContext.request.contextPath }/images/b-info.gif"
					colspan="4"><font face="宋体" size="2"><strong>Excel文件数据导入</strong></font>
				</td>
			</tr>
			<tr>
				<td width="1%" height=30></td>
				<td width="20%"></td>
				<td width="78%"></td>
				<td width="1%"></td>
			</tr>
			<tr>
				<td width="1%"></td>
				<td width="15%" align="center">请选择文件:</td>
				<td width="83%" align="left"><s:file name="file" id="file"
						cssStyle="width:365px"></s:file></td>
				<td width="1%"></td>
			</tr>
			<tr height=50>
				<td colspan=4></td>
			</tr>
			<tr height=2>
				<td colspan=4
					background="${pageContext.request.contextPath }/images/b-info.gif"></td>
			</tr>
			<tr height=10>
				<td colspan=4></td>
			</tr>
			<tr>
				<td align="center" colspan=4>
				<input type="hidden" id="fileExtension" name="fileExtension" value="">
				<input type="button"
					style="width: 60px; font-size: 12px; color: black;" name="import"
					value="导入" onclick="checkFile()"> <INPUT type="button"
					name="Reset1" id="save" value="关闭"
					onClick="window.opener.reflash(); window.close();"
					style="width: 60px; font-size: 12px; color: black;"></td>
			</tr>
		</table>
	</s:form>
</body>
</html>
