



<%@ page language="java" pageEncoding="UTF-8"%>

<HTML>
	<HEAD>
		<title>设备校准管理</title>
	    <link href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet" />
		<script language="javascript" src="${pageContext.request.contextPath }/script/function.js"></script>
		<script language="javascript" src="${pageContext.request.contextPath }/script/pub.js"></script>
		<script language="javascript" src="${pageContext.request.contextPath }/script/calendar.js" charset="gb2312"></script>
		<script language="javascript" src="${pageContext.request.contextPath }/script/changePageBackUp.js"></script>

 <script language="javascript">
	
  function shareOnChange(mySelect)
  {
    var theForm = document.forms[0];
    if (document.F1.apstate.value==1)
    { 
       PPassword.style.display = ""
    }
    else{
      PPassword.style.display = "none"
    }
 }
 

 function jsNextX(){
     changeformvalue();
	 document.F1.direction.value="NEXT";
	 document.F1.goPage.value="";
	 Pub.submitActionWithForm('Form1','changePageDeviceX.do','F1');     
}

function jsPreviousX(){
   	 changeformvalue();
	 document.F1.direction.value="PREVIOUS";
	 document.F1.goPage.value="";
     Pub.submitActionWithForm('Form1','changePageDeviceX.do','F1'); 
}

function jsJumptoX(){

     changeformvalue();
	 var gopage=parseInt(document.F1.goPage.value);
	 var sumpage=parseInt(document.F1.sumPage.value);
	
	 if(gopage<=sumpage&&gopage>=1)
	 {
	 	
	 	document.F1.pageNo.value=document.F1.goPage.value;
        Pub.submitActionWithForm('Form1','changePageDeviceX.do','F1'); 
	 }
	  else{
	    alert("不存在此页，请重新输入页数"); 
	 }
	 
}

function jsJumpToBeginX(){
     changeformvalue();
	 document.F1.pageNo.value="1";
     Pub.submitActionWithForm('Form1','changePageDeviceX.do','F1'); 
}

function jsJumpToEndX(){
    changeformvalue();
	document.F1.pageNo.value=document.Form1.sumPage.value;
    Pub.submitActionWithForm('Form1','changePageDeviceX.do','F1'); 
}
 
 function changeformvalue(){
	
    document.F1.direction.value=document.Form1.direction.value;
	document.F1.goPage.value=document.Form1.goPage.value;
	document.F1.typeView.value=document.Form1.typeView.value;
	document.F1.pageNo.value=document.Form1.pageNo.value;
	document.F1.changeFlag.value=document.Form1.changeFlag.value;
	document.F1.sumPage.value=document.Form1.sumPage.value;
	document.F1.lastRecordIndex.value=document.Form1.lastRecordIndex.value;
	
 }
 
  function  searchdeviceX(){
     changeformvalue();
     Pub.submitActionWithForm('Form1','searchDeviceX.do','F1');   
  }
  
  
  function  savedeviceX(){
     changeformvalue();
     Pub.submitActionWithForm('Form1','toDeviceX.do','F1');   
  }

</script>
	    <style type="text/css">
