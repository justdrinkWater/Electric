

<%@ page language="java" pageEncoding="UTF-8"%>


<html>
<head>
<LINK href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet">
<title>站点信息编辑</title>
<script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath }/script/calendar.js" charset="gb2312"></script>
<script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath }/script/function.js" ></script>
<Script language="javascript">
	function check_null(){
	
		 var theForm=document.Form1;
		 
		 if(theForm.jctId.value=="0")
		{
			alert("请选择所属单位");
			theForm.jctId.focus();
			return false;
		} 
	    
	    if(theForm.stationType.value=="0")
		{
			alert("请选择站点类别");
			theForm.stationType.focus();
			return false;
		} 
	     if(Trim(theForm.stationName.value)=="")
		{
			alert("站点名称不能为空");
			theForm.stationName.focus();
			return false;
		} 
		if(Trim(theForm.stationCode.value)=="")
		{
			alert("站点代号不能为空");
			theForm.stationCode.focus();
			return false;
		} 
	   
	   if(theForm.comment.value.length>250){
     
        	alert("备注字符长度不能超过250");
			theForm.comment.focus();
			return false; 
        }
		 
	   document.Form1.action="stationEdit.do";
	   document.Form1.submit();
	   //window.setTimeout(refreshThisOpener('stationInfo.do'),3000);
		
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
		<td class="ta_01" align="center" colSpan="4" background="${pageContext.request.contextPath }/images/b-info.gif">
		 <font face="宋体" size="2"><strong>站点信息编辑</strong></font>
		</td>
     </tr>
    <tr>
    
    <input type="hidden" name="stationid" value="4028d0931a519a19011a519e52e30001">
    
<td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">所属单位：</td>
<td width="35%" class="ta_01" bgColor="#ffffff">
       
        <select name="jctId" id="jctId" style="width:155px">
		
		<option value="0">全部</option>
		
		
		
		
		<option value="1">540</option>	
		
		
		
		
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
		
		
		
		<option value="12" selected>北京台</option>	
		
		
		
		
		
		<option value="13">海南台</option>	
		
				
		</select> <font color="#FF0000">*</font> 
</td>
<td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">站点名称：</td>
<td width="35%" class="ta_01" bgColor="#ffffff">
<input name="stationName" type="text" id="stationName"  size="20" maxlength="25" value="maradona"> <font color="#FF0000">*</font></td>
</tr>
<tr> 
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">站点代号：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff"><input name="stationCode" type="text" id="Text2"  size="20" maxlength="25" value="maradona"> <font color="#FF0000">*</font></td>
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">使用时间：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff" height="30">
  <input name="useStartDate" type="text"  size="20" value="2008-06-04" onclick="JavaScript:calendar(document.Form1.useStartDate)"></td>
 </tr>
<tr> 
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">安装地点：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff">
  <input name="jcfrequency" type="text" id="jcfrequency"  size="20" maxlength="50" value="maradona"></td>
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">生产厂家：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff">
   <input name="produceHome" type="text" id="produceHome"  size="20" maxlength="25" value="maradona"></td>
 </tr>
 <tr> 
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">通讯方式：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff">
  <input name="contactType" type="text" id="contactType"  size="20" maxlength="25" value="maradona"></td>
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">站点类别：</td>
  <td  width="35%" class="ta_01" bgColor="#ffffff" height="30">
                    <select name="stationType" id="stationType" style="width:160px">
					<option value="0">全部</option>
					
							
					
		           <option value="1"  selected>国内遥控站</option>	
		            
		            
		            
					
							
					
		            
		            <option value="3">国内采集点</option>	
		            
		            
					
							
					
		            
		            <option value="4">国内</option>	
		            
		            
					
							
					
		            
		            <option value="5">国外</option>	
		            
		            
					
							
					
		            
		            <option value="2">海外遥控站</option>	
		            
		            
						
					</select><font color="#FF0000">*</font></td>
  </tr>

<tr> 
  <td width="15%" height="22" align="center" bgColor="#f5fafe" class="ta_01">归属地：</td>
  <td width="35%" class="ta_01" bgColor="#ffffff"><input name="contactType" type="text" id="contactType"  size="20" maxlength="25" value="maradona"></td>
  <td width="15%" height="22" align="center" bgColor="#ffffff" class="ta_01"></td>
  <td width="35%" class="ta_01" bgColor="#ffffff" height="30"></td>
</tr>  
<tr>
	<td width="15%" class="ta_01" align="center" bgcolor="#f5fafe">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
	<td width="85%" class="ta_01" bgcolor="#ffffff" colspan="3">
		<textarea name="comment" id="comment" style="width:100%" style="word-break: break-all"  rows="4">二期</textarea></td>
</tr>


    <tr> 
      <td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="4">
        
        
        <input type="button" name="BT_Submit" value="保存" id="BT_Submit" style="font-size:12px; color:black; height=22;width=55" onclick="check_null()"> 
        <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT> 
        
        
        <INPUT style="font-size:12px; color:black; height=22;width=55" type="reset" value="关闭"  NAME="Reset1" onclick="window.close();">
      </td>
    </tr>
  </table>
  　
</form>
</body>
</HTML>
