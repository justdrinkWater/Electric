
<%@ page language="java" pageEncoding="UTF-8"%>



<html>
<head>
<title>站点维护计划</title>
<link href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet">
<script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath }/script/calendar.js" charset="gb2312"></script>
<script language="javascript" src="${pageContext.request.contextPath }/script/function.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/script/pub.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/script/validate.js"></script>
<Script type="text/javascript" language="javascript">


 function  gotopage(path,where){
       
     var page=document.Form2.pageNO;
     
     //如果传过来的参数不在下列之中，则还是回到当前页(修改和删除完之后)
     
     if(where=="next"){     
       page.value=document.Form2.nextpageNO.value;
      
     }else if(where=="prev"){   
       page.value=document.Form2.prevpageNO.value;
     }else if(where=="end"){
     
       page.value=document.Form2.sumPage.value;
     }else if(where=="start"){
       page.value=1;
     }else if(where=="go"){
         
         var theForm = document.Form2;   
  
         if(Trim(theForm.goPage.value)=="")
	     {
		    alert("请输入页数"); 
		    theForm.goPage.focus();   
		    return false;
	     }
	 
	    if(!checkNumber(theForm.goPage))
	    {
		    alert("请输入正确页数(数字)"); 
		    theForm.goPage.focus();     
		    return false;
	     }
	     
	     var objgo=parseInt(theForm.goPage.value);
	     var objsum=parseInt(theForm.sumPage.value);     
	    if(objgo<=0||objgo>objsum){
	 
	       alert("不存在此页，请重新输入页数"); 
		   theForm.goPage.focus();     
		   return false; 
	    }
         
       page.value=theForm.goPage.value;                
     } 
     
     //新增维护计划后，因为是倒序排列，所以应去第一页，在此做标记


     if(where=="addnewplan"){
        page.value=1;
     }
     
      document.Form1.ifnewquery.value="0";    //不是新的查询,标志用于业务处理类


      document.Form1.pageNO.value=document.Form2.pageNO.value;  
      document.Form1.querysql.value=document.Form2.querysql.value;   
      document.Form1.pageSize.value=document.Form2.pageSize.value;
     
      Pub.submitActionWithForm('Form2',path,'Form1');      
}  
 
   function gotoquery(path){
    
      var theForm=document.Form1;
       
      if(checkNull(theForm.startdate)){
        
          if(!checkDatetime(theForm.startdate.value))
		  {
			alert("请输入正确的计划时间");
			theForm.startdate.focus();
			return;
		  }
      }
      
       if(checkNull(theForm.enddate)){
        
          if(!checkDatetime(theForm.enddate.value))
		  {
			alert("请输入正确的计划时间");
			theForm.enddate.focus();
			return;
		  }
      }
    
      document.Form1.ifnewquery.value="1";  //新的查询应去第一页 ，用新的查询条件，标志给业务处理类用 
      document.Form1.pageNO.value=1;
      document.Form1.pageSize.value=10;
      Pub.submitActionWithForm('Form2',path,'Form1');  
      
 }
   