<!--
.STYLE3 {margin: 1px; padding: 2px 4px 2px 10px; border: 1px solid #8AA2CC; background-attachment: fixed; background-image: url(${pageContext.request.contextPath }/images/button_add.gif); background-repeat: no-repeat; background-position: left center; cursor: hand; text-align: right; left: 10px; top: 10px; right: 0px; bottom: 10px; clip: rect(10px 10px 10px 10px); height: 20px; background-color: #DAE6FF;}
-->
        </style>
</HEAD>
	<body >
	
	 <form name="F1" method="post"  id="F1" style="margin:0px;"> 
	 
	   				<input type="hidden" name="typeView" value="" >
				    <input type="hidden" name="direction" value="">
                    <input type="hidden" name="pageNo" value="" >
                    <input type="hidden" name="sumPage" value="" > 
                    <input type="hidden" name="lastRecordIndex" value="" >
                    <input type="hidden" name="changeFlag" value="" >
                    <input type="hidden" name="goPage" value="" >
                    
                    
	 <table cellSpacing="0" cellPadding="0" width="90%" align="center" bgColor="#f5fafe" border="0">	  
		  <tr>
			<td class="ta_01" align="center" background="${pageContext.request.contextPath }/images/b-info.gif">
			&nbsp;<a href="adjustIndex.jsp" class="cl_01"><font face="宋体" size="2"><strong>校准管理</strong></font></a>
			|<a href="repairIndex.jsp" class="cl_01"><font face="宋体" size="2">检修管理</font></a>
			</td>
		</tr>
		<TR height=10><td></td></TR>
						
		<tr>
		    <td colspan="2">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr> 
              <td width=15% class="ta_01" align="center" bgColor="#f5fafe" height="22">所属单位：</td>
				<td width=35% class="ta_01" ><select name="jctId" id="jctId" class="bg">
					
		            <option value="">全部</option>
		            
					
					
											<option value="1">
												540
											</option>
											
				
											<option value="2">
												560
											</option>
											
				
											<option value="3">
												成都台
											</option>
											
				
											<option value="4">
												厦门台
											</option>
											
				
											<option value="5">
												553台
											</option>
											
				
											<option value="6">
												201台
											</option>
											
				
											<option value="7">
												202台
											</option>
											
				
											<option value="8">
												203台
											</option>
											
				
											<option value="9">
												哈尔滨台
											</option>
											
				
											<option value="10">
												西安台
											</option>
											
				
											<option value="11">
												中心
											</option>
											
				
											<option value="12">
												北京台
											</option>
											
				
											<option value="13">
												海南台
											</option>
											
				
				
					</select></td>
<td width=15% class="ta_01" align="center" bgColor="#f5fafe" height="22">设备名称：</td>
									<td width=35% class="ta_01" >
									<input name="devName" type="text" id="devName"  size="19" value=""></td>
</tr>
 <tr> 
<td width=15% class="ta_01" align="center" bgColor="#f5fafe" height="22">
									校准状态：</td>
									<td width=35% class="ta_01" >
									<select name="apstate" id="apstate" class="bg" onChange=shareOnChange(this)>
                                     <option value="" selected>全部</option>
                                      <option value="0">未校准</option>
                                       <option value="1">已校准</option>
                                    </select>
                                    </td>
                       <td width=15% class="ta_01" align="center" bgcolor="#f5fafe" height="22">设备类型：</td>
					   <td class="ta_01" >
					   <select name="devType" id="devType" class="bg">
					    <option value="">全部</option>
				        
					      
											<option value="1">
												电力设备dd
											</option>
											
				
											<option value="2">
												天线设备
											</option>
											
				
											<option value="3">
												通讯设备
											</option>
											
				
											<option value="4">
												防雷设备
											</option>
											
				
											<option value="5">
												办公设备
											</option>
											
				
											<option value="6">
												电视机房设备
											</option>
											
				
											<option value="7">
												发电机房设备
											</option>
											
				
				
					</select></td>
</tr>

 <tr id=PPassword style="DISPLAY: none"> 
    <td width=15% class="ta_01" align="center" bgColor="#f5fafe" height="22">校准日期：</td>
				<td width=35% class="ta_01" >						
                    <input name="startDatef" type="text" id="startDatef" size="10" onclick="JavaScript:calendar(this)"   value=""> ~ 
					<input name="startDatet" type="text" id="startDatet" size="10" onclick="JavaScript:calendar(this)"  value="">					
			    </td>
                <td width=15% class="ta_01" align="center"  height="22">
			    </td>
				<td class="ta_01" ></td>			
</tr>
            </table>        
            </td>
		</tr>
	</table>			
</form>
<br>		
<form name="Form1" method="post"  id="Form1" style="margin:0px;">
  <table cellSpacing="0" cellPadding="0" width="90%" align="center" bgColor="#f5fafe" border="0">

		<TR>
			<TD align="center" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width=25 ><img src="${pageContext.request.contextPath }/images/yin.gif" width="15"></TD>
			<TD class="DropShadow" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width=80 >校准记录列表</TD>
			<td  align="right"  class="ta_01">
                <input type="button" name="BT_Search" value="查询" id="BT_Search" onclick="searchdeviceX()" style="font-size:12px; color:black; height=20;width=50">
                
                <input type="button" name="BT_Search" value="导出" id="BT_Search" style="font-size:12px; color:black; height=20;width=50"  onClick="openWindow('exportXJDevice.do?XorJ=X','600','400');">
                <input name="BT_Add" type="button" style="font-size:12px; color:black; height=20;width=80" id="BT_Add" onClick="openWindow('adjustMoreAdd.jsp',800,450,'添加');" value="批量添加" />          
                <input type="button" name="BT_Search" value="导出设置" id="BT_Search" style="font-size:12px; color:black; height=20;width=80"  onClick="openWindow('adjustExport.jsp?XorJ=X','600','400');">
                
            </td>
		 </TR>
 </TABLE>	
			
 <table cellSpacing="0" cellPadding="0" width="90%" align="center" bgColor="#f5fafe" border="0">
    <tr>
			<td  align="center" bgColor="#f5fafe" class="ta_01">
			<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1"
								style="BORDER-RIGHT:gray 1px solid; BORDER-TOP:gray 1px solid; BORDER-LEFT:gray 1px solid; WIDTH:100%; WORD-BREAK:break-all; BORDER-BOTTOM:gray 1px solid; BORDER-COLLAPSE:collapse; BACKGROUND-COLOR:#f5fafe; WORD-WRAP:break-word">
            <tr style="FONT-WEIGHT:bold;FONT-SIZE:12pt;HEIGHT:25px;BACKGROUND-COLOR:#afd1f3">
              <td align="center" width="5%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">序号</td>
              <td align="center" width="23%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">设备名</td>
              <td align="center" width="9%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">校准周期</td>
              <td align="center" width="9%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">使用日期</td>
              <td align="center" width="9%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">校准状态</td>
	      	  <td align="center" width="11%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">校准日期</td>
              <td align="center" width="13%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">所属单位</td>
              
              <td width="16%" align="center" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">校准记录维护</td>
              
       </tr>
      
       
					
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
              <td  align="center" width="5%">
				1</td>
			  <td  align="center">
			  
			  
			   
			  
              <a href="javascript:;" onClick="openWindow('adjustEdit.jsp?ZhengRi=0&devId=ab15b1290c004d53af24bd2ce8845fa4&seqId=7312&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=',800,450,'设备校准周期添加');" class="cl_01">
              UPS123</a>                
              
			  
			  </td>
              <td  align="center" >
				年</td>
              <td align="center"  >
				2007-06-25</td>
				<td align="center"  >
				未校准




               
	           
				</td>
				<td align="center" width="11%">2007-06-05</td>
				<td align="center" style="HEIGHT: 22px">
				540</td>
		
		
              <td align="center" style="HEIGHT: 22px">
              
              
              添加
              
              
              			
              <a href="javascript:;" onClick="openWindow('adjustEdit.jsp?ZhengRi=1&editflag=1&devId=ab15b1290c004d53af24bd2ce8845fa4&seqId=7312&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=',800,450,'设备校准周期添加');" class="cl_01">修改</a> 
              <a  onclick="return confirm('确认要删除吗？')" href="javascript:Pub.submitActionWithForm('Form1','delDeviceX.do?devId=ab15b1290c004d53af24bd2ce8845fa4&seqId=7312&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=','F1')" class="cl_01">删除</a>              
              <a href="javascript:;" onClick="openWindow('adjustQuery.jsp?devId=ab15b1290c004d53af24bd2ce8845fa4&seqId=7312',650,300,'设备校准历史记录');" class="cl_01">查看</a>
              
       </td>
      
           </tr>
              
					
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
              <td  align="center" width="5%">
				2</td>
			  <td  align="center">
			  
			  
			   
			  
              <a href="javascript:;" onClick="openWindow('adjustEdit.jsp?ZhengRi=0&devId=aa07b80f0c104ba38ebfb049c375997f&seqId=7308&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=',800,450,'设备校准周期添加');" class="cl_01">
              UPS44444</a>                
              
			  
			  </td>
              <td  align="center" >
				1月</td>
              <td align="center"  >
				2007-05-28</td>
				<td align="center"  >
				未校准




               
	           
				</td>
				<td align="center" width="11%">2007-06-12</td>
				<td align="center" style="HEIGHT: 22px">
				540</td>
		
		
              <td align="center" style="HEIGHT: 22px">
                 
              <a href="javascript:;" onClick="openWindow('adjustAdd.jsp?devId=aa07b80f0c104ba38ebfb049c375997f&seqId=7308&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=&isPage=',800,450,'设备校准周期添加');" class="cl_01">添加</a>
              
              
              
              			
              <a href="javascript:;" onClick="openWindow('adjustEdit.jsp?ZhengRi=1&editflag=1&devId=aa07b80f0c104ba38ebfb049c375997f&seqId=7308&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=',800,450,'设备校准周期添加');" class="cl_01">修改</a> 
              <a  onclick="return confirm('确认要删除吗？')" href="javascript:Pub.submitActionWithForm('Form1','delDeviceX.do?devId=aa07b80f0c104ba38ebfb049c375997f&seqId=7308&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=','F1')" class="cl_01">删除</a>              
              <a href="javascript:;" onClick="openWindow('adjustQuery.jsp?devId=aa07b80f0c104ba38ebfb049c375997f&seqId=7308',650,300,'设备校准历史记录');" class="cl_01">查看</a>
              
       </td>
      
           </tr>
              
					
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
              <td  align="center" width="5%">
				3</td>
			  <td  align="center">
			  
			  
			   
			  
              <a href="javascript:;" onClick="openWindow('adjustEdit.jsp?ZhengRi=0&devId=e11c8381ec0f436b992ba0e44dd33cb0&seqId=7313&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=',800,450,'设备校准周期添加');" class="cl_01">
              UPS6666</a>                
              
			  
			  </td>
              <td  align="center" >
				1月</td>
              <td align="center"  >
				2007-05-27</td>
				<td align="center"  >
				未校准




               
	           
				</td>
				<td align="center" width="11%">2007-06-05</td>
				<td align="center" style="HEIGHT: 22px">
				540</td>
		
		
              <td align="center" style="HEIGHT: 22px">
                 
              <a href="javascript:;" onClick="openWindow('adjustAdd.jsp?devId=e11c8381ec0f436b992ba0e44dd33cb0&seqId=7313&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=&isPage=',800,450,'设备校准周期添加');" class="cl_01">添加</a>
              
              
              
              			
              <a href="javascript:;" onClick="openWindow('adjustEdit.jsp?ZhengRi=1&editflag=1&devId=e11c8381ec0f436b992ba0e44dd33cb0&seqId=7313&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=',800,450,'设备校准周期添加');" class="cl_01">修改</a> 
              <a  onclick="return confirm('确认要删除吗？')" href="javascript:Pub.submitActionWithForm('Form1','delDeviceX.do?devId=e11c8381ec0f436b992ba0e44dd33cb0&seqId=7313&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=','F1')" class="cl_01">删除</a>              
              <a href="javascript:;" onClick="openWindow('adjustQuery.jsp?devId=e11c8381ec0f436b992ba0e44dd33cb0&seqId=7313',650,300,'设备校准历史记录');" class="cl_01">查看</a>
              
       </td>
      
           </tr>
              
					
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
              <td  align="center" width="5%">
				4</td>
			  <td  align="center">
			  
			  
              UPS789   
              
			   
			  
			  
			  </td>
              <td  align="center" >
				1月</td>
              <td align="center"  >
				2007-04-28</td>
				<td align="center"  >
				未校准




               
	           
				</td>
				<td align="center" width="11%"></td>
				<td align="center" style="HEIGHT: 22px">
				540</td>
		
		
              <td align="center" style="HEIGHT: 22px">
                 
              <a href="javascript:;" onClick="openWindow('adjustAdd.jsp?devId=c51da3d47c814b488d4a4206c7a1703f&seqId=0&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=&isPage=',800,450,'设备校准周期添加');" class="cl_01">添加</a>
              
              
              
                  修改 删除 查看           
              
              
       </td>
      
           </tr>
              
					
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
              <td  align="center" width="5%">
				5</td>
			  <td  align="center">
			  
			  
              UPS99999   
              
			   
			  
			  
			  </td>
              <td  align="center" >
				1月</td>
              <td align="center"  >
				2007-04-30</td>
				<td align="center"  >
				未校准




               
	           
				</td>
				<td align="center" width="11%"></td>
				<td align="center" style="HEIGHT: 22px">
				540</td>
		
		
              <td align="center" style="HEIGHT: 22px">
                 
              <a href="javascript:;" onClick="openWindow('adjustAdd.jsp?devId=8b788d86e15743af9d99871cd1a625b3&seqId=0&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=&isPage=',800,450,'设备校准周期添加');" class="cl_01">添加</a>
              
              
              
                  修改 删除 查看           
              
              
       </td>
      
           </tr>
              
					
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
              <td  align="center" width="5%">
				6</td>
			  <td  align="center">
			  
			  
			   
			  
              <a href="javascript:;" onClick="openWindow('adjustEdit.jsp?ZhengRi=0&devId=12a794ed3ae243ffa4dcad631ea756c9&seqId=7257&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=',800,450,'设备校准周期添加');" class="cl_01">
              UPSaaa</a>                
              
			  
			  </td>
              <td  align="center" >
				1月</td>
              <td align="center"  >
				2007-06-25</td>
				<td align="center"  >
				未校准




               
	           
				</td>
				<td align="center" width="11%">2007-06-30</td>
				<td align="center" style="HEIGHT: 22px">
				540</td>
		
		
              <td align="center" style="HEIGHT: 22px">
                 
              <a href="javascript:;" onClick="openWindow('adjustAdd.jsp?devId=12a794ed3ae243ffa4dcad631ea756c9&seqId=7257&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=&isPage=',800,450,'设备校准周期添加');" class="cl_01">添加</a>
              
              
              
              			
              <a href="javascript:;" onClick="openWindow('adjustEdit.jsp?ZhengRi=1&editflag=1&devId=12a794ed3ae243ffa4dcad631ea756c9&seqId=7257&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=',800,450,'设备校准周期添加');" class="cl_01">修改</a> 
              <a  onclick="return confirm('确认要删除吗？')" href="javascript:Pub.submitActionWithForm('Form1','delDeviceX.do?devId=12a794ed3ae243ffa4dcad631ea756c9&seqId=7257&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=','F1')" class="cl_01">删除</a>              
              <a href="javascript:;" onClick="openWindow('adjustQuery.jsp?devId=12a794ed3ae243ffa4dcad631ea756c9&seqId=7257',650,300,'设备校准历史记录');" class="cl_01">查看</a>
              
       </td>
      
           </tr>
              
					
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
              <td  align="center" width="5%">
				7</td>
			  <td  align="center">
			  
			  
			   
			  
              <a href="javascript:;" onClick="openWindow('adjustEdit.jsp?ZhengRi=0&devId=feb787e55063498286b265bcc3f2a80d&seqId=7292&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=',800,450,'设备校准周期添加');" class="cl_01">
              UPSbbb</a>                
              
			  
			  </td>
              <td  align="center" >
				1月</td>
              <td align="center"  >
				2007-04-28</td>
				<td align="center"  >
				未校准




               
	           
				</td>
				<td align="center" width="11%">2007-04-28</td>
				<td align="center" style="HEIGHT: 22px">
				540</td>
		
		
              <td align="center" style="HEIGHT: 22px">
                 
              <a href="javascript:;" onClick="openWindow('adjustAdd.jsp?devId=feb787e55063498286b265bcc3f2a80d&seqId=7292&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=&isPage=',800,450,'设备校准周期添加');" class="cl_01">添加</a>
              
              
              
              			
              <a href="javascript:;" onClick="openWindow('adjustEdit.jsp?ZhengRi=1&editflag=1&devId=feb787e55063498286b265bcc3f2a80d&seqId=7292&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=',800,450,'设备校准周期添加');" class="cl_01">修改</a> 
              <a  onclick="return confirm('确认要删除吗？')" href="javascript:Pub.submitActionWithForm('Form1','delDeviceX.do?devId=feb787e55063498286b265bcc3f2a80d&seqId=7292&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=','F1')" class="cl_01">删除</a>              
              <a href="javascript:;" onClick="openWindow('adjustQuery.jsp?devId=feb787e55063498286b265bcc3f2a80d&seqId=7292',650,300,'设备校准历史记录');" class="cl_01">查看</a>
              
       </td>
      
           </tr>
              
					
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
              <td  align="center" width="5%">
				8</td>
			  <td  align="center">
			  
			  
			   
			  
              <a href="javascript:;" onClick="openWindow('adjustEdit.jsp?ZhengRi=0&devId=3ab65799250542dd95bf6750e929818d&seqId=7311&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=',800,450,'设备校准周期添加');" class="cl_01">
              大头鬼</a>                
              
			  
			  </td>
              <td  align="center" >
				2年</td>
              <td align="center"  >
				2007-05-28</td>
				<td align="center"  >
				未校准




               
	           
				</td>
				<td align="center" width="11%">2007-06-20</td>
				<td align="center" style="HEIGHT: 22px">
				540</td>
		
		
              <td align="center" style="HEIGHT: 22px">
                 
              <a href="javascript:;" onClick="openWindow('adjustAdd.jsp?devId=3ab65799250542dd95bf6750e929818d&seqId=7311&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=&isPage=',800,450,'设备校准周期添加');" class="cl_01">添加</a>
              
              
              
              			
              <a href="javascript:;" onClick="openWindow('adjustEdit.jsp?ZhengRi=1&editflag=1&devId=3ab65799250542dd95bf6750e929818d&seqId=7311&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=',800,450,'设备校准周期添加');" class="cl_01">修改</a> 
              <a  onclick="return confirm('确认要删除吗？')" href="javascript:Pub.submitActionWithForm('Form1','delDeviceX.do?devId=3ab65799250542dd95bf6750e929818d&seqId=7311&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=','F1')" class="cl_01">删除</a>              
              <a href="javascript:;" onClick="openWindow('adjustQuery.jsp?devId=3ab65799250542dd95bf6750e929818d&seqId=7311',650,300,'设备校准历史记录');" class="cl_01">查看</a>
              
       </td>
      
           </tr>
              
					
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
              <td  align="center" width="5%">
				9</td>
			  <td  align="center">
			  
			  
              短波天线123-1   
              
			   
			  
			  
			  </td>
              <td  align="center" >
				1月</td>
              <td align="center"  >
				2007-04-28</td>
				<td align="center"  >
				未校准




               
	           
				</td>
				<td align="center" width="11%"></td>
				<td align="center" style="HEIGHT: 22px">
				540</td>
		
		
              <td align="center" style="HEIGHT: 22px">
                 
              <a href="javascript:;" onClick="openWindow('adjustAdd.jsp?devId=7ad11c5f9d9a47d9984c0e8bfc0bdb34&seqId=0&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=&isPage=',800,450,'设备校准周期添加');" class="cl_01">添加</a>
              
              
              
                  修改 删除 查看           
              
              
       </td>
      
           </tr>
              
					
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
              <td  align="center" width="5%">
				10</td>
			  <td  align="center">
			  
			  
              短波天线123-10   
              
			   
			  
			  
			  </td>
              <td  align="center" >
				1月</td>
              <td align="center"  >
				2007-04-19</td>
				<td align="center"  >
				未校准




               
	           
				</td>
				<td align="center" width="11%"></td>
				<td align="center" style="HEIGHT: 22px">
				540</td>
		
		
              <td align="center" style="HEIGHT: 22px">
                 
              <a href="javascript:;" onClick="openWindow('adjustAdd.jsp?devId=98d9d475173a4946926315946ea5273b&seqId=0&typeView=设备&pageNo=1&sumPage=4&lastRecordIndex=30&changeFlag=receive&direction=&isPage=',800,450,'设备校准周期添加');" class="cl_01">添加</a>
              
              
              
                  修改 删除 查看           
              
              
       </td>
      
           </tr>
              
				

              </table>
            </td>  
			</tr>
			
		  
			<tr>
			<td colspan="2" align="right">
			 <table border="0" width="100%" cellspacing="0" cellpadding="0">
        
           <tr>
             <td width="28%" align="left">总记录数：31条</td> 
             <td width="15%" align="right"></td>                 
             
             <td width="5%" align="center">首页&nbsp;&nbsp;|</td>
             <td width="7%" align="center">上一页&nbsp;&nbsp;&nbsp;|</td>
             
             
			 
             
             <td width="7%" align="center"><u><a href="javascript:jsNextX()">下一页&nbsp;&nbsp;&nbsp;|</a></u></td>
             <td width="5%" align="center"><u><a href="javascript:jsJumpToEndX()">末页</a></u></td>
             
             <td width="6%" align="center">第1页</td>
             <td width="6%" align="center">共4页</td>
             <td width="18%" align="right">至第<input  type="text" name="goPage"  size="3"  style="width:50px">页





             <u><a href="#" onClick="javascript:jsJumptoX()">确定</a></u></td>
             <td width="3%"></td> 
             <td></td> 
             <td></td>
             <td></td>
             <td></td> 
             <td></td>
             <td><input type="hidden" name="typeView" value="设备" >
				  <input type="hidden" name="direction" value="">
                  <input type="hidden" name="pageNo" value="1" >
                  
                   <input type="hidden" name="sumPage" value="4" > 
                   <input type="hidden" name="lastRecordIndex" value="30" >
                  <input type="hidden" name="changeFlag" value="receive" ></td> 
           </tr>
         </table>       				
		 </td>
		</tr>
		
				
	  </table>
	</form>
	</body>
</HTML>