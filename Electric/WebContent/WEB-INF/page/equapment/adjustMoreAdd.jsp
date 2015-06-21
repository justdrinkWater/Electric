



<%@ page language="java" pageEncoding="UTF-8"%>


<html>

<head>
<title>设备校准批量添加</title>
<link href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet" />
<script language="javascript" src="${pageContext.request.contextPath }/script/function.js"></script>
<script language="javascript" src="${pageContext.request.contextPath }/script/calendar.js" charset="gb2312"></script>
<script language="javascript" src="${pageContext.request.contextPath }/script/changePageBackUp.js"></script>
<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
td,select  {
	font-size: 12px;
}
.STYLE1 {color: #FFFFFF}
.STYLE2 {margin: 1px; padding: 2px 4px 2px 10px; border: 1px solid #8AA2CC; background-attachment: fixed; background-image: url(${pageContext.request.contextPath }/images/button_view.gif); background-repeat: no-repeat; background-position: left center; cursor: hand; text-align: right; left: 10px; top: 10px; right: 0px; bottom: 10px; clip: rect(10px 10px 10px 10px); height: 20px; background-color: #DAE6FF;}
.STYLE3 {margin: 1px; padding: 2px 4px 2px 10px; border: 1px solid #8AA2CC; background-attachment: fixed; background-image: url(${pageContext.request.contextPath }/images/button_add.gif); background-repeat: no-repeat; background-position: left center; cursor: hand; text-align: right; left: 10px; top: 10px; right: 0px; bottom: 10px; clip: rect(10px 10px 10px 10px); height: 20px; background-color: #DAE6FF;}
-->
</style>

<script language="javascript">
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
		<script>
<!--
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
<SCRIPT type="text/javascript">

function check(){

         var theForm = document.Form1;
         
          if(Trim(theForm.startDate.value)==""){
	
	    	alert("请输入校准日期");
			theForm.startDate.focus();
			return false;
	    }
         
     var id="";
	 for (var i=0;i<dtype.Form1.elements.length;i++)
	{
		
		var e = dtype.Form1.elements[i];
	if (dtype.Form1.elements[i].checked==true)
	{
			id=id+dtype.Form1.elements[i].value+",";
			}
	
	}
	
    document.Form1.devId.value=id; 
    if (theForm.record.value.length >250)
	{
	    alert("记录描述不能超过250个汉字！");
	    theForm.record.focus();
	    return false;
	}
	if (theForm.comment.value.length >250)
	{
	    alert("备注不能超过250个汉字！");
	    theForm.comment.focus();
	    return false;
	}
    
     
    if(id!=""){
     
		document.Form1.action="moreUpdateDeviceX.do";
		document.Form1.submit();
		alert("保存成功！");
	   window.opener.jsJumpToBeginX();//去第1页



	}

	window.close();
	        
}
  function getdevTypeChange(dt){
  
      document.all.dtype.src="typeDeviceX.do?findFlag=0&devType="+dt.value;
  }

</SCRIPT>
<SCRIPT type="text/javascript">
function submitrequest(action){
  
  eval("document.location='"+action+"'");
}

</SCRIPT>
</head>

<body  onunload="submitrequest('clearSession.do?action=X')">

<form name="Form1" method="post" >
							<input type="hidden" name="devId" id="devId" value=""> 
                      &nbsp; 
                      
  							<table cellSpacing="1" cellPadding="5" width="680" align="center" bgColor="#f5fafe" style="border: 1px solid #8ba7e3" border="0">
							
					 <tr>
			        <td class="ta_01" colSpan="2" align="center" background="${pageContext.request.contextPath }/images/b-info.gif">
			         <font face="宋体" size="2"><strong>设备校准批量添加</strong></font>
			        </td>
		          </tr>	
								
								
								<tr>
									<td width="30%" height="293">
									<fieldset style="padding: 2; width:280px; height:296px">
									<legend>请选择设备</legend>
									<table border="0" width="100%" id="table5">
										<tr>
											<td align="center" bgColor="#f5fafe" class="ta_01" style="width: 28%">设备类型：</td>
											<td align="left" bgColor="#f5fafe" class="ta_01" style="width: 64%">
				<select name="devType" id="devType" class="bg"  onchange="getdevTypeChange(this)">
					<option value="" >全部</option>
				
					
											<option value="1" >
												电力设备dd
											</option>
											
				
											<option value="2" >
												天线设备
											</option>
											
				
											<option value="3" >
												通讯设备
											</option>
											
				
											<option value="4" >
												防雷设备
											</option>
											
				
											<option value="5" >
												办公设备
											</option>
											
				
											<option value="6" >
												电视机房设备
											</option>
											
				
											<option value="7" >
												发电机房设备
											</option>
											
				
				
					</select></td>
										</tr>
										<tr>
											<td colspan="2" align="right" bgColor="#f5fafe" class="ta_01">
											<input type="button" name="chkall" style="font-size:12px; color:#000000; background-color:#f5fafe; border:0px;  height="10"" value="全选" onClick="CheckAll(dtype.form)"> 
				|&nbsp;
<input type="button"  style="font-size:12px; color:#000000; background-color:#f5fafe; border:1px; height="18"" name="chkOthers" value="取消" onClick="CheckOthers(dtype.form)" ></td>
										</tr>
										<tr>
											<td colspan="2">
		<IFRAME src="adjustMoreAddList.jsp?findFlag=0&devType=
		" name="dtype" id="dtype" frameBorder=0 width=335 scrolling=auto height=260></IFRAME>
			  </td>
										</tr>
									</table>
									</fieldset></td>
									<td width=70% height="293">
									<table cellSpacing="1" width=100% cellPadding="5" height="320" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0" >
									
										<tr>
											<td align="center" bgcolor="#f5fafe" class="ta_01">校准时间：</td>
											<td bgColor="#f5fafe" class="ta_01"><input name="startDate" type="text" class="bg" id="startDate"  onclick="JavaScript:calendar(this)" size="10" readonly>&nbsp;<font color="#FF0000">*</font></td>
										</tr>

										<tr>
											<td align="center" bgcolor="#f5fafe" class="ta_01">有无记录：</td>
											<td bgColor="#f5fafe" class="ta_01">
<select   name="isHaving" id="isHaving" class="bg" style="width:50"  name=ifshare onChange=shareOnChange(this)>
  
  <option value="1">有</option>
  <option value="0"  selected>无</option>
</select>&nbsp;&nbsp;&nbsp;&nbsp; <span  id=PPassword style="DISPLAY: none">
  <input style="font-size:12px; color:black; height=22;width=55"  id="BT_Add" type="button" value="详细" name="BT_Add" onClick="openWindowWithName('EUpload.jsp',800,450,'ECC');" />
  </span></td>
										</tr>
										
											<tr>
											<td align="center" bgcolor="#f5fafe" class="ta_01"></td>
											<td bgColor="#f5fafe" class="ta_01"></td>
										</tr>
										
										<tr>
											<td align="center" bgcolor="#f5fafe" class="ta_01">记录描述：</td>
											<td bgColor="#f5fafe" class="ta_01">
											<textarea name="record" id="record"  style="WIDTH:96%" rows="3" cols="20"></textarea></td>
										</tr>
										<tr>
											<td align="center" bgcolor="#f5fafe" class="ta_01">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 注：</td>
											<td bgColor="#f5fafe" class="ta_01">
											<textarea name="comment" id="comment"  style="WIDTH:96%" rows="3" cols="20"></textarea></td>
										</tr>
									</table>
									</td>
								</tr>
									
								<tr><td height="15" colspan="2" align="center" bgColor="#f5fafe" class="ta_01" style="width: 100%">
									
			  <input type="button" name="BT_Submit22" value="保存" id="BT_Submit22" style="font-size:12px; color:black; height=22;width=55"   onclick="return check(dtype.form);">&nbsp;&nbsp;
               <INPUT style="font-size:12px; color:black; height=22;width=55"  type="reset" value="关闭" ID="Reset1" NAME="Reset1" onClick="window.close();" />
            </td> </tr>
							</table>
			 
  	<br>
</form></body>
</html>