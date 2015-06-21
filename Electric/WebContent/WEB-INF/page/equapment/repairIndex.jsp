


<%@ page language="java" pageEncoding="UTF-8"%>




<HTML>
	<HEAD>
		<title>设备检修周期</title>
		<LINK href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet">
		<script language="javascript" src="${pageContext.request.contextPath }/script/function.js"></script>
		<script language="javascript" src="${pageContext.request.contextPath }/script/pub.js"></script>
		<script language="javascript" src="${pageContext.request.contextPath }/script/calendar.js" charset="gb2312"></script>
		<script language="javascript" src="${pageContext.request.contextPath }/script/changePageBackUp.js" charset="gb2312"></script>
		<script>

function jsNextJ(){
      
     changeformvalue();
	 document.F1.direction.value="NEXT";
	 document.F1.goPage.value="";
	 Pub.submitActionWithForm('Form1','changePageDeviceJ.do','F1'); 
}

function jsPreviousJ(){

     changeformvalue();	
	 document.F1.direction.value="PREVIOUS";
	 document.F1.goPage.value="";
     Pub.submitActionWithForm('Form1','changePageDeviceJ.do','F1'); 

}

function jsJumptoJ(){

     changeformvalue();
	 var gopage=parseInt(document.F1.goPage.value);
	 var sumpage=parseInt(document.F1.sumPage.value);
	
	 if(gopage<=sumpage&&gopage>=1)
	 {	
	 	document.F1.pageNo.value=document.F1.goPage.value;
        Pub.submitActionWithForm('Form1','changePageDeviceJ.do','F1'); 
	 }
	 else{
	    alert("不存在此页，请重新输入页数"); 
	 }
}

function jsJumpToBeginJ(){

     changeformvalue();
	 document.F1.pageNo.value="1";
	 Pub.submitActionWithForm('Form1','changePageDeviceJ.do','F1'); 
}