</script>
</head>
<body >

 <form name="Form1" method="post" id="Form1" style="margin:0px;">
	<table cellspacing="1" cellpadding="0" width="90%" align="center" bgcolor="#f5fafe" border="0">
		<tr>
			<td class="ta_01" align="center" background="${pageContext.request.contextPath }/images/b-info.gif">
			&nbsp;<a href="siteMaintainIndex.jsp" class="cl_01"><font face="宋体" size="2"><strong>维护计划</strong></font></a> 
			| <a href="siteStateIndex.jsp"  class="cl_01"><font face="宋体" size="2">维护情况</font></a>
			</td>
		</tr>
		<TR height=10><td></td></TR>
		<tr>
			<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<tr>
					<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">&nbsp;&nbsp;&nbsp; 
					所属单位：</td>
					<td class="ta_01" bgcolor="#f5fafe">
					<select name="jct" id="jct" class="bg">
					
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
					
					</select> </td>
					<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">
					计划时间：</td>
					<td class="ta_01"   width="300" bgcolor="#f5fafe">
					<input name="startdate" type="text" id="startdate" size="10" onclick="JavaScript:calendar(document.Form1.startdate)" > ~ 
					<input name="enddate" type="text" id="enddate" size="10" onclick="JavaScript:calendar(document.Form1.enddate)" ></td>
				</tr>

					<input type="hidden" name="initflag"   value="0">				
					<input type="hidden" name="pageNO"     value="" >                
                    <input type="hidden" name="querysql"   value="" >        
                    <input type="hidden" name="pageSize"   value="" >
                    <input type="hidden" name="ifnewquery"  >
				
			</table>
			</td>
		</tr>
		</table>
	</form>	
	<br>	
	<form name="Form2" method="post" id="Form2" style="margin:0px;">	
	  <table cellspacing="0" cellpadding="0" width="90%" align="center" bgcolor="#f5fafe" border="0">	
		<TR>
			<TD align="center" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width=25><img src="${pageContext.request.contextPath }/images/yin.gif" width="15"></TD>
			<TD class="DropShadow" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width=80>维护计划列表</TD>
			<td class="ta_01" align="right" bgcolor="#f5fafe">
			<input type="button" name="BT_Search" style="font-size:12px; color:black; height=20;width=50" value="查询" id="BT_Search" onclick="gotoquery('getRepairPlan.do')" >
			
			<input  id="BT_Add" style="font-size:12px; color:black; height=20;width=50" type="button" value="添加" name="BT_Add" onclick="openWindow('siteMaintainAdd.jsp','800','450');" />
				
			</td>
		</TR>	
	 </TABLE>	
	<table cellspacing="1" cellpadding="0" width="90%" align="center" bgcolor="#f5fafe" border="0">	
		<tr>
			<td class="ta_01" align="center" bgcolor="#f5fafe">
			<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1" style="BORDER-RIGHT:gray 1px solid; BORDER-TOP:gray 1px solid; BORDER-LEFT:gray 1px solid; WIDTH:100%; WORD-BREAK:break-all; BORDER-BOTTOM:gray 1px solid; BORDER-COLLAPSE:collapse; BACKGROUND-COLOR:#f5fafe; WORD-WRAP:break-word">
				<tr style="FONT-WEIGHT:bold;FONT-SIZE:12pt;HEIGHT:25px;BACKGROUND-COLOR:#afd1f3">
					<td align="center" width="10%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">序号</td>
					<td align="center" width="35%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">所属单位</td>
					<td align="center" width="35%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">时间</td>
					
					<td align="center" width="10%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">编辑</td>
					<td align="center" width="10%"height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">删除</td>
						
				</tr>
				
			
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="10%">&nbsp;1</td>
					<td  align="center" width="35%" style="HEIGHT: 22px">540</td>
					<td  align="center"  width="35%">
					<a href="#" onclick="openWindow('siteMaintainView.jsp?editflag=0&planid=4028d09317d7c9190117d7cb63b70001',800,450)" class="cl_01">
					2008-02-03</a></td>
								
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteMaintainEdit.jsp?editflag=1&planid=4028d09317d7c9190117d7cb63b70001',800,450)">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="javascript:gotopage('removeRepairPlan.do?planid=4028d09317d7c9190117d7cb63b70001','nowpage')" 
					 onclick="return confirm('你确定要删除 2008-02-03 的维护计划？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a></td>
				    	
				</tr>
			
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="10%">&nbsp;2</td>
					<td  align="center" width="35%" style="HEIGHT: 22px">540</td>
					<td  align="center"  width="35%">
					<a href="#" onclick="openWindow('siteMaintainView.jsp?editflag=0&planid=8a6f819b12f412c60112fb08fe370001',800,450)" class="cl_01">
					2007-06-06</a></td>
								
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteMaintainEdit.jsp?editflag=1&planid=8a6f819b12f412c60112fb08fe370001',800,450)">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="javascript:gotopage('removeRepairPlan.do?planid=8a6f819b12f412c60112fb08fe370001','nowpage')" 
					 onclick="return confirm('你确定要删除 2007-06-06 的维护计划？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a></td>
				    	
				</tr>
			
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="10%">&nbsp;3</td>
					<td  align="center" width="35%" style="HEIGHT: 22px">海南台</td>
					<td  align="center"  width="35%">
					<a href="#" onclick="openWindow('siteMaintainView.jsp?editflag=0&planid=4028d09317d7c9190117d7cba62f0002',800,450)" class="cl_01">
					2008-02-05</a></td>
								
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteMaintainEdit.jsp?editflag=1&planid=4028d09317d7c9190117d7cba62f0002',800,450)">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="javascript:gotopage('removeRepairPlan.do?planid=4028d09317d7c9190117d7cba62f0002','nowpage')" 
					 onclick="return confirm('你确定要删除 2008-02-05 的维护计划？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a></td>
				    	
				</tr>
			
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="10%">&nbsp;4</td>
					<td  align="center" width="35%" style="HEIGHT: 22px">560</td>
					<td  align="center"  width="35%">
					<a href="#" onclick="openWindow('siteMaintainView.jsp?editflag=0&planid=4028d0ab13d8d2e50113d8e2cdab0001',800,450)" class="cl_01">
					2007-07-18</a></td>
								
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteMaintainEdit.jsp?editflag=1&planid=4028d0ab13d8d2e50113d8e2cdab0001',800,450)">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="javascript:gotopage('removeRepairPlan.do?planid=4028d0ab13d8d2e50113d8e2cdab0001','nowpage')" 
					 onclick="return confirm('你确定要删除 2007-07-18 的维护计划？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a></td>
				    	
				</tr>
			
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="10%">&nbsp;5</td>
					<td  align="center" width="35%" style="HEIGHT: 22px">560</td>
					<td  align="center"  width="35%">
					<a href="#" onclick="openWindow('siteMaintainView.jsp?editflag=0&planid=4028d0a81366c8d4011366cdba480001',800,450)" class="cl_01">
					2007-06-26</a></td>
								
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteMaintainEdit.jsp?editflag=1&planid=4028d0a81366c8d4011366cdba480001',800,450)">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="javascript:gotopage('removeRepairPlan.do?planid=4028d0a81366c8d4011366cdba480001','nowpage')" 
					 onclick="return confirm('你确定要删除 2007-06-26 的维护计划？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a></td>
				    	
				</tr>
			
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="10%">&nbsp;6</td>
					<td  align="center" width="35%" style="HEIGHT: 22px">厦门台</td>
					<td  align="center"  width="35%">
					<a href="#" onclick="openWindow('siteMaintainView.jsp?editflag=0&planid=4028d0a813670ab401136722e4580001',800,450)" class="cl_01">
					2007-06-26</a></td>
								
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteMaintainEdit.jsp?editflag=1&planid=4028d0a813670ab401136722e4580001',800,450)">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="javascript:gotopage('removeRepairPlan.do?planid=4028d0a813670ab401136722e4580001','nowpage')" 
					 onclick="return confirm('你确定要删除 2007-06-26 的维护计划？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a></td>
				    	
				</tr>
			
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="10%">&nbsp;7</td>
					<td  align="center" width="35%" style="HEIGHT: 22px">203台</td>
					<td  align="center"  width="35%">
					<a href="#" onclick="openWindow('siteMaintainView.jsp?editflag=0&planid=8a6f819b12f412c60112fee89ed80002',800,450)" class="cl_01">
					2007-06-05</a></td>
								
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteMaintainEdit.jsp?editflag=1&planid=8a6f819b12f412c60112fee89ed80002',800,450)">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="javascript:gotopage('removeRepairPlan.do?planid=8a6f819b12f412c60112fee89ed80002','nowpage')" 
					 onclick="return confirm('你确定要删除 2007-06-05 的维护计划？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a></td>
				    	
				</tr>
			
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="10%">&nbsp;8</td>
					<td  align="center" width="35%" style="HEIGHT: 22px">哈尔滨台</td>
					<td  align="center"  width="35%">
					<a href="#" onclick="openWindow('siteMaintainView.jsp?editflag=0&planid=4028d0a8136ac3df01136adfe0420003',800,450)" class="cl_01">
					2007-06-04</a></td>
								
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteMaintainEdit.jsp?editflag=1&planid=4028d0a8136ac3df01136adfe0420003',800,450)">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
					<td align="center"  width="10%" style="HEIGHT: 22px">
					<a href="javascript:gotopage('removeRepairPlan.do?planid=4028d0a8136ac3df01136adfe0420003','nowpage')" 
					 onclick="return confirm('你确定要删除 2007-06-04 的维护计划？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a></td>
				    	
				</tr>
			
							
			</table>
			</td>
		</tr>
		
		 <tr>
       <td width="100%" height="1"  >
         <table border="0" width="100%" cellspacing="0" cellpadding="0">
         
           <tr>
             <td width="28%" align="left">总记录数：8 条</td> 
             <td width="15%" align="right"></td>                 
             
             <td width="5%" align="center">首页&nbsp;&nbsp;|</td>
             <td width="7%" align="center">上一页&nbsp;&nbsp;&nbsp;|</td>
             
             
			 
             <td width="7%" align="center">下一页&nbsp;&nbsp;&nbsp;|</td>
             <td width="5%" align="center">末页</td>
             
             
             <td width="6%" align="center">第1页</td>
             <td width="6%" align="center">共1页</td>
             <td width="18%" align="right">至第<input size="1" type="text" name="goPage" >页


             <u><a href="#" onClick="gotopage('getRepairPlan.do','go')">确定</a></u></td>
             <td width="3%"></td> 
             <td><input type="hidden" name="pageNO" value="1" ></td> 
             <td><input type="hidden" name="prevpageNO" value="0"></td>
             <td><input type="hidden" name="nextpageNO" value="2"></td>
             <td><input type="hidden" name="querysql" value=""></td> 
             <td><input type="hidden" name="sumPage" value="1" ></td>
             <td><input type="hidden" name="pageSize" value="" ></td> 
           </tr>
         </table>       
       </td>
     </tr>  
		
	</table>
	
</form>

</body>

</html>
