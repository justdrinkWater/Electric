
<%@ page language="java" pageEncoding="UTF-8"%>







<html>

<head>
<title>维护情况</title>
<link href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet">
<script language="javascript" src="${pageContext.request.contextPath }/script/function.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/script/pub.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/script/validate.js"></script>
<script language="javascript"  >

 var stations=new Array();

  function init(){

     
      stations[0]="3|4028d09318ee4f450118ee559e9d0001|站点名称1|站点代号1|安装地点".split("|");
     
      stations[1]="9|4028d09318ee4f450118ee5616ab0002|站点名称|站点名称|站点名称".split("|");
     
      stations[2]="13|4028d09318ee4f450118ee56afaf0003|站点名称01|站点名称01|站点名称".split("|");
     
      stations[3]="13|4028d09318ee4f450118ee570cd30004|站点名称02|站点名称02|站点名称".split("|");
     
      stations[4]="13|4028d09318ee4f450118ee57b0370005|站点名称03|站点名称03|站点名称".split("|");
     
      stations[5]="13|4028d09318ee4f450118eeca14070006|站点名称07|站点名称07|".split("|");
     
      stations[6]="13|4028d09318ee4f450118eeca984a0007|站点名称08|站点名称08|".split("|");
     
      stations[7]="13|4028d09318ee4f450118eecb83180008|站点名称09|站点名称09|".split("|");
     
      stations[8]="13|4028d09318ee4f450118eece8f1f0009|站点名称10|站点名称10|".split("|");
     
      stations[9]="13|4028d09318ee4f450118eecf5221000a|站点名称11|站点名称11|".split("|");
     
      stations[10]="13|4028d09318ee4f450118eecfb82e000b|站点名称12|站点名称12|".split("|");
     
      stations[11]="13|4028d09318ee4f450118eed03daa000c|站点名称13|站点名称13|".split("|");
     
      stations[12]="13|4028d09318ee4f450118eed08bab000d|站点名称14|站点名称14|".split("|");
     
      stations[13]="13|4028d09318ee4f450118eed0e44a000e|站点名称15|站点名称15|".split("|");
     
      stations[14]="13|4028d09318ee4f450118eed12858000f|站点名称16|站点名称16|".split("|");
     
      stations[15]="13|4028d09318ee4f450118eed16e890010|站点名称17|站点名称17|".split("|");
     
      stations[16]="13|4028d09318ee4f450118eed1be010011|站点名称18|站点名称18|".split("|");
     
      stations[17]="13|4028d09318ee4f450118eed20ec10012|站点名称19|站点名称19|".split("|");
     
      stations[18]="13|4028d09318ee4f450118eed24e890013|站点名称20|站点名称20|".split("|");
     
      stations[19]="13|4028d09318ee4f450118eed2a94b0014|站点名称21|站点名称21|".split("|");
     
      stations[20]="13|4028d09318ee4f450118eed2ebc30015|站点名称22|站点名称22|".split("|");
     
      stations[21]="12|4028d0931a519a19011a519e52e30001|maradona|maradona|maradona".split("|");
     
      stations[22]="12|4028d0931a519a19011a51a1f8a90002|二期|二期|二期".split("|");
     
      stations[23]="13|7db3f136-e16e-4cff-9506-f7959b1a25ac|站点名称06|站点名称06|北京通讯器材厂5".split("|");
     
      stations[24]="13|91e63bc0-102f-4314-9959-cc5ad357f15b|站点名称04|站点名称04|北京通讯器材厂3".split("|");
     
      stations[25]="12|9c609010-7da8-4557-8709-d23791c0c0af|zhandian|***遥控站11111|北京通讯器材厂1".split("|");
     
      stations[26]="4|9fd2a7ff-2f0b-452c-a92c-b0ba24f82a34|宁化|S36P16|北京通讯器材厂6".split("|");
     
      stations[27]="4|b4dfde70-dbee-42c3-b7a8-9ce31e6375ed|宁德|S36P15|北京通讯器材厂7".split("|");
     
      stations[28]="13|ccf50e4b-69d2-41f4-b4a2-14befd4962af|站点名称05|站点名称05|北京通讯器材厂4".split("|");
     
      stations[29]="12|e63c9ecb-5465-4ec7-97da-08d16d0f2f39|zhandian21|***遥控站21|北京通讯器材厂2".split("|");
     
     
     getStation(document.Form1.jct);
}

 function getStation(para){
   
    var obj=document.Form1.stationName;  
    var mypara=para.value; 
    
    for(i=obj.length;i>0;i--) {
      obj.options.remove(i);        
    }
       
    for (i=0; i<stations.length;i++) {
          if(stations[i][0]==mypara) {
           
            obj.options.add(new Option(stations[i][2], stations[i][1]));                
          }
    }  
 }
 
 
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
     
     //新增故障录入后，因为是倒序排列，所以应去第一页，在此做标记


     if(where=="addnewbug"){
        page.value=1;
     }
     
      document.Form1.ifnewquery.value="0";    //不是新的查询,标志用于业务处理类


      document.Form1.pageNO.value=document.Form2.pageNO.value;  
      document.Form1.querysql.value=document.Form2.querysql.value;   
      document.Form1.pageSize.value=document.Form2.pageSize.value;
     
      Pub.submitActionWithForm('Form2',path,'Form1');      
}  

  function gotoquery(path){
    
      document.Form1.ifnewquery.value="1";  //新的查询应去第一页 ，用新的查询条件，标志给业务处理类用 
      document.Form1.pageNO.value=1;
      document.Form1.pageSize.value=10;

     Pub.submitActionWithForm('Form2',path,'Form1');    
 }
 

