


<%@ page language="java" pageEncoding="UTF-8"%>


<html>
<head>
<title>维护计划添加</title>
<link href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath }/script/calendar.js" charset="gb2312"></script>
<script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath }/script/function.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/script/validate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/script/pub.js"></script>
<script language="javascript" src="/DRMS/script/public.js" charset="gb2312"></script>

<Script language="javascript">
	function check_null(){
	
		var theForm=document.Form1;
		
	    if(theForm.jctId.value=="0")
		{
			alert("请选择所属单位");
			theForm.jctId.focus();
			return false;
		} 
		
	    if(Trim(theForm.occurDate.value)=="")
		{
			alert("计划时间不能为空");
			theForm.occurDate.focus();
			return false;
		}else{
		  if(!checkDatetime(theForm.occurDate.value))
		   {
			 alert("请输入正确的计划时间");
			 theForm.occurDate.focus();
			 return;
		   }
		}
		
	    if(theForm.mainContent.value.length>250){
     
        	alert("主要内容信息字符长度不能超过250");
			theForm.mainContent.focus();
			return false; 
        }
        
        if(theForm.comment.value.length>250){
     
        	alert("备注字符长度不能超过250");
			theForm.comment.focus(); 
			return false; 
        }
			 
	   document.Form1.action="addRepairPlan.do";
	   document.Form1.submit();
	      
	   window.setTimeout(refreshThisOpener('getRepairPlan.do'),3000);		
	}
	
   function refreshThisOpener(sHref){

    opener.gotopage(sHref,"addnewplan");  
    window.close ();
  }
  
     
	 function upload(fn){
   
       var jctId=document.Form1.jctId.value;
       if(jctId==0){
          alert("请先选择所属单位");
          return;
       }
	      var str= "initUpload.do?belongTo=" + fn
			+ "&jctId=" + jctId
			+ "&projid=bugid";
				
		OpenWindow('uploadInit',str,800,450);
	}
	
 </script>
</head>

<body>
<form name="Form1" method="post" >
	<br>
	<table cellspacing="1" cellpadding="5" width="680" align="center" bgcolor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">

		<tr>
			        <td colspan="4" class="ta_01" align="center" background="${pageContext.request.contextPath }/images/b-info.gif">
			         <font face="宋体" size="2"><strong>维护计划添加</strong></font>
			        </td>
		  </tr>
		<tr>
			<td width="18%" align="center" bgcolor="#f5fafe" class="ta_01">所属单位：</td>
			<td class="ta_01" bgcolor="#ffffff">
			<select name="jctId" id="jctId" class="bg">
			
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
		    
		    <option value="12">北京台</option>	
		    
		    <option value="13">海南台</option>	
		    	
			</select> <font color="#FF0000">*</font></td>
			<td width="18%" align="center" bgcolor="#f5fafe" class="ta_01">计划时间：</td>
			<td class="ta_01" bgcolor="#ffffff">
			<input name="occurDate" type="text" maxlength="40" id="occurDate" onclick="JavaScript:calendar(document.Form1.occurDate)">
			<font color="#FF0000">*</font>
			</td>
		</tr>
		<tr>
			<td class="ta_01" align="center" bgcolor="#f5fafe">内&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容：</td>
			<td class="ta_01" bgcolor="#ffffff" colspan="3">
			<textarea name="mainContent" id="mainContent" style="WIDTH:86%; height:130"></textarea>
			&nbsp;&nbsp;<span id=PResolve style="DISPLAY: ''"><input id="btnContent" type="button" value=" 详细" name="btnContent" onclick="upload('8');" style="font-size:12px; color:black; height=20"></span></td>
		</tr>
		<tr>
			<td class="ta_01" align="center" bgcolor="#f5fafe">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
			<td class="ta_01" bgcolor="#ffffff" colspan="3">
			<textarea name="comment" id="comment" style="WIDTH:96%; height:130"></textarea></td>
		</tr>
		<tr>
			<td class="ta_01" style="width: 100%" align="center" bgcolor="#f5fafe" colspan="4">
			<input type="button" name="BT_Submit" value="保存" id="BT_Submit" style="font-size:12px; color:black; height=22;width=55" onclick="check_null()">
			<font face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>&nbsp;
			<input style="font-size:12px; color:black; height=22;width=55" type="reset" value="关闭" id="Reset1" name="Reset1" onclick="window.close();">
			<span id="Label1"></span></td>
		</tr>
	</table>
	<br>
</form>


</body>

</html>


