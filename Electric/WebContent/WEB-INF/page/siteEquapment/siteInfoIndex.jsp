<%@page import="com.sw.elec.util.PageBean"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>站点基本信息管理</title>
<link href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/function.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/pub.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/page.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<s:form name="Form1" id="Form1" cssStyle="margin: 0px;">
	
		<input type="hidden" name="pageNO" value="">
		<input type="hidden" name="pageSize" value="">
	
		<input type="hidden" name="searchflag" id="searchflag" value="1">
		<table cellspacing="1" cellpadding="0" width="90%" align="center"
			bgcolor="#f5fafe" border="0">
			<tr>
				<td class="ta_01" align="center"
					background="${pageContext.request.contextPath }/images/b-info.gif">
					<font face="宋体" size="2"><strong>站点基本信息管理</strong></font>
				</td>
			</tr>
			<TR height=10>
				<td></td>
			</TR>
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" border="0" width="100%"
						bgcolor="#f5fafe">
						<tr>
							<td width="100" class="ta_01" align="center" height="22">
								所属单位：</td>
							<td class="ta_01">
								<s:if test="#request.jctIDs != null">
									<s:select list="%{#request.jctIDs}" cssClass="bg" name="jctID" id="jctID" onchange="getStation(this)"
												headerKey="" headerValue="全部"
												listKey="ddlCode" listValue="ddlName">
									</s:select>
								</s:if>
							</td>
							
							<td width="100" class="ta_01" align="center" height="22">
								站点名称：</td>
							<td class="ta_01">&nbsp;
								<input name="stationName" id="stationName" type="text" size="21">
							</td>
						</tr>
						<tr>
							<td width="100" height="22" align="center" class="ta_01">站点代号：</td>
							<td class="ta_01"><input name="stationCode" type="text"
								id="stationCode" size="21"></td>
							<td width="100" height="22" align="center" class="ta_01">站点类别：</td>
							<td class="ta_01" height="30">&nbsp; 
								<s:if test="#request.stationTypes != null">
									<s:select list="%{#request.stationTypes}" cssClass="bg" name="stationType" id="stationType" cssStyle="width: 160px"
												headerKey="" headerValue="全部"
												listKey="ddlCode" listValue="ddlName">
									</s:select>
								</s:if>
							</td>
						</tr>
						<tr>
							<td width="100" height="22" align="center" class="ta_01">通讯方式：</td>
							<td class="ta_01"><input name="contactType" type="text"
								id="contactType" size="21">
							</td>
							<td width="100" height="22" align="center" class="ta_01">归属地：</td>
							<td class="ta_01">&nbsp&nbsp<input name="attributionGround"
								type="text" id="attributionGround" size="21">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</s:form>
	<s:form name="Form2" id="Form2" cssStyle="margin: 0px;">
		<table cellspacing="0" cellpadding="0" width="90%" align="center"
			bgcolor="#f5fafe" border="0">
			<TR>
				<TD align="center"
					background="${pageContext.request.contextPath }/images/cotNavGround.gif"
					width=25><img
					src="${pageContext.request.contextPath }/images/yin.gif" width="15"></TD>
				<TD class="DropShadow"
					background="${pageContext.request.contextPath }/images/cotNavGround.gif"
					width=80>站点信息列表</TD>
				<td class="ta_01" align="right">
					<input type="button" name="BT_Search" style="font-size: 12px; color: black;" value="查询"
						id="BT_Search" onclick="gotoquery('elecStationAction_home.do')"> 
					<input	style="font-size: 12px; color: black;" id="BT_Add" type="button"
						value="添加" name="BT_Add"	onclick="openWindow('elecStationAction_add.do','700','350')" /> 
					<input	type="button" name="excelimport" style="font-size: 12px; color: black;" 
						value="导入" id="excelimport" onclick="openWindow('siteInfoImport.jsp?fn=1','600','400')">
					<input type="button" name="excelExport"	style="font-size: 12px; color: black;" 
						value="导出" id="excelExport" onClick="openWindow('elecStationAction_export.do','600','400');"> 
					<input type="button" name="setexcelExport" style="font-size: 12px; color: black;"
						value="导出设置" id="setexcelExport" onClick="openWindow('elecStationAction_exportSet.do','600','400')">
				</td>
			</TR>
		</table>
		<table cellspacing="1" cellpadding="0" width="90%" align="center"
			bgcolor="#f5fafe" border="0">
			<tr>
				<td class="ta_01" align="center" bgcolor="#f5fafe">
					<table cellspacing="0" cellpadding="1" rules="all"
						bordercolor="gray" border="1" id="DataGrid1"
						style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
						<tr
							style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
							<td align="center" width="5%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">序号</td>
							<td align="center" width="10%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">所属单位</td>
							<td align="center" width="10%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">归属地</td>
							<td align="center" width="10%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">站点代号</td>
							<td align="center" width="13%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">站点名称</td>
							<td align="center" width="10%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">站点类别</td>
							<td align="center" width="10%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">通讯方式</td>
							<td align="center" width="10%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">安装地点</td>
							<td width="7%" align="center" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">编辑</td>
							<td width="7%" align="center" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">删除</td>
						</tr>
						<s:if test="#request.stationList!=null">
							<s:iterator value="%{#request.stationList}" var="station">
								<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td align="center" width="5%">&nbsp;
										<s:property value="%{#station.num}"/>
									</td>
									<td align="center" width="10%">
										<s:property value="%{#station.jctID}"/>
									</td>
									<td align="center" width="10%">
										<s:property value="%{#station.attributionGround}"/>
									</td>
									<td align="center" width="10%">
										<s:property value="%{#station.stationCode}"/>
									</td>
									<td align="center" width="13%" style="HEIGHT: 22px">
										<a href="#" onclick="openWindow('elecStationAction_edit.do?stationID=<s:property value="%{#station.stationID}"/>&viewflag=1','700','350');" class="cl_01">
											<s:property value="%{#station.stationName}"/>
										</a>
									</td>
									<td align="center" width="10%">
										<s:property value="%{#station.stationType}"/>
									</td>
									<td align="center" width="10%">
										<s:property value="%{#station.contactType}"/>
									</td>
									<td align="center" width="10%">
										<s:property value="%{#station.jcFrequency}"/>
									</td>
									<td align="center" style="HEIGHT: 22px">
										<a href="#"  onclick="openWindow('elecStationAction_edit.do?stationID=<s:property value="%{#station.stationID}"/>','700','350');">
											<img src="${pageContext.request.contextPath }/images/edit.gif" border="0" style="CURSOR: hand">
										</a>
									</td>
									<td align="center" style="HEIGHT: 22px">
										<a href="elecStationAction_delete.do?stationID=<s:property value="%{#station.stationID}"/>"
										onclick="return confirm('确定要删除[<s:property value="%{#station.stationName}"/>]吗？')"> 
											<img src="${pageContext.request.contextPath }/images/delete.gif" width="15" height="14" border="0" style="CURSOR: hand">
										</a>
									</td>
								</tr>
							</s:iterator>
						</s:if>
					</table>
				</td>
			</tr>
			<tr>
				<td width="100%" height="1">
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
									<a href="#" onclick="gotopage('siteEquapment/elecStationAction_home.do','start')">首&nbsp;页&nbsp;&nbsp;|</a>
								</u>
								
							</td>
							<td width="7%" align="center">
								<u>
									<a href="#" onclick="gotopage('siteEquapment/elecStationAction_home.do','prev')">上一页&nbsp|</a>
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
									href="#" onclick="gotopage('siteEquapment/elecStationAction_home.do','next')">下一页&nbsp;|</a></u></td>
							<td width="5%" align="center"><u><a
									href="#" onclick="gotopage('siteEquapment/elecStationAction_home.do','end')">末页</a></u></td>
							<%} %>
							<td width="6%" align="center">第<%=pagebean.getPageNo() %>页</td>
							<td width="6%" align="center">共<%=pagebean.getSumPage() %>页</td>
							<td width="18%" align="right">至第<input type="text"
								name="goPage" size="3" style="width: 50px">页 <u><a
									href="#" onclick="gotopage('siteEquapment/elecStationAction_home.do','go')">确定</a></u></td>
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