</script>
</head>

<body onload="init()">

<form name="Form1" method="post"  id="Form1" style="margin:0px;">
	<table cellspacing="1" cellpadding="0" width="90%" align="center" bgcolor="#f5fafe" border="0">
		<tr>
			<td class="ta_01" align="center" background="${pageContext.request.contextPath }/images/b-info.gif">
			&nbsp;<a href="siteMaintainIndex.jsp" class="cl_01"><font face="宋体" size="2">维护计划</font></a> 
			| <a href="siteStateIndex.jsp" class="cl_01"><font face="宋体" size="2"><strong>维护情况</strong></font></a>
			</td>
		</tr>
		<TR height=10><td></td></TR>
		 			
		 			<input type="hidden" name="initflag"   value="0">				
					<input type="hidden" name="pageNO"     value="" >                
                    <input type="hidden" name="querysql"   value="" >        
                    <input type="hidden" name="pageSize"   value="" >
                    <input type="hidden" name="ifnewquery"  >
                    
		<tr>
			<td>
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
       <tr>
	         <td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">所属单位：</td>
					<td class="ta_01" >
					<font face="宋体" color="red">
					<select name="jct" id="jct" class="bg" onchange="getStation(this)">
					
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
					
					</select> </font></td>
					<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">站点名称：</td>
					<td class="ta_01" >		
					<select name="stationName" id="stationName" class="bg">
					<option value="0">全部</option>
					</select></td>
				</tr>				
               <tr>
					<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">故障类型：</td>
					<td class="ta_01"  width="252">
					<font face="宋体" color="red">
					<select name="bugtype" id="bugtype" class="bg">
					<option value="0">全部</option>
					
					<option value="1">工控机</option>	
					
					<option value="2">接收机</option>	
					
					<option value="3">通讯</option>	
					
					<option value="4">供电</option>	
					
					<option value="5">天线</option>	
					
					<option value="6">测量板卡</option>	
					
					<option value="7">设备</option>	
					
					<option value="8">网络</option>	
					
					</select> </font></td>
					<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">故障描述：</td>
					<td class="ta_01"  >
					<input name="bugDes" type="text" maxlength="25" id="bugDes" size=19></td>
				</tr>
				
				<tr>
					<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">站点类型：</td>
					<td class="ta_01"  width="252">
						<font face="宋体" color="red">
						<select name="stationType" id="stationType" style="width:155px">
						<option value="0">全部</option>	
						
						<option value="1">国内遥控站</option>	
						
						<option value="3">国内采集点</option>	
						
						<option value="4">国内</option>	
						
						<option value="5">国外</option>	
						
						<option value="2">海外遥控站</option>	
									
						</select> </font>
					</td>
					<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22"></td>
					<td class="ta_01"  >
					</td>
				</tr>
				
				
			</table>
			</td>
		</tr>
     </table>
  </form>
	
	<br>	
  <form name="Form2" method="post"  id="Form2" style="margin:0px;">		
	 <table cellspacing="0" cellpadding="0" width="90%" align="center" bgcolor="#f5fafe" border="0">	
		<TR>
			<TD align="center" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width=25><img src="${pageContext.request.contextPath }/images/yin.gif" width="15"></TD>
			<TD class="DropShadow" background="${pageContext.request.contextPath }/images/cotNavGround.gif" width=100>维护情况信息列表</TD>
			<td class="ta_01" align="right" >
				<input type="button" name="BT_Search" value="查询" style="font-size:12px; color:black; height=20;width=50" id="BT_Search"  onclick="gotoquery('getRepairInfo.do')" >
				
				<input  id="BT_Add" type="button" value="添加" style="font-size:12px; color:black; height=20;width=50" name="BT_Add" onclick="openWindow('siteStateAdd.jsp','700','500');" />
				
		 </td>
		</TR>
	</TABLE>
  <table cellspacing="1" cellpadding="0" width="90%" align="center" bgcolor="#f5fafe" border="0">	
	<tr>
			<td class="ta_01" align="center" bgcolor="#f5fafe">
			<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray" border="1"  style="BORDER-RIGHT:gray 1px solid; BORDER-TOP:gray 1px solid; BORDER-LEFT:gray 1px solid; WIDTH:100%; WORD-BREAK:break-all; BORDER-BOTTOM:gray 1px solid; BORDER-COLLAPSE:collapse; BACKGROUND-COLOR:#f5fafe; WORD-WRAP:break-word">
				<tr style="FONT-WEIGHT:bold;FONT-SIZE:12pt;HEIGHT:25px;BACKGROUND-COLOR:#afd1f3">
					<td align="center" width="8%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">序号</td>
					<td align="center" width="17%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">所属单位</td>
					<td align="center" width="17%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">站点名称</td>
					<td align="center" width="17%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">生产厂家</td>
					<td align="center" width="17%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">故障类型</td>
					<td align="center" width="17%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">故障发生时间</td>
					
					<td align="center" width="7%" height=22 background="${pageContext.request.contextPath }/images/tablehead.jpg">编辑</td>
					
				</tr>
				
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td align="center" width="8%">&nbsp;1</td>
					<td align="center" width="17%">海南台</td>
					<td align="center"  width="17%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=0&bugid=354','700','500');" class="cl_01">
					站点名称04</a></td>
					<td align="center"  width="17%">北京通讯器材厂3</td>
					<td align="center"  width="17%">天线</td>
					<td align="center"  width="17%">2008-12-10 21:12</td>
					
					<td align="center"  width="7%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=1&bugid=354','700','500');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
				    
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td align="center" width="8%">&nbsp;2</td>
					<td align="center" width="17%">海南台</td>
					<td align="center"  width="17%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=0&bugid=353','700','500');" class="cl_01">
					站点名称04</a></td>
					<td align="center"  width="17%">北京通讯器材厂3</td>
					<td align="center"  width="17%">天线</td>
					<td align="center"  width="17%">2008-11-30 21:12</td>
					
					<td align="center"  width="7%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=1&bugid=353','700','500');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
				    
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td align="center" width="8%">&nbsp;3</td>
					<td align="center" width="17%">海南台</td>
					<td align="center"  width="17%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=0&bugid=351','700','500');" class="cl_01">
					站点名称04</a></td>
					<td align="center"  width="17%">北京通讯器材厂3</td>
					<td align="center"  width="17%">天线</td>
					<td align="center"  width="17%">2006-11-30 21:12</td>
					
					<td align="center"  width="7%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=1&bugid=351','700','500');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
				    
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td align="center" width="8%">&nbsp;4</td>
					<td align="center" width="17%">海南台</td>
					<td align="center"  width="17%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=0&bugid=352','700','500');" class="cl_01">
					站点名称04</a></td>
					<td align="center"  width="17%">北京通讯器材厂3</td>
					<td align="center"  width="17%">天线</td>
					<td align="center"  width="17%">2005-11-30 21:12</td>
					
					<td align="center"  width="7%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=1&bugid=352','700','500');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
				    
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td align="center" width="8%">&nbsp;5</td>
					<td align="center" width="17%">厦门台</td>
					<td align="center"  width="17%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=0&bugid=350','700','500');" class="cl_01">
					宁化</a></td>
					<td align="center"  width="17%">北京通讯器材厂6</td>
					<td align="center"  width="17%">天线</td>
					<td align="center"  width="17%">2008-11-30 21:12</td>
					
					<td align="center"  width="7%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=1&bugid=350','700','500');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
				    
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td align="center" width="8%">&nbsp;6</td>
					<td align="center" width="17%">厦门台</td>
					<td align="center"  width="17%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=0&bugid=337','700','500');" class="cl_01">
					宁化</a></td>
					<td align="center"  width="17%">北京通讯器材厂6</td>
					<td align="center"  width="17%">天线</td>
					<td align="center"  width="17%">2007-2-3 11:12</td>
					
					<td align="center"  width="7%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=1&bugid=337','700','500');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
				    
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td align="center" width="8%">&nbsp;7</td>
					<td align="center" width="17%">厦门台</td>
					<td align="center"  width="17%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=0&bugid=339','700','500');" class="cl_01">
					宁化</a></td>
					<td align="center"  width="17%">北京通讯器材厂6</td>
					<td align="center"  width="17%">天线</td>
					<td align="center"  width="17%">2007-2-19 11:12</td>
					
					<td align="center"  width="7%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=1&bugid=339','700','500');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
				    
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td align="center" width="8%">&nbsp;8</td>
					<td align="center" width="17%">厦门台</td>
					<td align="center"  width="17%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=0&bugid=338','700','500');" class="cl_01">
					宁化</a></td>
					<td align="center"  width="17%">北京通讯器材厂6</td>
					<td align="center"  width="17%">天线</td>
					<td align="center"  width="17%">2007-2-19 11:11</td>
					
					<td align="center"  width="7%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=1&bugid=338','700','500');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
				    
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td align="center" width="8%">&nbsp;9</td>
					<td align="center" width="17%">厦门台</td>
					<td align="center"  width="17%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=0&bugid=341','700','500');" class="cl_01">
					宁化</a></td>
					<td align="center"  width="17%">北京通讯器材厂6</td>
					<td align="center"  width="17%">天线</td>
					<td align="center"  width="17%">2007-12-30 22:12</td>
					
					<td align="center"  width="7%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=1&bugid=341','700','500');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
				    
				</tr>
				
				<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
					<td align="center" width="8%">&nbsp;10</td>
					<td align="center" width="17%">厦门台</td>
					<td align="center"  width="17%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=0&bugid=343','700','500');" class="cl_01">
					宁化</a></td>
					<td align="center"  width="17%">北京通讯器材厂6</td>
					<td align="center"  width="17%">天线</td>
					<td align="center"  width="17%">2007-11-9 15:12</td>
					
					<td align="center"  width="7%" style="HEIGHT: 22px">
					<a href="#" onclick="openWindow('siteStateEdit.jsp?editflag=1&bugid=343','700','500');">
					<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR:hand" /></a></td>
				    
				</tr>
				
			
			</table>
			</td>
		</tr>
		
	<tr>
       <td width="100%" height="1"  >
         <table border="0" width="100%" cellspacing="0" cellpadding="0">
         
           <tr>
             <td width="28%" align="left">总记录数：18 条</td> 
             <td width="15%" align="right"></td>                 
             
             <td width="5%" align="center">首页&nbsp;&nbsp;|</td>
             <td width="7%" align="center">上一页&nbsp;&nbsp;&nbsp;|</td>
             
             
			 
             
             <td width="7%" align="center"><u><a href="#" onClick="gotopage('getRepairInfo.do','next')">下一页&nbsp;&nbsp;&nbsp;|</a></u></td>
             <td width="5%" align="center"><u><a href="#" onClick="gotopage('getRepairInfo.do','end')">末页</a></u></td>
             
             <td width="6%" align="center">第1页</td>
             <td width="6%" align="center">共2页</td>
             <td width="18%" align="right">至第<input size="1" type="text" name="goPage" >页


             <u><a href="#" onClick="gotopage('getRepairInfo.do','go')">确定</a></u></td>
             <td width="3%"></td> 
             <td><input type="hidden" name="pageNO" value="1" ></td> 
             <td><input type="hidden" name="prevpageNO" value="0"></td>
             <td><input type="hidden" name="nextpageNO" value="2"></td>
             <td><input type="hidden" name="querysql" value=""></td> 
             <td><input type="hidden" name="sumPage" value="2" ></td>
             <td><input type="hidden" name="pageSize" value="" ></td> 
           </tr>
         </table>       
       </td>
     </tr>  
		
	</table>
  </form>

</body>

</html>

