


<%@ page language="java" pageEncoding="UTF-8"%>

<html>
<head>
<LINK href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet">
<title>监测台建筑</title>
<script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath }/script/calendar.js" charset="gb2312"></script>
<script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath }/script/function.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/script/validate.js"></script>
<Script language="javascript">
	function check_null(){
	
		 var theForm=document.Form1;
		 if(theForm.jctId.value=="0")
		{
			alert("请选择所属单位");
			theForm.jctId.focus();
			return false;
		} 
	     if(Trim(theForm.buildName.value)=="")
		{
			alert("建筑名称不能为空");
			theForm.buildName.focus();
			return false;
		} 
		if(theForm.buildType.value=="0")
		{
			alert("请选择建筑类型");
			theForm.buildType.focus();
			return false;
		} 
		if(Trim(theForm.buildArea.value)=="")
		{
			alert("建筑面积不能为空");
			theForm.buildArea.focus();
			return false;
		} 
			     if(!checkNumber(document.Form1.buildArea))
		{
			alert("建筑面积请输入数字");
			document.Form1.buildArea.focus();
			return false;
		}
	    if(Trim(theForm.extendBuildArea.value)!="")
		{
			if(!checkNumber(document.Form1.extendBuildArea))
			{
				alert("扩建面积请输入数字");
				document.Form1.extendBuildArea.focus();
				return false;
			}
		} 
	   if(theForm.comment.value.length>250){
     
        	alert("备注字符长度不能超过250");
			theForm.comment.focus();
			return false; 
        }
		 
	   document.Form1.action="jctBuildEdit.do";
	   document.Form1.submit();
	   window.setTimeout(refreshThisOpener('houseManage.do'),3000);
	}
	function refreshThisOpener(sHref){

    opener.gotopage(sHref,"nowpage");  
    window.close ();
   }
 </script>
</head>

<body>
<form name="Form1" method="post" id="Form1">	
<br>						
<table cellSpacing="1" cellPadding="5" width="580" align="center" bgColor="#eeeeee" style="border:1px solid #8ba7e3" border="0">

    
        	<tr>
			        <td colspan="4" class="ta_01" align="center" background="${pageContext.request.contextPath }/images/b-info.gif">
			         <font face="宋体" size="2"><strong>监测台建筑</strong></font>
			        </td>
		  </tr>
    
    <tr>
    
    <input type="hidden" name="buildId" value="8a6f819b12d014a00112d17c15340037">
    
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">所属单位：</td>
 <td width="35%" class="ta_01" bgColor="#ffffff">
       
        <select name="jctId" id="jctId" style="width:155px">
	    
		<option value="0">全部</option>
		
		
		
		<option value="1" selected>540</option>	
		
		
		
		
		
		<option value="2">560</option>	
		
		
		
		
		<option value="3">成都台</option>	
		
		
		
		
		<option value="4">厦门台</option>	
		
		
		
		
		<option value="5">553台</option>	
		
		
		
		
		<option value="6">201台</option>	
		
		
		
		
		<option value="7">202台</option>	
		
		
		
		
		<option value="8">203台</option>	
		
		
		
		
		<option value="9">哈尔滨台</option>	
		
		
		
		
		<option value="10">西安台</option>	
		
		
		
		
		<option value="11">中心</option>	
		
		
		
		
		<option value="12">北京台</option>	
		
		
		
		
		<option value="13">海南台</option>	
		
				
		</select>&nbsp;<font color="#FF0000">*</font> 
  </td>
   <td colspan=2 height="22" align="center" bgColor="#ffffff" class="ta_01"></td>
   
</tr>
<tr> 
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">建筑名称：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff"><input name="buildName" type="text" id="Text2"  size="20" maxlength="25" value="职工食堂">&nbsp;<font color="#FF0000">*</font></td>
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">建筑类型：</td>
  <td class="ta_01" bgcolor="#ffffff">
   <font face="宋体" color="red">
     <select name="buildType" id="buildType" style="width:155px">
       <option value="0">全部</option>
       
		
		<option value="1" selected>基建</option>	
		
		
		
		
		
		<option value="2">基改</option>	
		
		
		
		
		<option value="3">生活用房</option>	
		
		
		
		
		<option value="4">道路</option>	
		
		
     </select>&nbsp;<font color="#FF0000">*</font>
   </font>
  </td>
</tr>
<tr> 
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">建筑层数：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff"><input name="buildLayer" type="text" id="buildLayer"  size="20" maxlength="25" value=""></td>
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">建筑面积：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff"><input name="buildArea" type="text" id="buildArea"  size="20" maxlength="25" value="430">m<sup>2&nbsp;<font color="#FF0000">*</font></sup></td>
 </tr>
 <tr> 
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">始建时间：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff"><input name="buildStartDate" type="text" id="buildStartDate"  size="20" maxlength="25" value="" onclick="JavaScript:calendar(document.Form1.buildStartDate)"></td>
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">扩建时间：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff"><input name="extendBuildDate" type="text" id="extendBuildDate"  size="20" maxlength="25" value="2001-01-01"onclick="JavaScript:calendar(document.Form1.extendBuildDate)"></td>
 </tr>
 <tr> 
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">扩建面积：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff"><input name="extendBuildArea" type="text" id="extendBuildArea"  size="20" maxlength="25" value="">m<sup>2</td>
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">大修时间：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff"><input name="dxDate" type="text" id="dxDate"  size="20" maxlength="25" value="" onclick="JavaScript:calendar(document.Form1.dxDate)"></td>
 </tr>
 <tr> 
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">造&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff"><input name="buildExpense" type="text" id="buildExpense"  size="20" maxlength="10" value="0">万元</td>
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">使用时间：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff"><input name="useDate" type="text" id="useDate"  size="20" maxlength="25" value="" onclick="JavaScript:calendar(document.Form1.useDate)"></td>
 </tr>
<tr>
	<td width="15%" class="ta_01" align="center" bgcolor="#f5fafe">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
	<td width="85%" class="ta_01" bgcolor="#ffffff" colspan="3">
	    <TEXTAREA name="comment" id="comment" style="WIDTH:92%" rows="4" cols="52"></TEXTAREA>
		</td>
</tr>


    <tr> 
      <td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
      
        <INPUT style="font-size:12px; color:black; height=22;width=55" type="reset" value="关闭"  NAME="Reset1" onclick="window.close();">
      </td>
    </tr>
  </table>
  　
</form>
</body>
</HTML>
