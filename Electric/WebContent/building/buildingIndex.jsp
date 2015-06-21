


<%@ page language="java" pageEncoding="UTF-8"%>


<html>

<head>
<title>监测台建筑管理</title>

<link href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet">
<script language="javascript" src="${pageContext.request.contextPath }/script/function.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/script/pub.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/script/validate.js"></script>
<script language="javascript" src="${pageContext.request.contextPath }/script/changePageBackUp.js" charset="gb2312"></script>
<script language="javascript">

  	function  gotopage(path,where){
       
     var page=document.Form2.pageNO;
     
     document.Form1.addnewflag.value=0;    //不一定是去最后一页



     
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
     
     //新增站点时，应去最后一页，在此做标记



     if(where=="addNewJctBuilds"){
       document.Form1.addnewflag.value=0;
     }
     
      document.Form1.ifnewquery.value="0";
      document.Form1.pageNO.value=document.Form2.pageNO.value;
      document.Form1.querysql.value=document.Form2.querysql.value; 
      document.Form1.pageSize.value=document.Form2.pageSize.value;
     
      Pub.submitActionWithForm('Form2',path,'Form1'); 
           
  }
  
   function gotoquery(path){
    
    if(Trim(document.Form1.buildArea.value)!=""){
        if(!checkNumber(document.Form1.buildArea))
		{
			alert("建筑面积请输入数字");
			document.Form1.buildArea.focus();
			return false;
		}
    }
    document.Form1.ifnewquery.value="1";  //新的查询应去第一页 ，用新的查询条件，标志给业务处理类用
    document.Form1.addnewflag.value=0;    //不去最后一页，标志给pageInfo类用
    document.Form1.pageNO.value=1;
    document.Form1.pageSize.value==10;
    Pub.submitActionWithForm('Form2',path,'Form1'); 
     
  }
  
 function exeportExcel(){
   
      var path="exportExcel.do?querysql="+document.Form2.querysql.value;  
      openWindow(path,'600','400');
 }
</script>
</head>

<body>

<form name="Form1"  id="Form1" style="margin:0px;"> 
	<table cellspacing="1" cellpadding="0" width="90%" align="center" bgcolor="#f5fafe" border="0">
		<tr>
			<td class="ta_01" align="center" background="${pageContext.request.contextPath }/images/b-info.gif">
			<font face="宋体" size="2"><strong>监测台建筑管理</strong></font>
			</td>
		</tr>
		<TR height=10><td></td></TR>
		<tr>
			<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				
				<tr>
					<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">
					所属单位：</td>
					<td class="ta_01" >
						<select name="jct" id="jct" style="width:160px" >
						
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
								
						</select>
					</td>
					<input type="hidden" name="initflag"   value="0">
					<input type="hidden" name="addnewflag" value="0">
					<input type="hidden" name="pageNO"     value="" >                
                    <input type="hidden" name="querysql"   value="" >                 
                    <input type="hidden" name="pageSize"   value="" >
                    <input type="hidden" name="ifnewquery"  >
					<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">
					建筑名称：</td>
					<td class="ta_01" >
					<input name="buildName" type="text" id="buildName"  size="21"><font face="宋体" color="red">
					</font></td>
		</tr>
		<tr>
				  <td class="ta_01" align="center" bgcolor="#f5fafe" height="22">
					建筑类型：</td>
					<td class="ta_01" >
					 <font face="宋体" color="red"> 
					  <select name ="buildType" id="buildType" style="WIDTH: 160px">
					   <option value="0">全部</OPTION>
					   
						  <option value="1">基建</option>	
					   
						  <option value="2">基改</option>	
					   
						  <option value="3">生活用房</option>	
					   
						  <option value="4">道路</option>	
					   
					  </select> 
					 </font>
					</td>
					
					<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">
					建筑面积：</td>
					<td class="ta_01" >
					<input name="buildArea" type="text" id="buildArea"  size="21"> 
					m<sup>2</sup></td>
				</tr>
				
			</table>
			</td>
		</tr>
    </table>	
</form>

