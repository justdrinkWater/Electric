<%@page import="com.sw.elec.util.PageBean"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>仪器设备管理</title>
<link href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/public.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/function.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/pub.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/changePageBackUp.js"></script>
<script type="text/javascript" 
		src="${pageContext.request.contextPath }/script/validate.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath }/script/page.js"></script>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<SCRIPT type="text/javascript">
	function JctSelectChange(mySelect)
	{
	   if (mySelect.selectedIndex != "" && document.Form1.devType.selectedIndex != "")
	    {
	    	devTuzhi.style.display = ""
	    } else {
	    	devTuzhi.style.display = "none"
	    }
	}
	
	function DevTypeSelectChange(mySelect)
	{
	   if (mySelect.selectedIndex != "" && document.Form1.jctId.selectedIndex != "")
	    {
	    	devTuzhi.style.display = ""
	    } else {
	    	devTuzhi.style.display = "none"
	    }
	}
	
	function upload(fn){
		var jctId = document.Form1.jctId.value;
		if(jctId==0){
         		alert("请先选择所属单位");
         	return;
      		}
		var str = "initUpload.do?belongTo=" + fn
					+ "&jctId=" + jctId + "&projid=" + document.Form1.jctId.selectedIndex + "-" + document.Form1.devType.selectedIndex;
		OpenWindow('uploadInit',str,800,450);
	}	
	function check(){
		var time1 = document.getElementById("useDatef").value;
		var time2 = document.getElementById("useDatet").value;
		
		if(time1 == ""|| time1 == null && time2 != null){
			alert("请选择使用时间的开始时间");
		}
		if(time1 != null && time2 == null || time2 == ""){
			alert("请选择使用时间的截止时间");
		}
	}

</SCRIPT>
</head>

