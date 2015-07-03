<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<LINK href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet">
<title>站点信息添加</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/function.js"></script>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<Script type="text/javascript">
	function check_null() {
		var theForm = document.Form1;
		if (theForm.jctID.value == "0") {
			alert("请选择所属单位");
			theForm.jctId.focus();
			return false;
		}
		if (theForm.stationType.value == "0") {
			alert("请选择站点类别");
			theForm.stationType.focus();
			return false;
		}
		if (Trim(theForm.stationName.value) == "") {
			alert("站点名称不能为空");
			theForm.stationName.focus();
			return false;
		}
		if (Trim(theForm.stationCode.value) == "") {
			alert("站点代号不能为空");
			theForm.stationCode.focus();
			return false;
		}
		if (theForm.comment.value.length > 250) {
			alert("备注字符长度不能超过250个汉字!");
			theForm.comment.focus();
			return false;
		}
		$.ajax({  
	        type : "POST",  
	        url : "equapement/elecStationAction_save.do",  
	        data : $("#Form1").serialize(),  
	        success : function(msg) {
	        	alert("添加成功!");
	        	window.opener.location.reload();
	        	window.close();
	        },
	        error:function(){
	        	alert("sorry,添加失败!");
	        }
	    }); 
	}
</script>
</head>

<body>
	<s:form name="Form1" method="post" id="Form1">
		<br>
		<table cellSpacing="1" cellPadding="5" width="580" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" colSpan="4"
					background="${pageContext.request.contextPath }/images/b-info.gif">
					<font face="宋体" size="2"><strong>站点信息添加</strong></font>
				</td>
			</tr>
			<tr>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">所属单位：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff">
					<s:if test="#request.jctIDs != null">
						<s:select list="%{#request.jctIDs}" cssClass="bg" name="jctID" id="jctID"
									cssStyle="width: 155px"
									headerKey="0" headerValue="全部"
									listKey="ddlCode" listValue="ddlName">
						</s:select>
					</s:if>
					<font color="#FF0000">*</font>
				</td>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">站点名称：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff"><input
					name="stationName" type="text" id="stationName" size="20"
					maxlength="25"> <font color="#FF0000">*</font></td>
			</tr>
			<tr>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">站点代号：</td>
				<td width="35%" width="35%" class="ta_01" bgColor="#ffffff"><input
					name="stationCode" type="text" id="Text2" size="20" maxlength="25">
					<font color="#FF0000">*</font></td>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">使用时间：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff" height="30">
					<input	name="useStartDate" type="date" size="20"></td>
			</tr>
			<tr>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">安装地点：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff">
					<input name="jcFrequency" type="text" id="jcFrequency" size="20">
				</td>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">生产厂家：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff"><input
					name="produceHome" type="text" id="produceHome" size="20"
					maxlength="25"></td>
			</tr>
			<tr>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">通讯方式：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff"><input
					name="contactType" type="text" id="contactType" size="20"
					maxlength="25"></td>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">站点类别：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff" height="30">
					<s:if test="#request.stationTypes != null">
						<s:select list="%{#request.stationTypes}" cssClass="bg" name="stationType" id="stationType" cssStyle="width: 160px"
									headerKey="0" headerValue="全部"
									listKey="ddlCode" listValue="ddlName">
						</s:select>
					</s:if>
					<font color="#FF0000">*</font>
				</td>
			</tr>
			<tr>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">归属地：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff"><input
					name="attributionGround" type="text" id="attributionGround"
					size="20" maxlength="25"></td>
				<td width="15%" height="22" align="center" bgColor="#ffffff"
					class="ta_01"></td>
				<td width="35%" class="ta_01" bgColor="#ffffff" height="30"></td>
			</tr>

			<tr>
				<td width="15%" class="ta_01" align="center" bgcolor="#f5fafe">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					注：</td>
				<td width="85%" class="ta_01" bgcolor="#ffffff" colspan="3"><textarea
						name="comment" id="comment" style="WIDTH: 96%" rows="4"></textarea></td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<input type="button" name="BT_Submit" value="保存" id="BT_Submit"
						style="font-size: 12px; color: black;" onclick="check_null()">
						<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> 
					<INPUT style="font-size: 12px; color: black;" type="reset" value="关闭"
						NAME="Reset1" onclick="window.close();">
				</td>
			</tr>
		</table>
	</s:form>
</body>
</HTML>