<br>
<form name="Form2"  id="Form2" style="margin:0px;">
  <table cellspacing="0" cellpadding="0" width="90%" align="center" bgcolor="#f5fafe" border="0">
	<TR>
		<TD align="center" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width=25><img src="${pageContext.request.contextPath }/images/yin.gif" width="15"></TD>
		<TD class="DropShadow" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width=100>房屋建筑信息列表</TD>
		<td class="ta_01" align="right" bgcolor="#ffffff">
			<input type="button" name="BT_Search" value="查询" style="font-size:12px; color:black; height=20;width=50" id="BT_Search" onclick="gotoquery('houseManage.do')">
			
			<input  id="BT_Add" type="button" value="添加" name="BT_Add" style="font-size:12px; color:black; height=20;width=50"   onclick="openWindow('buildingAdd.jsp',700,350);">
			<input type="button" name="excelExport"     value="导出" style="font-size:12px; color:black; height=20;width=50"   id="excelExport"     onClick="exeportExcel();" >
			<input type="button" name="setexcelExport"  value="导出设置" style="font-size:12px; color:black; height=20;width=80" id="setexcelExport"  onClick="openWindow('buildingExport.jsp','600','400')"  >
				
		</td>
	</TR>
  </TABLE>		
 <table cellspacing="1" cellpadding="0" width="90%" align="center" bgcolor="#f5fafe" border="0">
		<tr>
			<td class="ta_01" align="center" bgcolor="#f5fafe">
			<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1" id="DataGrid1" style="BORDER-RIGHT:gray 1px solid; BORDER-TOP:gray 1px solid; BORDER-LEFT:gray 1px solid; WIDTH:100%; WORD-BREAK:break-all; BORDER-BOTTOM:gray 1px solid; BORDER-COLLAPSE:collapse; BACKGROUND-COLOR:#f5fafe; WORD-WRAP:break-word">
				<tr style="FONT-WEIGHT:bold;FONT-SIZE:12pt;HEIGHT:25px;BACKGROUND-COLOR:#afd1f3">
					<td align="center" width="6%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">序号</td>
					<td align="center" width="14%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">建筑名称</td>
					<td align="center" width="9%"  height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">所属单位</td>
					<td align="center" width="7%"  height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">层数</td>
					<td align="center" width="10%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">造价(万元)</td>
					<td align="center" width="11%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">面积(m<sup>2</sup>)</td>
					<td align="center" width="13%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">使用时间</td>
					<td align="center" width="13%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">大修时间</td>
					
					<td width="6%" align="center" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">编辑</td>
					<td width="6%" align="center" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">删除</td>
						
				</tr>
				
				
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="6%">1</td>
					<td  align="center" width="14%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingView.jsp?editflag=0&buildId=8a6f819b12d014a00112d17c15340037','700','350');" class="cl_01">
					职工食堂</a>
					</td>
					<td align="center"  width="9%">540</td>
					<td align="center"  width="7%"></td>
					<td align="center"  width="10%">0</td>
					<td align="center"  width="11%">430</td>
					<td align="center"  width="13%"></td>
					<td align="center"  width="13%"></td>
					
					<td align="center" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingEdit.jsp?editflag=1&buildId=8a6f819b12d014a00112d17c15340037','700','350');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand"></a></td>
					<td align="center" style="HEIGHT: 21px">
					<a href="javascript:gotopage('removeJctBuild.do?buildId=8a6f819b12d014a00112d17c15340037','nowpage')" onclick="return confirm('你确定要删除  职工食堂？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a>
					</td>
						
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="6%">2</td>
					<td  align="center" width="14%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingView.jsp?editflag=0&buildId=8a6f819b12d014a00112d16ed126002b','700','350');" class="cl_01">
					发电机房</a>
					</td>
					<td align="center"  width="9%">540</td>
					<td align="center"  width="7%"></td>
					<td align="center"  width="10%">0</td>
					<td align="center"  width="11%">741.37</td>
					<td align="center"  width="13%"></td>
					<td align="center"  width="13%"></td>
					
					<td align="center" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingEdit.jsp?editflag=1&buildId=8a6f819b12d014a00112d16ed126002b','700','350');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand"></a></td>
					<td align="center" style="HEIGHT: 21px">
					<a href="javascript:gotopage('removeJctBuild.do?buildId=8a6f819b12d014a00112d16ed126002b','nowpage')" onclick="return confirm('你确定要删除  发电机房？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a>
					</td>
						
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="6%">3</td>
					<td  align="center" width="14%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingView.jsp?editflag=0&buildId=8a6f819b12d014a00112d1707d20002c','700','350');" class="cl_01">
					办公楼</a>
					</td>
					<td align="center"  width="9%">540</td>
					<td align="center"  width="7%"></td>
					<td align="center"  width="10%">0</td>
					<td align="center"  width="11%">490.9</td>
					<td align="center"  width="13%"></td>
					<td align="center"  width="13%"></td>
					
					<td align="center" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingEdit.jsp?editflag=1&buildId=8a6f819b12d014a00112d1707d20002c','700','350');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand"></a></td>
					<td align="center" style="HEIGHT: 21px">
					<a href="javascript:gotopage('removeJctBuild.do?buildId=8a6f819b12d014a00112d1707d20002c','nowpage')" onclick="return confirm('你确定要删除  办公楼？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a>
					</td>
						
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="6%">4</td>
					<td  align="center" width="14%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingView.jsp?editflag=0&buildId=8a6f819b12d014a00112d17783190032','700','350');" class="cl_01">
					警卫宿舍楼 </a>
					</td>
					<td align="center"  width="9%">540</td>
					<td align="center"  width="7%"></td>
					<td align="center"  width="10%">0</td>
					<td align="center"  width="11%">504</td>
					<td align="center"  width="13%"></td>
					<td align="center"  width="13%"></td>
					
					<td align="center" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingEdit.jsp?editflag=1&buildId=8a6f819b12d014a00112d17783190032','700','350');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand"></a></td>
					<td align="center" style="HEIGHT: 21px">
					<a href="javascript:gotopage('removeJctBuild.do?buildId=8a6f819b12d014a00112d17783190032','nowpage')" onclick="return confirm('你确定要删除  警卫宿舍楼 ？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a>
					</td>
						
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="6%">5</td>
					<td  align="center" width="14%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingView.jsp?editflag=0&buildId=8a6f819b12d014a00112d1766bdd0031','700','350');" class="cl_01">
					招待楼</a>
					</td>
					<td align="center"  width="9%">540</td>
					<td align="center"  width="7%"></td>
					<td align="center"  width="10%">0</td>
					<td align="center"  width="11%">676</td>
					<td align="center"  width="13%"></td>
					<td align="center"  width="13%"></td>
					
					<td align="center" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingEdit.jsp?editflag=1&buildId=8a6f819b12d014a00112d1766bdd0031','700','350');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand"></a></td>
					<td align="center" style="HEIGHT: 21px">
					<a href="javascript:gotopage('removeJctBuild.do?buildId=8a6f819b12d014a00112d1766bdd0031','nowpage')" onclick="return confirm('你确定要删除  招待楼？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a>
					</td>
						
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="6%">6</td>
					<td  align="center" width="14%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingView.jsp?editflag=0&buildId=8a6f819b12d014a00112d179f0fc0036','700','350');" class="cl_01">
					场强室</a>
					</td>
					<td align="center"  width="9%">540</td>
					<td align="center"  width="7%"></td>
					<td align="center"  width="10%">0</td>
					<td align="center"  width="11%">270</td>
					<td align="center"  width="13%"></td>
					<td align="center"  width="13%"></td>
					
					<td align="center" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingEdit.jsp?editflag=1&buildId=8a6f819b12d014a00112d179f0fc0036','700','350');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand"></a></td>
					<td align="center" style="HEIGHT: 21px">
					<a href="javascript:gotopage('removeJctBuild.do?buildId=8a6f819b12d014a00112d179f0fc0036','nowpage')" onclick="return confirm('你确定要删除  场强室？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a>
					</td>
						
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="6%">7</td>
					<td  align="center" width="14%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingView.jsp?editflag=0&buildId=8a6f819b12d014a00112d171ff1d002d','700','350');" class="cl_01">
					电视机房</a>
					</td>
					<td align="center"  width="9%">540</td>
					<td align="center"  width="7%"></td>
					<td align="center"  width="10%">0</td>
					<td align="center"  width="11%">575.6</td>
					<td align="center"  width="13%"></td>
					<td align="center"  width="13%"></td>
					
					<td align="center" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingEdit.jsp?editflag=1&buildId=8a6f819b12d014a00112d171ff1d002d','700','350');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand"></a></td>
					<td align="center" style="HEIGHT: 21px">
					<a href="javascript:gotopage('removeJctBuild.do?buildId=8a6f819b12d014a00112d171ff1d002d','nowpage')" onclick="return confirm('你确定要删除  电视机房？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a>
					</td>
						
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="6%">8</td>
					<td  align="center" width="14%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingView.jsp?editflag=0&buildId=8a6f819b12d014a00112d1789f380034','700','350');" class="cl_01">
					配电室</a>
					</td>
					<td align="center"  width="9%">540</td>
					<td align="center"  width="7%"></td>
					<td align="center"  width="10%">0</td>
					<td align="center"  width="11%">167.9</td>
					<td align="center"  width="13%"></td>
					<td align="center"  width="13%"></td>
					
					<td align="center" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingEdit.jsp?editflag=1&buildId=8a6f819b12d014a00112d1789f380034','700','350');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand"></a></td>
					<td align="center" style="HEIGHT: 21px">
					<a href="javascript:gotopage('removeJctBuild.do?buildId=8a6f819b12d014a00112d1789f380034','nowpage')" onclick="return confirm('你确定要删除  配电室？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a>
					</td>
						
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="6%">9</td>
					<td  align="center" width="14%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingView.jsp?editflag=0&buildId=8a6f819b12d014a00112d173ec37002f','700','350');" class="cl_01">
					值班员宿舍偻</a>
					</td>
					<td align="center"  width="9%">540</td>
					<td align="center"  width="7%"></td>
					<td align="center"  width="10%">0</td>
					<td align="center"  width="11%">736.4</td>
					<td align="center"  width="13%"></td>
					<td align="center"  width="13%"></td>
					
					<td align="center" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingEdit.jsp?editflag=1&buildId=8a6f819b12d014a00112d173ec37002f','700','350');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand"></a></td>
					<td align="center" style="HEIGHT: 21px">
					<a href="javascript:gotopage('removeJctBuild.do?buildId=8a6f819b12d014a00112d173ec37002f','nowpage')" onclick="return confirm('你确定要删除  值班员宿舍偻？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a>
					</td>
						
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td  align="center" width="6%">10</td>
					<td  align="center" width="14%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingView.jsp?editflag=0&buildId=8a6f819b12d014a00112d172816c002e','700','350');" class="cl_01">
					环球机房</a>
					</td>
					<td align="center"  width="9%">540</td>
					<td align="center"  width="7%"></td>
					<td align="center"  width="10%">0</td>
					<td align="center"  width="11%">730.8</td>
					<td align="center"  width="13%"></td>
					<td align="center"  width="13%"></td>
					
					<td align="center" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('buildingEdit.jsp?editflag=1&buildId=8a6f819b12d014a00112d172816c002e','700','350');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand"></a></td>
					<td align="center" style="HEIGHT: 21px">
					<a href="javascript:gotopage('removeJctBuild.do?buildId=8a6f819b12d014a00112d172816c002e','nowpage')" onclick="return confirm('你确定要删除  环球机房？')">
					<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR:hand"></a>
					</td>
						
				</tr>
				
				
				
				
			</table>
			</td>
		</tr>
	<tr>
       <td width="100%" height="1"  >
         <table border="0" width="100%" cellspacing="0" cellpadding="0">
         
           <tr>
             <td width="28%" align="left">总记录数：56 条</td> 
             <td width="15%" align="right"></td>                 
             
             <td width="5%" align="center">首页&nbsp;&nbsp;|</td>
             <td width="7%" align="center">上一页&nbsp;&nbsp;&nbsp;|</td>
             
             
			 
             
             <td width="7%" align="center"><u><a href="#" onClick="gotopage('houseManage.do','next')">下一页&nbsp;&nbsp;&nbsp;|</a></u></td>
             <td width="5%" align="center"><u><a href="#" onClick="gotopage('houseManage.do','end')">末页</a></u></td>
             
             <td width="6%" align="center">第1页</td>
             <td width="6%" align="center">共6页</td>
             <td width="18%" align="right">至第<input size="1" type="text" name="goPage" >页



             <u><a href="#" onClick="gotopage('houseManage.do','go')">确定</a></u></td>
             <td width="3%"></td> 
             <td><input type="hidden" name="pageNO" value="1" ></td> 
             <td><input type="hidden" name="prevpageNO" value="0"></td>
             <td><input type="hidden" name="nextpageNO" value="2"></td>
             <td><input type="hidden" name="querysql" value=""></td> 
             <td><input type="hidden" name="sumPage" value="6" ></td>
             <td><input type="hidden" name="pageSize" value="" ></td> 
           </tr>
         </table>       
       </td>
     </tr> 
 </table>
</form>
</body>
</html>
