<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<LINK href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet">
<title>
	<s:if test="#request.viewflag == ''">
		站点信息编辑
	</s:if>
	<s:else>
		站点信息查看
	</s:else>
</title>
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
			alert("备注字符长度不能超过250");
			theForm.comment.focus();
			return false;
		}
		$.ajax({  
	        type : "POST",  
	        url : "equapement/elecStationAction_save.do",  
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
</head>
<body>
	<s:form name="Form1" method="post" id="Form1">
		<br>
		<table cellSpacing="1" cellPadding="5" width="580" align="center"
			bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" align="center" colSpan="4"
					background="${pageContext.request.contextPath }/images/b-info.gif">
					<font face="宋体" size="2"><strong>
						<s:if test="#request.viewflag == ''">
							站点信息编辑
						</s:if>
						<s:else>
							站点信息查看
						</s:else>
					</strong></font>
				</td>
			</tr>
			<tr>
				<s:hidden name="stationID" id="stationID"/>
				
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">所属单位：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff">
					<s:if test="#request.jctIDs != null">
						<s:select list="%{#request.jctIDs}" cssClass="bg" name="jctID" id="jctID"
									listKey="ddlCode" listValue="ddlName"
									value="jctID">
						</s:select>
					</s:if>
					<font color="#FF0000">*</font>
				</td>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">站点名称：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff">
					<s:textfield name="stationName" type="text" id="stationName" size="20" maxlength="25"/>
					<font color="#FF0000">*</font>
				</td>
			</tr>
			<tr>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">站点代号：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff">
					<s:textfield name="stationCode" type="text" id="Text2" size="20" maxlength="25"/>
					<font color="#FF0000">*</font>
				</td>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">使用时间：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff" height="30">
					<s:textfield id="useStartDate" name="useStartDate" type="text" size="20" />
				</td>
			</tr>
			<tr>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">安装地点：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff">
					<s:textfield name="jcFrequency" type="text" id="jcFrequency" size="20" maxlength="50"/>
				</td>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">生产厂家：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff">
					<s:textfield name="produceHome" type="text" id="produceHome" size="20" maxlength="25"/>
				</td>
			</tr>
			<tr>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">通讯方式：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff">
					<s:textfield name="contactType" type="text" id="contactType" size="20" maxlength="25"/>
				</td>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">站点类别：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff" height="30">
					<s:if test="#request.stationTypes != null">
						<s:select list="%{#request.stationTypes}" cssClass="bg" name="stationType" id="stationType" cssStyle="width: 160px"
									listKey="ddlCode" listValue="ddlName"
									value="stationType">
						</s:select>
					</s:if>
					<font color="#FF0000">*</font>
				</td>
			</tr>
			<tr>
				<td width="15%" height="22" align="center" bgColor="#f5fafe"
					class="ta_01">归属地：</td>
				<td width="35%" class="ta_01" bgColor="#ffffff">
					<s:textfield name="contactType" type="text" id="contactType" size="20" maxlength="25"/>
				</td>
				<td width="15%" height="22" align="center" bgColor="#ffffff"
					class="ta_01"></td>
				<td width="35%" class="ta_01" bgColor="#ffffff" height="30"></td>
			</tr>
			<tr>
				<td width="15%" class="ta_01" align="center" bgcolor="#f5fafe">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
				<td width="85%" class="ta_01" bgcolor="#ffffff" colspan="3">
					<s:textarea name="comment" id="comment"  cssStyle="word-break: break-all;width: 90%" rows="4"/>
				</td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<s:if test="#request.viewflag == ''">
						<input type="button" name="BT_Submit" value="保存" id="BT_Submit"
						style="font-size: 12px; color: black;" onclick="check_null()">
					</s:if>
					<FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>
					<INPUT style="font-size: 12px; color: black;" type="reset" value="关闭"
						NAME="Reset1" onclick="window.close();"></td>
			</tr>
		</table>
	</s:form>
</body>
</HTML>