function jsJumpToEndJ(){

    changeformvalue();
	document.F1.pageNo.value=document.Form1.sumPage.value;
    Pub.submitActionWithForm('Form1','changePageDeviceJ.do','F1'); 

}

 function  searchdeviceJ(){
     changeformvalue();
     Pub.submitActionWithForm('Form1','searchDeviceJ.do','F1');   
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
		<TBODY>
		<tr>
			<td class="ta_01" align="center" background="${pageContext.request.contextPath }/images/b-info.gif">
			&nbsp;<a href="adjustIndex.jsp" class="cl_01"><font face="宋体" size="2">校准管理</font></a> 
			|&nbsp;<a href="repairIndex.jsp" class="cl_01"><font face="宋体" size="2"><strong>检修管理</strong></font></a>
			</td>
		</tr>
	<TR height=10><td></td></TR>
  <tr>
  <td>					
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
       <tr> 
              <td width="103" class="ta_01" align="center" bgColor="#f5fafe" height="22">
									所属单位：</td>
									<td width="259" class="ta_01"  ><font face="宋体" color="red">
<font face="宋体" color="red">
<select name="jctId" id="jctId" class="bg">
					
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
											
				
				
					</select></font>
</font></td>
	<td width="98" class="ta_01" align="center" bgColor="#f5fafe" height="22">设备名称：</td>
	<td class="ta_01"  width="238">
	<input name="devName" type="text" id="devName" size="28" value=""></td>
</tr>
 <tr>
<td width="103" class="ta_01" align="center" bgColor="#f5fafe" height="22">检修状态：</td>
<td class="ta_01"  width="259"><font face="宋体" color="red">
	<select name="opstate" id="opstate" class="bg">
	<option value="" selected>全部</option>
	<option value="0">未检修</option>
	<option value="1">已检修</option>
</select></font></td> 
<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">检修日期：</td>
		<td class="ta_01"   width="238" >
					<input name="startDatef" type="text" id="startDatef"  value="" size="10" onclick="JavaScript:calendar(this)"> ~ 
					<input name="startDatet" type="text" id="startDatet" value="" size="10" onclick="JavaScript:calendar(this)">			  </td>					
       </tr>
        <tr>
                <td width="103" class="ta_01" align="center" bgcolor="#f5fafe" height="22">
					设备类型：</td>
					<td class="ta_01"  width="259">					
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
												广播机房设备
											</option>
											
				
				
					</select>
				</td>
                <td class="ta_01" align="center" bgcolor="#f5fafe" height="22"></td>
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
			<TD align="center" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width=25><img src="${pageContext.request.contextPath }/images/yin.gif" width="15"></TD>
			<TD class="DropShadow" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width=80>检修记录列表</TD>
			<td  align="right"  class="ta_01">
                <input type="button" name="BT_Search" value="查询" id="BT_Search" onclick="searchdeviceJ()" style="font-size:12px; color:black; height=20;width=50">
                 
                <input type="button" name="BT_ex" value="导出"  id="BT_ex"     onClick="openWindow('exportXJDevice.do?XorJ=J','600','400');" style="font-size:12px; color:black; height=20;width=50">              
                <input name="BT_Add" type="button" style="font-size:12px; color:black; height=20;width=80" id="BT_Add" onClick="openWindow('repairMoreAdd.jsp',800,450,'添加');" value="批量添加" />             
                <input type="button" name="BT_ex" value="导出设置"  id="BT_ex"  onClick="openWindow('repairExport.jsp?XorJ=J','600','400');" style="font-size:12px; color:black; height=20;width=80">
                
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
			  <td align="center" width="17%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">设备名称</td>
			  <td align="center" width="10%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">检修状态</td>
			  <td align="center" width="11%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">使用单位</td>
			  <td align="center" width="12%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">使用日期</td>
			  <td align="center" width="9%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">检修周期</td>
			  <td align="center" width="10%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">检修日期</td>
              <td align="center" width="9%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">所属单位</td>
              
              <td width="17%" align="center" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">检修记录维护</td>
              
            </tr>
        
	
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';"> 
             <td  align="center" >1</td>
			 <td  align="center" >
			 
			  
              
                        
              <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=0&devId=c51da3d47c814b488d4a4206c7a1703f&seqId=7235&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">
              UPS789</a>
              
              
			 </td>
			 <td  align="center" >
				未检修
	            
	        </td>
			 <td  align="center" ></td>
			 <td  align="center" >
				2007-04-28</td>
			 <td  align="center" >
              1月</td>
			<td align="center" >2007-06-30</td>
              <td align="center"   style="HEIGHT: 22px">
				540
			</td>
			
			
               <td align="center" >
               
               <a href="javascript:;" onClick="openWindow('repairAdd.jsp',800,450,'添加');" class="cl_01">添加</a>                      
               
               
              
              
               
               <a href="javascript:;" onClick="openWindow('repairEdit.jsp',800,450,'设备校准周期编辑');" class="cl_01">修改</a>
               
               <a href="javascript:Pub.submitActionWithForm('Form1','delDeviceJ.do?devId=c51da3d47c814b488d4a4206c7a1703f&seqId=7235&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=','F1')" onclick="return confirm('确认要删除吗？')" class="cl_01">删除</a>      
               <a href="javascript:;" onClick="openWindow('repairQuery.jsp?devId=c51da3d47c814b488d4a4206c7a1703f&seqId=7235',650,300,'设备检修历史记录');" class="cl_01">查看</a>
               
               </td>
             
              </tr>
                
	
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';"> 
             <td  align="center" >2</td>
			 <td  align="center" >
			 
			  
              
                        
              <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=0&devId=12a794ed3ae243ffa4dcad631ea756c9&seqId=7255&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">
              UPSaaa</a>
              
              
			 </td>
			 <td  align="center" >
				未检修
	            
	        </td>
			 <td  align="center" ></td>
			 <td  align="center" >
				2007-06-25</td>
			 <td  align="center" >
              5日</td>
			<td align="center" >2007-06-27</td>
              <td align="center"   style="HEIGHT: 22px">
				540
			</td>
			
			
               <td align="center" >
               
               <a href="javascript:;" onClick="openWindow('repairAdd.jsp?zr=1&devId=12a794ed3ae243ffa4dcad631ea756c9&seqId=7255&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=',800,450,'添加');" class="cl_01">添加</a>                      
               
               
              
              
               
               <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=1&devId=12a794ed3ae243ffa4dcad631ea756c9&seqId=7255&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">修改</a>
               
               <a href="javascript:Pub.submitActionWithForm('Form1','delDeviceJ.do?devId=12a794ed3ae243ffa4dcad631ea756c9&seqId=7255&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=','F1')" onclick="return confirm('确认要删除吗？')" class="cl_01">删除</a>      
               <a href="javascript:;" onClick="openWindow('repairQuery.jsp?devId=12a794ed3ae243ffa4dcad631ea756c9&seqId=7255',650,300,'设备检修历史记录');" class="cl_01">查看</a>
               
               </td>
             
              </tr>
                
	
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';"> 
             <td  align="center" >3</td>
			 <td  align="center" >
			 
			  
              
                        
              <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=0&devId=e11c8381ec0f436b992ba0e44dd33cb0&seqId=7262&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">
              UPS6666</a>
              
              
			 </td>
			 <td  align="center" >
				未检修
	            
	        </td>
			 <td  align="center" ></td>
			 <td  align="center" >
				2007-05-27</td>
			 <td  align="center" >
              1月</td>
			<td align="center" >2007-06-26</td>
              <td align="center"   style="HEIGHT: 22px">
				540
			</td>
			
			
               <td align="center" >
               
               <a href="javascript:;" onClick="openWindow('repairAdd.jsp?zr=1&devId=e11c8381ec0f436b992ba0e44dd33cb0&seqId=7262&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=',800,450,'添加');" class="cl_01">添加</a>                      
               
               
              
              
               
               <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=1&devId=e11c8381ec0f436b992ba0e44dd33cb0&seqId=7262&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">修改</a>
               
               <a href="javascript:Pub.submitActionWithForm('Form1','delDeviceJ.do?devId=e11c8381ec0f436b992ba0e44dd33cb0&seqId=7262&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=','F1')" onclick="return confirm('确认要删除吗？')" class="cl_01">删除</a>      
               <a href="javascript:;" onClick="openWindow('repairQuery.jsp?devId=e11c8381ec0f436b992ba0e44dd33cb0&seqId=7262',650,300,'设备检修历史记录');" class="cl_01">查看</a>
               
               </td>
             
              </tr>
                
	
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';"> 
             <td  align="center" >4</td>
			 <td  align="center" >
			 
			  
              
                        
              <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=0&devId=e4ee1fa474a2416a8ddd26f3f3436297&seqId=7271&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">
              短波天线123-11</a>
              
              
			 </td>
			 <td  align="center" >
				未检修
	            
	        </td>
			 <td  align="center" ></td>
			 <td  align="center" >
				2007-06-25</td>
			 <td  align="center" >
              1月</td>
			<td align="center" >2007-06-25</td>
              <td align="center"   style="HEIGHT: 22px">
				540
			</td>
			
			
               <td align="center" >
               
               <a href="javascript:;" onClick="openWindow('repairAdd.jsp?zr=1&devId=e4ee1fa474a2416a8ddd26f3f3436297&seqId=7271&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=',800,450,'添加');" class="cl_01">添加</a>                      
               
               
              
              
               
               <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=1&devId=e4ee1fa474a2416a8ddd26f3f3436297&seqId=7271&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">修改</a>
               
               <a href="javascript:Pub.submitActionWithForm('Form1','delDeviceJ.do?devId=e4ee1fa474a2416a8ddd26f3f3436297&seqId=7271&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=','F1')" onclick="return confirm('确认要删除吗？')" class="cl_01">删除</a>      
               <a href="javascript:;" onClick="openWindow('repairQuery.jsp?devId=e4ee1fa474a2416a8ddd26f3f3436297&seqId=7271',650,300,'设备检修历史记录');" class="cl_01">查看</a>
               
               </td>
             
              </tr>
                
	
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';"> 
             <td  align="center" >5</td>
			 <td  align="center" >
			 
			  
              
                        
              <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=0&devId=e2fa26276a2f499ea4144ace4ea2189a&seqId=7272&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">
              卫星接收天线11111</a>
              
              
			 </td>
			 <td  align="center" >
				未检修
	            
	        </td>
			 <td  align="center" >电视机房</td>
			 <td  align="center" >
				2007-06-25</td>
			 <td  align="center" >
              1月</td>
			<td align="center" >2007-06-25</td>
              <td align="center"   style="HEIGHT: 22px">
				540
			</td>
			
			
               <td align="center" >
               
               <a href="javascript:;" onClick="openWindow('repairAdd.jsp?zr=1&devId=e2fa26276a2f499ea4144ace4ea2189a&seqId=7272&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=',800,450,'添加');" class="cl_01">添加</a>                      
               
               
              
              
               
               <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=1&devId=e2fa26276a2f499ea4144ace4ea2189a&seqId=7272&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">修改</a>
               
               <a href="javascript:Pub.submitActionWithForm('Form1','delDeviceJ.do?devId=e2fa26276a2f499ea4144ace4ea2189a&seqId=7272&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=','F1')" onclick="return confirm('确认要删除吗？')" class="cl_01">删除</a>      
               <a href="javascript:;" onClick="openWindow('repairQuery.jsp?devId=e2fa26276a2f499ea4144ace4ea2189a&seqId=7272',650,300,'设备检修历史记录');" class="cl_01">查看</a>
               
               </td>
             
              </tr>
                
	
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';"> 
             <td  align="center" >6</td>
			 <td  align="center" >
			 
			  
              
                        
              <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=0&devId=3508c0c6598b495f96c948502a78414e&seqId=7253&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">
              蓄电池-1CESHI</a>
              
              
			 </td>
			 <td  align="center" >
				未检修
	            
	        </td>
			 <td  align="center" >海南监测台</td>
			 <td  align="center" >
				2007-05-27</td>
			 <td  align="center" >
              1月</td>
			<td align="center" >2007-05-28</td>
              <td align="center"   style="HEIGHT: 22px">
				560
			</td>
			
			
               <td align="center" >
               
               <a href="javascript:;" onClick="openWindow('repairAdd.jsp?zr=1&devId=3508c0c6598b495f96c948502a78414e&seqId=7253&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=',800,450,'添加');" class="cl_01">添加</a>                      
               
               
              
              
               
               <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=1&devId=3508c0c6598b495f96c948502a78414e&seqId=7253&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">修改</a>
               
               <a href="javascript:Pub.submitActionWithForm('Form1','delDeviceJ.do?devId=3508c0c6598b495f96c948502a78414e&seqId=7253&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=','F1')" onclick="return confirm('确认要删除吗？')" class="cl_01">删除</a>      
               <a href="javascript:;" onClick="openWindow('repairQuery.jsp?devId=3508c0c6598b495f96c948502a78414e&seqId=7253',650,300,'设备检修历史记录');" class="cl_01">查看</a>
               
               </td>
             
              </tr>
                
	
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';"> 
             <td  align="center" >7</td>
			 <td  align="center" >
			 
			  
              
                        
              <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=0&devId=d9cf7e522e8b4ff69fca4a32e8fd56f0&seqId=7266&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">
              高压开关柜-4123</a>
              
              
			 </td>
			 <td  align="center" >
				未检修
	            
	        </td>
			 <td  align="center" >海南监测台</td>
			 <td  align="center" >
				2007-04-28</td>
			 <td  align="center" >
              1月</td>
			<td align="center" >2007-05-28</td>
              <td align="center"   style="HEIGHT: 22px">
				560
			</td>
			
			
               <td align="center" >
               
               <a href="javascript:;" onClick="openWindow('repairAdd.jsp?zr=1&devId=d9cf7e522e8b4ff69fca4a32e8fd56f0&seqId=7266&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=',800,450,'添加');" class="cl_01">添加</a>                      
               
               
              
              
               
               <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=1&devId=d9cf7e522e8b4ff69fca4a32e8fd56f0&seqId=7266&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">修改</a>
               
               <a href="javascript:Pub.submitActionWithForm('Form1','delDeviceJ.do?devId=d9cf7e522e8b4ff69fca4a32e8fd56f0&seqId=7266&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=','F1')" onclick="return confirm('确认要删除吗？')" class="cl_01">删除</a>      
               <a href="javascript:;" onClick="openWindow('repairQuery.jsp?devId=d9cf7e522e8b4ff69fca4a32e8fd56f0&seqId=7266',650,300,'设备检修历史记录');" class="cl_01">查看</a>
               
               </td>
             
              </tr>
                
	
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';"> 
             <td  align="center" >8</td>
			 <td  align="center" >
			 
			  
              
                        
              <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=0&devId=feb787e55063498286b265bcc3f2a80d&seqId=7267&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">
              UPSbbb</a>
              
              
			 </td>
			 <td  align="center" >
				未检修
	            
	        </td>
			 <td  align="center" ></td>
			 <td  align="center" >
				2007-04-28</td>
			 <td  align="center" >
              1</td>
			<td align="center" >2007-04-28</td>
              <td align="center"   style="HEIGHT: 22px">
				540
			</td>
			
			
               <td align="center" >
               
               <a href="javascript:;" onClick="openWindow('repairAdd.jsp?zr=1&devId=feb787e55063498286b265bcc3f2a80d&seqId=7267&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=',800,450,'添加');" class="cl_01">添加</a>                      
               
               
              
              
               
               <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=1&devId=feb787e55063498286b265bcc3f2a80d&seqId=7267&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">修改</a>
               
               <a href="javascript:Pub.submitActionWithForm('Form1','delDeviceJ.do?devId=feb787e55063498286b265bcc3f2a80d&seqId=7267&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=','F1')" onclick="return confirm('确认要删除吗？')" class="cl_01">删除</a>      
               <a href="javascript:;" onClick="openWindow('repairQuery.jsp?devId=feb787e55063498286b265bcc3f2a80d&seqId=7267',650,300,'设备检修历史记录');" class="cl_01">查看</a>
               
               </td>
             
              </tr>
                
	
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';"> 
             <td  align="center" >9</td>
			 <td  align="center" >
			 
			  
              
                        
              <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=0&devId=7ad11c5f9d9a47d9984c0e8bfc0bdb34&seqId=7269&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">
              短波天线123-1</a>
              
              
			 </td>
			 <td  align="center" >
				未检修
	            
	        </td>
			 <td  align="center" ></td>
			 <td  align="center" >
				2007-04-28</td>
			 <td  align="center" >
              1月</td>
			<td align="center" >2007-04-28</td>
              <td align="center"   style="HEIGHT: 22px">
				540
			</td>
			
			
               <td align="center" >
               
               <a href="javascript:;" onClick="openWindow('repairAdd.jsp?zr=1&devId=7ad11c5f9d9a47d9984c0e8bfc0bdb34&seqId=7269&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=',800,450,'添加');" class="cl_01">添加</a>                      
               
               
              
              
               
               <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=1&devId=7ad11c5f9d9a47d9984c0e8bfc0bdb34&seqId=7269&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">修改</a>
               
               <a href="javascript:Pub.submitActionWithForm('Form1','delDeviceJ.do?devId=7ad11c5f9d9a47d9984c0e8bfc0bdb34&seqId=7269&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=','F1')" onclick="return confirm('确认要删除吗？')" class="cl_01">删除</a>      
               <a href="javascript:;" onClick="openWindow('repairQuery.jsp?devId=7ad11c5f9d9a47d9984c0e8bfc0bdb34&seqId=7269',650,300,'设备检修历史记录');" class="cl_01">查看</a>
               
               </td>
             
              </tr>
                
	
            <tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';"> 
             <td  align="center" >10</td>
			 <td  align="center" >
			 
			  
              
                        
              <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=0&devId=98d9d475173a4946926315946ea5273b&seqId=7270&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">
              短波天线123-10</a>
              
              
			 </td>
			 <td  align="center" >
				未检修
	            
	        </td>
			 <td  align="center" ></td>
			 <td  align="center" >
				2007-04-19</td>
			 <td  align="center" >
              1月</td>
			<td align="center" >2007-04-19</td>
              <td align="center"   style="HEIGHT: 22px">
				540
			</td>
			
			
               <td align="center" >
               
               <a href="javascript:;" onClick="openWindow('repairAdd.jsp?zr=1&devId=98d9d475173a4946926315946ea5273b&seqId=7270&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=',800,450,'添加');" class="cl_01">添加</a>                      
               
               
              
              
               
               <a href="javascript:;" onClick="openWindow('repairEdit.jsp?zr=1&devId=98d9d475173a4946926315946ea5273b&seqId=7270&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=&isPage=no',800,450,'设备校准周期编辑');" class="cl_01">修改</a>
               
               <a href="javascript:Pub.submitActionWithForm('Form1','delDeviceJ.do?devId=98d9d475173a4946926315946ea5273b&seqId=7270&typeView=设备&pageNo=1&sumPage=3&lastRecordIndex=26&changeFlag=receive&direction=','F1')" onclick="return confirm('确认要删除吗？')" class="cl_01">删除</a>      
               <a href="javascript:;" onClick="openWindow('repairQuery.jsp?devId=98d9d475173a4946926315946ea5273b&seqId=7270',650,300,'设备检修历史记录');" class="cl_01">查看</a>
               
               </td>
             
              </tr>
                
				
				
            </table>
        </td>
	</tr>
					
					
	
		<tr>
			<td colspan="2" align="right">
			 <table border="0" width="100%" cellspacing="0" cellpadding="0">
        
           <tr>
             <td width="28%" align="left">总记录数：27条</td> 
             <td width="15%" align="right"></td>                 
             
             <td width="5%" align="center">首页&nbsp;&nbsp;|</td>
             <td width="7%" align="center">上一页&nbsp;&nbsp;&nbsp;|</td>
             
             
			 
             
             <td width="7%" align="center"><u><a href="javascript:jsNextJ()">下一页&nbsp;&nbsp;&nbsp;|</a></u></td>
             <td width="5%" align="center"><u><a href="javascript:jsJumpToEndJ()">末页</a></u></td>
             
             <td width="6%" align="center">第1页</td>
             <td width="6%" align="center">共3页</td>
             <td width="18%" align="right">至第<input  type="text" name="goPage"  size="3"  style="width:50px">页






             <u><a href="#" onClick="javascript:jsJumptoJ()">确定</a></u></td>
             <td width="3%"></td> 
             <td></td> 
             <td></td>
             <td></td>
             <td></td> 
             <td></td>
             <td><input type="hidden" name="typeView" value="设备" >
				  <input type="hidden" name="direction" value="">
                  <input type="hidden" name="pageNo" value="1" >               
                   <input type="hidden" name="sumPage" value="3" > 
                   <input type="hidden" name="lastRecordIndex" value="26" >
                  <input type="hidden" name="changeFlag" value="receive" ></td> 
           </tr>
         </table>       				
		</td>
	  </tr>
	
	</table>
		</form>
	</body>
</HTML>