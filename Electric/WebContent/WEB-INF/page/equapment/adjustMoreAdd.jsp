<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
<title>设备校准批量添加</title>
<link href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/function.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/changePageBackUp.js"></script>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
function shareOnChange(mySelect)
{
if (mySelect.selectedIndex == 0)
    {
    PPassword.style.display = "";
    }
else
    PPassword.style.display = "none";
}
</script>
<script type="text/javascript">
function CheckOthers(form)
{
	for (var i=0;i<dtype.Form1.elements.length;i++)
	{
		var e = dtype.Form1.elements[i];
			if (e.checked==false)
			{
				e.checked = true;
			}
			else
			{
				e.checked = false;
			}
			e.checked = false;
	}
}
function CheckAll(form)
{
	for (var i=0;i<dtype.Form1.elements.length;i++)
	{
		var e = dtype.Form1.elements[i];
			e.checked = true;
	}
}
</script>
<script type="text/javascript">
	function check(){
         var theForm = document.Form1;
          if(Trim(theForm.startDate.value)==""){
	    	alert("请输入校准日期");
			theForm.startDate.focus();
			return false;
	    }
	     var id="";
		 for (var i=0;i<dtype.Form1.elements.length;i++){
			var e = dtype.Form1.elements[i];
			if (dtype.Form1.elements[i].checked==true){
				id=id+dtype.Form1.elements[i].value+",";
			}
		}
		alert(id);
	    document.Form1.devID.value=id; 
	    if (theForm.record.value.length >250){
		    alert("记录描述不能超过250个汉字！");
		    theForm.record.focus();
		    return false;
		}
		if (theForm.comment.value.length >250){
		    alert("备注不能超过250个汉字！");
		    theForm.comment.focus();
		    return false;
		}
	    if(id!=""){
			$.ajax({  
		        type : "POST",  
		        url : "equapement/elecAdjustAction_save.do",  
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
	}
	  function getdevTypeChange(dt){
	      document.all.dtype.src="elecAdjustAction_util.do?findflag=1&devType="+dt.value;
	  }
</SCRIPT>
</head>
<body>
	<s:form name="Form1" id="Form1" method="post">
		<s:hidden name="devID" id="devID"/>
		<table cellSpacing="1" cellPadding="5" width="780" align="center"
			bgColor="#f5fafe" style="border: 1px solid #8ba7e3" border="0">
			<tr>
				<td class="ta_01" colSpan="2" align="center"
					background="${pageContext.request.contextPath }/images/b-info.gif">
					<font face="宋体" size="2"><strong>设备校准批量添加</strong></font>
				</td>
			</tr>
			<tr>
				<td width="50%" height="293">
					<fieldset style="padding: 2; width: 300px; height: 320px">
						<legend>请选择设备</legend>
						<table border="0" width="100%" id="table5">
							<tr>
								<td align="center" bgColor="#f5fafe" class="ta_01"
									style="width: 28%">设备类型：</td>
								<td align="left" bgColor="#f5fafe" class="ta_01"
									style="width: 64%">
									<s:if test="#request.devTypes!=null">
										<s:select list="%{#request.devTypes}"
													name="devType" id="devType" cssClass="bg" onchange="getdevTypeChange(this)"
													listKey="ddlCode" listValue="ddlName"
													value="devType">
										</s:select>
									</s:if>	
								</td>
							</tr>
							<tr>
								<td colspan="2" align="right" bgColor="#f5fafe" class="ta_01">
									<input type="button" name="chkall"
									style="font-size: 12px; color: #000000; background-color: #f5fafe; border: 0px;"
									10"" value="全选" onClick="CheckAll(dtype.form)"> |&nbsp;
									<input type="button"
									style="font-size: 12px; color: #000000; background-color: #f5fafe; border: 1px;"
									18"" name="chkOthers" value="取消"
									onClick="CheckOthers(dtype.form)">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<IFRAME src="elecAdjustAction_moreAddList.do" name="dtype" id="dtype" frameBorder=0 width="335" scrolling=auto
										height="235">
									</IFRAME>
								</td>
							</tr>
						</table>
					</fieldset>
				</td>
				<td height="293">
					<table cellSpacing="1" width=100% cellPadding="5" height="320"
						align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3"
						border="0">
						<tr>
							<td align="center" bgcolor="#f5fafe" class="ta_01">校准时间：</td>
							<td bgColor="#f5fafe" class="ta_01">
								<font color="#FF0000">*</font>&nbsp;
								<s:textfield name="startDate" type="date" class="bg" id="startDate" size="10"/>
							</td>
						</tr>
						<tr>
							<td align="center" bgcolor="#f5fafe" class="ta_01">有无记录：</td>
							<td bgColor="#f5fafe" class="ta_01">
								<select name="isHaving"	id="isHaving" class="bg" style="width: 50" name="ifshare" onChange="shareOnChange(this)">
									<option value="1">有</option>
									<option value="0" selected>无</option>
								</select>&nbsp;&nbsp;&nbsp;&nbsp; <span id=PPassword style="DISPLAY: none">
									<input style="font-size: 12px; color: black;" id="BT_Add"
									type="button" value="详细" name="BT_Add"
									onClick="openWindowWithName('EUpload.jsp',800,450,'ECC');" />
								</span>
							</td>
						</tr>
						<tr>
							<td align="center" bgcolor="#f5fafe" class="ta_01"></td>
							<td bgColor="#f5fafe" class="ta_01"></td>
						</tr>

						<tr>
							<td align="center" bgcolor="#f5fafe" class="ta_01">记录描述：</td>
							<td bgColor="#f5fafe" class="ta_01">
								<s:textarea name="record" id="record" cssStyle="WIDTH: 96%" rows="3" cols="20"/>
							</td>
						</tr>
						<tr>
							<td align="center" bgcolor="#f5fafe" class="ta_01">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								注：</td>
							<td bgColor="#f5fafe" class="ta_01">
								<s:textarea name="comment" id="comment" cssStyle="WIDTH: 96%" rows="3" cols="20"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="15" colspan="2" align="center" bgColor="#f5fafe"
					class="ta_01" style="width: 100%"><input type="button"
					name="BT_Submit22" value="保存" id="BT_Submit22"
					style="font-size: 12px; color: black;"
					onclick="return check(dtype.form);">&nbsp;&nbsp; <INPUT
					style="font-size: 12px; color: black;" type="reset" value="关闭"
					ID="Reset1" NAME="Reset1" onClick="window.close();" /></td>
			</tr>
		</table>
		<br>
	</s:form>
</body>
</html>