<body>
	<s:form name="Form1" method="post" id="Form1" cssStyle="margin: 0px;">
	
		<s:hidden name="searchFlag" id="searchFlag" value="1"/>
		
		<input type="hidden" name="pageNO" value=""> 
		<input type="hidden" name="pageSize" value="">

		<table cellspacing="1" cellpadding="0" width="90%" align="center"
			bgcolor="#f5fafe" border="0">
			<tr>
				<td class="ta_01" align="center"
					background="${pageContext.request.contextPath }/images/b-info.gif">
					<font face="宋体" size="2"><strong>仪器设备管理</strong></font>
				</td>
			</tr>
			<TR height=10>
				<td></td>
			</TR>
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" border="0" width="100%">
						<tr>
							<td width="100" class="ta_01" align="center" bgcolor="#f5fafe"
								height="22">所属单位：</td>
							<td class="ta_01">
								<s:if test="#request.jctIDs != null">
									<s:select list="%{#request.jctIDs}" cssClass="bg" name="jctID" id="jctID" 
												headerKey="" headerValue="全部"
												listKey="ddlCode" listValue="ddlName">
									</s:select>
								</s:if>
							</td>
							<td width="100" class="ta_01" align="center" bgcolor="#f5fafe"
								height="22">设备名称：</td>
							<td class="ta_01"><input name="devName" type="text"
								id="devName" size="28" value="" /></td>
						</tr>
						<tr>
							<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">设备类型：</td>
							<td class="ta_01" width="300">
								<s:if test="#request.devTypes != null">
									<s:select list="%{#request.devTypes}" id="devType" name="devType" cssClass="bg"
												headerKey="" headerValue="全部"
												listKey="ddlCode" listValue="ddlName">
									</s:select>
								</s:if>
							 &nbsp;&nbsp;&nbsp;&nbsp; <span id="devTuzhi"
								style="DISPLAY: none"> <input id="btnTuzhi" type="button"
									value=" 详细" name="btnTuzhi" onclick="upload('5');"
									style="font-size: 12px; color: black;">
							</span>
							</td>
							<td width="100" class="ta_01" align="center" bgcolor="#f5fafe" height="22">
								使用日期：
							</td>
							<td class="ta_01" width="247">
								<input name="useDatef" type="date" id="useDatef" size="10" onblur="check()">
								
								 ~ 
								<input name="useDatet" type="date" id="useDatet" size="10" onblur="check()">
							</td>
						</tr>
						<tr>
							<td width="100" class="ta_01" align="center" bgcolor="#f5fafe"
								height="22">设备状态：</td>
							<td class="ta_01" align="left">
								<font face="宋体" color="red">
									<s:if test="#request.devStates != null">
										<s:select list="%{#request.devStates}" name="devState" id="devState" cssClass="bg"
												headerKey="" headerValue="全部"
												listKey="ddlCode" listValue="ddlName"
												>
										</s:select>
									</s:if>
								</font>
							</td>
							<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">计划时间：
							</td>
							<td class="ta_01" width="300">
								<input name="planDatef" type="date" id="planDatef" size="10" value=""> 
									~ 
								<input name="planDatet" type="date" id="planDatet" size="10" value="">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</s:form>
	<br>
	<s:form name="Form2" method="post" id="Form2" cssStyle="margin: 0px;">
		<table cellpadding="0" cellspacing="0" border="0" width="90%"
			align="center">
			<TR>
				<TD align="center"
					background="${pageContext.request.contextPath }/images/cotNavGround.gif"
					width="25"><img
					src="${pageContext.request.contextPath }/images/yin.gif" width="15"></TD>
				<TD class="DropShadow"
					background="${pageContext.request.contextPath }/images/cotNavGround.gif"
					width="80">设备信息列表</TD>
				<td align="right" class="ta_01">
					<INPUT name="BT_Add"
						type="button" id="BT_Add" value="添加"
						style="font-size: 12px; color: black;" onclick="openWindow('elecDeviceAction_add.do','800','450')">
					<INPUT name="BT_Search"
						type="button" id="BT_Search" value="查询"
						style="font-size: 12px; color: black;" onclick="gotoquery('elecDeviceAction_home.do')">
					<input name="BT_export" type="button" " id="BT_export" value="导出"
						style="font-size: 12px; color: black;"
						onClick="openWindow('elecDeviceAction_export.do','600','400')"> 
					<input type="button" name="setexcelExport"
						style="font-size: 12px; color: black;" value="导出设置"
						id="setexcelExport"
						onClick="openWindow('elecDeviceAction_exportSet.do','600','400')">
					</td>
			</TR>
		</TABLE>
		<table cellpadding="0" cellspacing="0" border="0" width="90%"
			align="center">
			<tr>
				<td class="ta_01" align="center" bgcolor="#f5fafe">
					<table cellspacing="0" cellpadding="1" rules="all"
						bordercolor="gray" border="1" id="DataGrid1"
						style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
						<tr
							style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
							<td width="11%" align="center" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">序号</td>
							<td width="15%" align="center" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">名称</td>
							<td width="14%" align="center" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">规格型号</td>
							<td align="center" width="8%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">设备状态</td>
							<td align="center" width="10%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">使用日期</td>
							<td align="center" width="10%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">检修周期</td>
							<td align="center" width="9%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">所属单位</td>
							<td width="6%" align="center" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">编辑</td>
							<td width="6%" align="center" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">删除</td>

						</tr>
						<s:if test="#request.listDevice != null">
							<s:iterator value="%{#request.listDevice}" var="device" >
								<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td align="center">
										<s:property value="%{#device.num}"/>
									</td>
									<td align="center">
										<a href="javascript:;" onClick="openWindow('elecDeviceAction_edit.do?devID=<s:property value="%{#device.devID}"/>&viewflag=1',800,450);" class="cl_01"> 
											<s:property value="%{#device.devName}"/>
										</a>
									</td>
									<td align="left">
										<s:property value="%{#device.specType}"/>
									</td>
									<td align="center" width="8%">
										<s:property value="%{#device.devState}"/>
									</td>
									<td align="center" width="10%">
										<s:property value="%{#device.useDate}"/>
									</td>
									<td align="center" width="10%">
										<s:property value="%{#device.overhailPeriod}"/>
									</td>
									<td align="center" width="9%" style="HEIGHT: 22px">
										<s:property value="%{#device.jctID}"/>
									</td>
									<td align="center" style="HEIGHT: 22px">
										<a href="#"
										onClick="openWindow('elecDeviceAction_edit.do?devID=<s:property value="%{#device.devID}"/>',800,450,'');">
											<img src="${pageContext.request.contextPath }/images/edit.gif"
											style="CURSOR: hand" border="0">
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px">
										<a href="elecDeviceAction_delete.do?devID=<s:property value="%{#device.devID}"/>"
											onclick="return confirm('确认要删除[<s:property value="%{#device.devName}"/>]吗？')"> 
												<img src="${pageContext.request.contextPath }/images/delete.gif"
													style="CURSOR: hand" border="0">
										</a>
									</td>
								</tr>
							</s:iterator>
						</s:if>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<table border="0" width="100%" cellspacing="0" cellpadding="0">
						<%
							PageBean pagebean = (PageBean)request.getAttribute("page");
						%>
						<tr>
							<td width="28%" align="left">总记录数：<%=pagebean.getTotalResult() %></td>
							<td width="15%" align="right"></td>
							<%
								if(pagebean.getFirstPage()){
							%>
							<td width="5%" align="center">首&nbsp;页&nbsp;|</td>
							<td width="7%" align="center">上一页&nbsp|</td>
							<%
								}else{
							%>
							<td width="5%" align="center">
								<u>
									<a href="#" onclick="gotopage('equapment/elecDeviceAction_home.do','start')">首&nbsp;页&nbsp;&nbsp;|</a>
								</u>
								
							</td>
							<td width="7%" align="center">
								<u>
									<a href="#" onclick="gotopage('equapment/elecDeviceAction_home.do','prev')">上一页&nbsp|</a>
								</u>
							</td>
							<%} %>
							<%
								if(pagebean.getLastPage()){ 
							%>
							<td width="7%" align="center">
								<u>
									<a href="#" onclick="">
									下一页&nbsp;|</a></u></td>
							<td width="5%" align="center"><u><a
									href="#" onclick="">末页</a></u></td>
							<%
								}else{ 
							%>
							<td width="7%" align="center"><u><a
									href="#" onclick="gotopage('equapment/elecDeviceAction_home.do','next')">下一页&nbsp;|</a></u></td>
							<td width="5%" align="center"><u><a
									href="#" onclick="gotopage('equapment/elecDeviceAction_home.do','end')">末页</a></u></td>
							<%} %>
							<td width="6%" align="center">第<%=pagebean.getPageNo() %>页</td>
							<td width="6%" align="center">共<%=pagebean.getSumPage() %>页</td>
							<td width="18%" align="right">至第<input type="text"
								name="goPage" size="3" style="width: 50px">页 <u><a
									href="#" onclick="gotopage('equapment/elecDeviceAction_home.do','go')">确定</a></u></td>
							<td width="3%"></td>
							<td>
								<input type="hidden" name="pageNO"
									value="<%=pagebean.getPageNo()%>"></td>
								<td><input type="hidden" name="prevpageNO"
									value="<%=(pagebean.getPageNo() - 1)%>"></td>
								<td><input type="hidden" name="nextpageNO"
									value="<%=(pagebean.getPageNo() + 1)%>"></td>
								<td><input type="hidden" name="sumPage"
									value="<%=pagebean.getSumPage()%>"></td>
								<td><input type="hidden" name="pageSize" value="">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</s:form>
</body>

</html>

