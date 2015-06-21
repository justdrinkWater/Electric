

<%@ page language="java" pageEncoding="UTF-8"%>




<html>

	<head>
		<title>设备购置计划</title>
		<link href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet" />
		<script language="javascript" src="${pageContext.request.contextPath }/script/function.js"></script>
		<script language="javascript" src="${pageContext.request.contextPath }/script/pub.js"></script>
		<script language="javascript" src="${pageContext.request.contextPath }/script/calendar.js" charset="gb2312"></script>
		
<script language="javascript">

function CheckOthers(form)
{
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
			if (e.checked==false)
			{
				e.checked = true;// form.chkall.checked;
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
	for (var i=0;i<form.elements.length;i++)
	{
		var e = form.elements[i];
			e.checked = true// form.chkall.checked;
	}
}


  function jsNext(){
     
     changeformvalue();
	 document.F1.direction.value="NEXT";
	 document.F1.goPage.value=""; 
	 Pub.submitActionWithForm('Form1','changePage.do','F1');     

  }
  function jsPrevious(){

     changeformvalue();
	 document.F1.direction.value="PREVIOUS";
	 document.F1.goPage.value="";
     Pub.submitActionWithForm('Form1','changePage.do','F1');     
  }	
  
  function jsJumpToBegin(){
     changeformvalue();
	 document.F1.pageNo.value="1";
	 Pub.submitActionWithForm('Form1','changePage.do','F1');     
 }

  function jsJumpToEnd(){
    changeformvalue();
	document.F1.pageNo.value=document.Form1.sumPage.value;
    Pub.submitActionWithForm('Form1','changePage.do','F1');     
  }
  
  function jsJumpto(){
  
     changeformvalue();
	 var gopage=parseInt(document.F1.goPage.value);
	 var sumpage=parseInt(document.F1.sumPage.value);
	
	 if(gopage<=sumpage&&gopage>=1)
	 {	 	
	 	document.F1.pageNo.value=document.F1.goPage.value;
        Pub.submitActionWithForm('Form1','changePage.do','F1');   
	 }
	 else{
	    alert("不存在此页，请重新输入页数"); 
	 }
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

  function  searchplan(){
     changeformvalue();
     Pub.submitActionWithForm('Form1','searchDevicePlan.do','F1');   

  }
  
  function jsPlanNext(){

     changeformvalue();  
	 document.F1.direction.value="";
	 document.F1.goPage.value="";
	 Pub.submitActionWithForm('Form1','devicePlanNextDate.do','F1');   
  }
  
  
  function jsDPToD(){
  
     changeformvalue();
	 document.F1.direction.value="";
	 document.F1.goPage.value="";
	 
	 var devplan=document.Form1.devPlanId;
	 var devplanid="";
	 var flag=0;
	
	 if(typeof(devplan)=="undefined"){ 
	    return;
	 }
	 
	 if(typeof(devplan.length)!="undefined"){   //多个
	 
	     for(var i=0;i<devplan.length;i++){
	         if(devplan[i].checked==true){
	            
	            devplanid+=devplan[i].value+",";  
	            flag=1;       
	         }     
	     }
	 }else{                                  //只有一个


	    if(devplan.checked==true){
	            
	            devplanid+=devplan.value+",";  
	            flag=1;       
	     }       	
	 }
	  
	 document.F1.plantodev.value=devplanid;
	 
	 if(flag==1){
	   Pub.submitActionWithForm('Form1','devicePlanToDevice.do','F1');
	 }	 
  }
  
  
  function savewithopener(path){
     
     changeformvalue();
     document.F1.pageNo.value="1";
	 document.F1.direction.value="";
	 document.F1.goPage.value=document.F1.pageNo.value;
	 Pub.submitActionWithForm('Form1',path,'F1');  
 }
 
</script>

	</head>
	<body>
		<table cellspacing="1" cellpadding="0" width="90%" align="center" bgcolor="#f5fafe" border="0">
		
			    <tr>
			      <td class="ta_01" align="center" background="${pageContext.request.contextPath }/images/b-info.gif">
			       <font face="宋体" size="2"><strong>设备购置计划</strong></font>
			     </td>
		        </tr>
		        <TR height=10><td></td></TR>
				<tr>
					<td>
<form name="F1" method="post"  id="F1" style="margin:0px;">
					
				    <input type="hidden" name="typeView" value="" >
				    <input type="hidden" name="direction" value="">
                    <input type="hidden" name="pageNo" value="" >
                    <input type="hidden" name="sumPage" value="" > 
                    <input type="hidden" name="lastRecordIndex" value="" >
                    <input type="hidden" name="changeFlag" value="" >
                    <input type="hidden" name="goPage" value="" >
                    <input type="hidden" name="plantodev" value="" >
                  
						<table cellpadding="0" cellspacing="0" border="0" width="100%">
							<tr>
								<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">所属单位：</td>
								<td class="ta_01" >		
									<select name="jctId" id="jctId" style="width:200px">
									
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
											
				                  
				                  
												
					             </select>
								</td>
								<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">设备名称：</td>
								<td class="ta_01" >
									<input name="devName" type="text" id="devName"  size="22" value="" />
								</td>
							</tr>
							<tr>
								<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">计划时间：</td>
								<td class="ta_01" width="300" >
									<input name="planDatef" type="text" id="planDatef" size="10" value=""  onclick="JavaScript:calendar(this)">
									~
									<input name="planDatet" type="text" id="planDatet" size="10" value="" onclick="JavaScript:calendar(this)">
								</td>

				<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">设备类型：</td>
								<td class="ta_01"  width="247">
									
									<select name="devType" id="devType" style="width:168px">					
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
											
				                   
				                   
										</select> 
								</td>
					</tr>		
		</table>
</form>
							
<br>							
<form name="Form1" id="Form1" style="margin:0px;">
  
  <table cellpadding="0" cellspacing="0" border="0" width="100%" bgcolor="#f5fafe">	        
	 <TR>
		<TD align="center" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width="25"><img src="${pageContext.request.contextPath }/images/yin.gif" width="15"></TD>
			<TD class="DropShadow" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width="100">设备计划信息列表</TD>										
			<td>
			   	
			    	
			     &nbsp;&nbsp;<input type="button" height=20 style="font-size:12px; color:black; height=20;width=50" name="chkall" value="全选" onClick="CheckAll(this.form)">
			     <input type="button" height=20 style="font-size:12px; color:black; height=20;width=50"  name="chkOthers" value="取消" onClick="CheckOthers(this.form)">
				 
				 	
			</td>
			<td class="ta_01" align="right"  >
			    <input name="BT_Search" type="button" style="font-size:12px; color:black; height=20;width=50" id="BT_Search" value="查询"  onclick="searchplan()"/>
					
				<input name="BT_Add" type="button" style="font-size:12px; color:black; height=20;width=50" id="BT_Add" onClick="openWindow('planAdd.jsp',800,450);" value="添加" />
				<input name="BT_import" type="button" style="font-size:12px; color:black; height=20;width=50" id="BT_import" onClick="openWindow('planImport.jsp','600','450');" value="导入">
				
			    
					
				<input type="button" name="chkall" height=20 style="font-size:12px; color:black; height=20;width=50"  value="购置" onclick="jsDPToD()">
				<input type="button" name="chkall2" height=20 style="font-size:12px; color:black; height=20;width=80"  value="计划顺延" onclick="jsPlanNext()">	
				
				
			</td>
	</TR>		
  </table>		
  	
  <table cellpadding="0" cellspacing="0" border="0" width="100%" bgcolor="#f5fafe">			
		<tr>
					<td class="ta_01" align="center" bgcolor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT:gray 1px solid; BORDER-TOP:gray 1px solid; BORDER-LEFT:gray 1px solid; WIDTH:100%; WORD-BREAK:break-all; BORDER-BOTTOM:gray 1px solid; BORDER-COLLAPSE:collapse; BACKGROUND-COLOR:#f5fafe; WORD-WRAP:break-word">
							<tr style="FONT-WEIGHT:bold;FONT-SIZE:12pt;HEIGHT:25px;BACKGROUND-COLOR:#afd1f3">
								<td align="center" width="5%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">序号</td>
								<td align="center" width="22%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">名称</td>
								<td align="center" width="9%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">数量</td>
								<td align="center" width="9%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">金额</td>
								<td align="center" width="14%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">规格型号</td>
								<td align="center" width="9%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">用途</td>
								<td align="center" width="11%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">使用单位</td>
									
								<td width="9%" align="center" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">是否购置</td>
								
								
								<td width="5%" align="center" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">编辑</td>
								<td width="5%" align="center" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">删除</td>
								
							</tr>
							
					
							<tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR:hand; HEIGHT:22px" align="center" width="5%">
									1</td>
								<td align="center"  width="22%">
									<a href="javascript:;" onClick="openWindow('planView.jsp?editflag=0&devPlanId=5cb793a299f64ae9a17953749715121d&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450,'设备详细信息');" class="cl_01">GPS系统</a></td>
								<td align="center"  width="9%">1</td>
								<td align="center"  width="9%">	1.00</td>
								<td align="center"  width="14%">
									</td>
								<td align="center"  width="9%">
									</td>
								<td align="center"  width="11%" style="HEIGHT: 22px">
									电视机房</td>
							    	
								<td align="center" >
									<input type="checkbox" id="devPlanId"  name="devPlanId" value="5cb793a299f64ae9a17953749715121d" />
								</td>
								
								
								<td align="center">
										<a href="javascript:;"
											onClick="openWindow('planEdit.jsp?editflag=1&devPlanId=5cb793a299f64ae9a17953749715121d&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450);">
											<IMG src="${pageContext.request.contextPath }/images/edit.gif" style="CURSOR: hand" border="0" ></a>
							    </td>
								<td align="center" >
										<a href="javascript:Pub.submitActionWithForm('Form1','delDevicePlan.do?editflag=1&devPlanId=5cb793a299f64ae9a17953749715121d&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=','F1')"
											onclick="return confirm('确认要删除？')"> <IMG src="${pageContext.request.contextPath }/images/delete.gif" style="CURSOR: hand"  border="0"></a>
								</td>
								
							</tr>
				
							<tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR:hand; HEIGHT:22px" align="center" width="5%">
									2</td>
								<td align="center"  width="22%">
									<a href="javascript:;" onClick="openWindow('planView.jsp?editflag=0&devPlanId=5e0a7de7e02f4aba839112d1b1f85882&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450,'设备详细信息');" class="cl_01">TV监视器</a></td>
								<td align="center"  width="9%">1</td>
								<td align="center"  width="9%">	1.00</td>
								<td align="center"  width="14%">
									JVC</td>
								<td align="center"  width="9%">
									</td>
								<td align="center"  width="11%" style="HEIGHT: 22px">
									电视机房</td>
							    	
								<td align="center" >
									<input type="checkbox" id="devPlanId"  name="devPlanId" value="5e0a7de7e02f4aba839112d1b1f85882" />
								</td>
								
								
								<td align="center">
										<a href="javascript:;"
											onClick="openWindow('planEdit.jsp?editflag=1&devPlanId=5e0a7de7e02f4aba839112d1b1f85882&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450);">
											<IMG src="${pageContext.request.contextPath }/images/edit.gif" style="CURSOR: hand" border="0" ></a>
							    </td>
								<td align="center" >
										<a href="javascript:Pub.submitActionWithForm('Form1','delDevicePlan.do?editflag=1&devPlanId=5e0a7de7e02f4aba839112d1b1f85882&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=','F1')"
											onclick="return confirm('确认要删除？')"> <IMG src="${pageContext.request.contextPath }/images/delete.gif" style="CURSOR: hand"  border="0"></a>
								</td>
								
							</tr>
				
							<tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR:hand; HEIGHT:22px" align="center" width="5%">
									3</td>
								<td align="center"  width="22%">
									<a href="javascript:;" onClick="openWindow('planView.jsp?editflag=0&devPlanId=50bda830cbef453ab6e83f837359fc74&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450,'设备详细信息');" class="cl_01">偶极子天线</a></td>
								<td align="center"  width="9%">1</td>
								<td align="center"  width="9%">	1.00</td>
								<td align="center"  width="14%">
									</td>
								<td align="center"  width="9%">
									</td>
								<td align="center"  width="11%" style="HEIGHT: 22px">
									电视机房</td>
							    	
								<td align="center" >
									<input type="checkbox" id="devPlanId"  name="devPlanId" value="50bda830cbef453ab6e83f837359fc74" />
								</td>
								
								
								<td align="center">
										<a href="javascript:;"
											onClick="openWindow('planEdit.jsp?editflag=1&devPlanId=50bda830cbef453ab6e83f837359fc74&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450);">
											<IMG src="${pageContext.request.contextPath }/images/edit.gif" style="CURSOR: hand" border="0" ></a>
							    </td>
								<td align="center" >
										<a href="javascript:Pub.submitActionWithForm('Form1','delDevicePlan.do?editflag=1&devPlanId=50bda830cbef453ab6e83f837359fc74&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=','F1')"
											onclick="return confirm('确认要删除？')"> <IMG src="${pageContext.request.contextPath }/images/delete.gif" style="CURSOR: hand"  border="0"></a>
								</td>
								
							</tr>
				
							<tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR:hand; HEIGHT:22px" align="center" width="5%">
									4</td>
								<td align="center"  width="22%">
									<a href="javascript:;" onClick="openWindow('planView.jsp?editflag=0&devPlanId=526db134dad94b1b82aea78f4e68fea7&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450,'设备详细信息');" class="cl_01">AM/FM接收机</a></td>
								<td align="center"  width="9%">1</td>
								<td align="center"  width="9%">	1.00</td>
								<td align="center"  width="14%">
									SONY</td>
								<td align="center"  width="9%">
									</td>
								<td align="center"  width="11%" style="HEIGHT: 22px">
									电视机房</td>
							    	
								<td align="center" >
									<input type="checkbox" id="devPlanId"  name="devPlanId" value="526db134dad94b1b82aea78f4e68fea7" />
								</td>
								
								
								<td align="center">
										<a href="javascript:;"
											onClick="openWindow('planEdit.jsp?editflag=1&devPlanId=526db134dad94b1b82aea78f4e68fea7&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450);">
											<IMG src="${pageContext.request.contextPath }/images/edit.gif" style="CURSOR: hand" border="0" ></a>
							    </td>
								<td align="center" >
										<a href="javascript:Pub.submitActionWithForm('Form1','delDevicePlan.do?editflag=1&devPlanId=526db134dad94b1b82aea78f4e68fea7&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=','F1')"
											onclick="return confirm('确认要删除？')"> <IMG src="${pageContext.request.contextPath }/images/delete.gif" style="CURSOR: hand"  border="0"></a>
								</td>
								
							</tr>
				
							<tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR:hand; HEIGHT:22px" align="center" width="5%">
									5</td>
								<td align="center"  width="22%">
									<a href="javascript:;" onClick="openWindow('planView.jsp?editflag=0&devPlanId=5759cd69ea374523bb20721824c23511&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450,'设备详细信息');" class="cl_01">偶极子天线</a></td>
								<td align="center"  width="9%">1</td>
								<td align="center"  width="9%">	1.00</td>
								<td align="center"  width="14%">
									</td>
								<td align="center"  width="9%">
									</td>
								<td align="center"  width="11%" style="HEIGHT: 22px">
									电视机房</td>
							    	
								<td align="center" >
									<input type="checkbox" id="devPlanId"  name="devPlanId" value="5759cd69ea374523bb20721824c23511" />
								</td>
								
								
								<td align="center">
										<a href="javascript:;"
											onClick="openWindow('planEdit.jsp?editflag=1&devPlanId=5759cd69ea374523bb20721824c23511&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450);">
											<IMG src="${pageContext.request.contextPath }/images/edit.gif" style="CURSOR: hand" border="0" ></a>
							    </td>
								<td align="center" >
										<a href="javascript:Pub.submitActionWithForm('Form1','delDevicePlan.do?editflag=1&devPlanId=5759cd69ea374523bb20721824c23511&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=','F1')"
											onclick="return confirm('确认要删除？')"> <IMG src="${pageContext.request.contextPath }/images/delete.gif" style="CURSOR: hand"  border="0"></a>
								</td>
								
							</tr>
				
							<tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR:hand; HEIGHT:22px" align="center" width="5%">
									6</td>
								<td align="center"  width="22%">
									<a href="javascript:;" onClick="openWindow('planView.jsp?editflag=0&devPlanId=63f8ebccbd0640bc9974bd4e417a2abb&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450,'设备详细信息');" class="cl_01">GPS系统</a></td>
								<td align="center"  width="9%">1</td>
								<td align="center"  width="9%">	1.00</td>
								<td align="center"  width="14%">
									</td>
								<td align="center"  width="9%">
									</td>
								<td align="center"  width="11%" style="HEIGHT: 22px">
									电视机房</td>
							    	
								<td align="center" >
									<input type="checkbox" id="devPlanId"  name="devPlanId" value="63f8ebccbd0640bc9974bd4e417a2abb" />
								</td>
								
								
								<td align="center">
										<a href="javascript:;"
											onClick="openWindow('planEdit.jsp?editflag=1&devPlanId=63f8ebccbd0640bc9974bd4e417a2abb&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450);">
											<IMG src="${pageContext.request.contextPath }/images/edit.gif" style="CURSOR: hand" border="0" ></a>
							    </td>
								<td align="center" >
										<a href="javascript:Pub.submitActionWithForm('Form1','delDevicePlan.do?editflag=1&devPlanId=63f8ebccbd0640bc9974bd4e417a2abb&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=','F1')"
											onclick="return confirm('确认要删除？')"> <IMG src="${pageContext.request.contextPath }/images/delete.gif" style="CURSOR: hand"  border="0"></a>
								</td>
								
							</tr>
				
							<tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR:hand; HEIGHT:22px" align="center" width="5%">
									7</td>
								<td align="center"  width="22%">
									<a href="javascript:;" onClick="openWindow('planView.jsp?editflag=0&devPlanId=777696ae248e4a63a3bf265f39a533a3&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450,'设备详细信息');" class="cl_01">视频分析仪</a></td>
								<td align="center"  width="9%">1</td>
								<td align="center"  width="9%">	1.00</td>
								<td align="center"  width="14%">
									VSA</td>
								<td align="center"  width="9%">
									</td>
								<td align="center"  width="11%" style="HEIGHT: 22px">
									电视机房</td>
							    	
								<td align="center" >
									<input type="checkbox" id="devPlanId"  name="devPlanId" value="777696ae248e4a63a3bf265f39a533a3" />
								</td>
								
								
								<td align="center">
										<a href="javascript:;"
											onClick="openWindow('planEdit.jsp?editflag=1&devPlanId=777696ae248e4a63a3bf265f39a533a3&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450);">
											<IMG src="${pageContext.request.contextPath }/images/edit.gif" style="CURSOR: hand" border="0" ></a>
							    </td>
								<td align="center" >
										<a href="javascript:Pub.submitActionWithForm('Form1','delDevicePlan.do?editflag=1&devPlanId=777696ae248e4a63a3bf265f39a533a3&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=','F1')"
											onclick="return confirm('确认要删除？')"> <IMG src="${pageContext.request.contextPath }/images/delete.gif" style="CURSOR: hand"  border="0"></a>
								</td>
								
							</tr>
				
							<tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR:hand; HEIGHT:22px" align="center" width="5%">
									8</td>
								<td align="center"  width="22%">
									<a href="javascript:;" onClick="openWindow('planView.jsp?editflag=0&devPlanId=4e89c2b0a0114ebdb0c8d7155f5fd482&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450,'设备详细信息');" class="cl_01">有源杆状天线</a></td>
								<td align="center"  width="9%">1</td>
								<td align="center"  width="9%">	1.00</td>
								<td align="center"  width="14%">
									HFHZ-Z1</td>
								<td align="center"  width="9%">
									</td>
								<td align="center"  width="11%" style="HEIGHT: 22px">
									电视机房</td>
							    	
								<td align="center" >
									<input type="checkbox" id="devPlanId"  name="devPlanId" value="4e89c2b0a0114ebdb0c8d7155f5fd482" />
								</td>
								
								
								<td align="center">
										<a href="javascript:;"
											onClick="openWindow('planEdit.jsp?editflag=1&devPlanId=4e89c2b0a0114ebdb0c8d7155f5fd482&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450);">
											<IMG src="${pageContext.request.contextPath }/images/edit.gif" style="CURSOR: hand" border="0" ></a>
							    </td>
								<td align="center" >
										<a href="javascript:Pub.submitActionWithForm('Form1','delDevicePlan.do?editflag=1&devPlanId=4e89c2b0a0114ebdb0c8d7155f5fd482&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=','F1')"
											onclick="return confirm('确认要删除？')"> <IMG src="${pageContext.request.contextPath }/images/delete.gif" style="CURSOR: hand"  border="0"></a>
								</td>
								
							</tr>
				
							<tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR:hand; HEIGHT:22px" align="center" width="5%">
									9</td>
								<td align="center"  width="22%">
									<a href="javascript:;" onClick="openWindow('planView.jsp?editflag=0&devPlanId=327d2dc84c7f49da8c4d1c248bb840a0&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450,'设备详细信息');" class="cl_01">计算机</a></td>
								<td align="center"  width="9%">1</td>
								<td align="center"  width="9%">	1.00</td>
								<td align="center"  width="14%">
									IBM79A</td>
								<td align="center"  width="9%">
									</td>
								<td align="center"  width="11%" style="HEIGHT: 22px">
									电视机房</td>
							    	
								<td align="center" >
									<input type="checkbox" id="devPlanId"  name="devPlanId" value="327d2dc84c7f49da8c4d1c248bb840a0" />
								</td>
								
								
								<td align="center">
										<a href="javascript:;"
											onClick="openWindow('planEdit.jsp?editflag=1&devPlanId=327d2dc84c7f49da8c4d1c248bb840a0&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450);">
											<IMG src="${pageContext.request.contextPath }/images/edit.gif" style="CURSOR: hand" border="0" ></a>
							    </td>
								<td align="center" >
										<a href="javascript:Pub.submitActionWithForm('Form1','delDevicePlan.do?editflag=1&devPlanId=327d2dc84c7f49da8c4d1c248bb840a0&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=','F1')"
											onclick="return confirm('确认要删除？')"> <IMG src="${pageContext.request.contextPath }/images/delete.gif" style="CURSOR: hand"  border="0"></a>
								</td>
								
							</tr>
				
							<tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
								<td style="CURSOR:hand; HEIGHT:22px" align="center" width="5%">
									10</td>
								<td align="center"  width="22%">
									<a href="javascript:;" onClick="openWindow('planView.jsp?editflag=0&devPlanId=359ce0278095406192b93245d47fa765&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450,'设备详细信息');" class="cl_01">面包车</a></td>
								<td align="center"  width="9%">1</td>
								<td align="center"  width="9%">	1.00</td>
								<td align="center"  width="14%">
									Tue Oct 01 08:00:00 CST 1940</td>
								<td align="center"  width="9%">
									</td>
								<td align="center"  width="11%" style="HEIGHT: 22px">
									电视机房</td>
							    	
								<td align="center" >
									<input type="checkbox" id="devPlanId"  name="devPlanId" value="359ce0278095406192b93245d47fa765" />
								</td>
								
								
								<td align="center">
										<a href="javascript:;"
											onClick="openWindow('planEdit.jsp?editflag=1&devPlanId=359ce0278095406192b93245d47fa765&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=',800,450);">
											<IMG src="${pageContext.request.contextPath }/images/edit.gif" style="CURSOR: hand" border="0" ></a>
							    </td>
								<td align="center" >
										<a href="javascript:Pub.submitActionWithForm('Form1','delDevicePlan.do?editflag=1&devPlanId=359ce0278095406192b93245d47fa765&typeView=设备购置计划查询&pageNo=1&sumPage=37&lastRecordIndex=369&changeFlag=receive&direction=','F1')"
											onclick="return confirm('确认要删除？')"> <IMG src="${pageContext.request.contextPath }/images/delete.gif" style="CURSOR: hand"  border="0"></a>
								</td>
								
							</tr>
				
				
			
		</table>
	</td>
  </tr>			
					
	
		<tr>
			<td colspan="2" align="right">
			 <table border="0" width="100%" cellspacing="0" cellpadding="0">
        
           <tr>
             <td width="28%" align="left">总记录数：370条</td> 
             <td width="15%" align="right"></td>                 
             
             <td width="5%" align="center">首页&nbsp;&nbsp;|</td>
             <td width="7%" align="center">上一页&nbsp;&nbsp;&nbsp;|</td>
             
             
			 
             
             <td width="7%" align="center"><u><a href="javascript:jsNext()">下一页&nbsp;&nbsp;&nbsp;|</a></u></td>
             <td width="5%" align="center"><u><a href="javascript:jsJumpToEnd()">末页</a></u></td>
             
             <td width="6%" align="center">第1页</td>
             <td width="6%" align="center">共37页</td>
             <td width="18%" align="right">至第<input size="1" type="text" name="goPage"  size="3"  style="width:50px">页



             <u><a href="#" onClick="javascript:jsJumpto()">确定</a></u></td>
             <td width="3%"></td> 
             <td></td> 
             <td></td>
             <td></td>
             <td></td> 
             <td></td>
             <td> <input type="hidden" name="typeView" value="设备购置计划查询" >
				  <input type="hidden" name="direction" value="">
                  <input type="hidden" name="pageNo" value="1" >
                   <input type="hidden" name="sumPage" value="37" > 
                   <input type="hidden" name="lastRecordIndex" value="369" >
                  <input type="hidden" name="changeFlag" value="receive" ></td> 
           		</tr>
	         </table>       				
						</td>
			</tr>								
			</table>
			
		</form>
	</body>

</html>
