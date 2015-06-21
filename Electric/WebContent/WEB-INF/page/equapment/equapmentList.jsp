<%@page import="com.sw.elec.util.PageBean"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%

%>
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
		<td align="right" class="ta_01"><INPUT name="BT_Search"
			type="button" id="BT_Search" value="查询"
			style="font-size: 12px; color: black;" onclick="gotoquery('equapment/elecDeviceAction_home.do')">
			<input name="BT_export" type="button" " id="BT_export" value="导出"
			style="font-size: 12px; color: black;"
			onClick="openWindow('exportSarDevice.do','600','400')"> <input
			type="button" name="setexcelExport"
			style="font-size: 12px; color: black;" value="导出设置"
			id="setexcelExport"
			onClick="openWindow('equapmentExport.jsp','600','400')"></td>
	</TR>
</table>
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
					<s:iterator value="%{#request.listDevice}" var="device">
						<tr onmouseover="this.style.backgroundColor = 'white'" onmouseout="this.style.backgroundColor = '#F5FAFE';">
							<td align="center">
								<s:property value="%{#device.devID}"/>
							</td>
							<td align="center">
								<a href="javascript:;" onClick="openWindow('elecDeviceAction_edit.do?editflag=0&devId=ab15b1290c004d53af24bd2ce8845fa4&typeView=设备查询&pageNo=1&sumPage=13&lastRecordIndex=124&changeFlag=receive&direction=',800,450,'设备详细信息');" class="cl_01"> 
									<s:property value="%{#device.devName}"/>
								</a>
							</td>
							<td align="left">
								<s:property value="%{#device.devName}"/>
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
								<a href="javascript:;"
								onClick="openWindow('elecDeviceAction_edit.do?editflag=1&devId=ab15b1290c004d53af24bd2ce8845fa4&typeView=设备查询&pageNo=1&sumPage=13&lastRecordIndex=124&changeFlag=receive&direction=',800,450,'设备详细信息');">
									<img src="${pageContext.request.contextPath }/images/edit.gif"
									style="CURSOR: hand" border="0">
								</a>
							</td>
							<td align="center" style="HEIGHT: 22px">
								<a href="javascript:Pub.submitActionWithForm('Form1','delDevice.do?devId=ab15b1290c004d53af24bd2ce8845fa4&typeView=设备查询&pageNo=1&sumPage=13&lastRecordIndex=124&changeFlag=receive&direction=','F1')"
									onclick="return confirm('确认要删除吗？')"> 
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
					<td width="5%" align="center">首页&nbsp;&nbsp;|</td>
					<td width="7%" align="center">上一页&nbsp|</td>
					<%
						}else{
					%>
					<td width="5%" align="center">
						<u>
							<a href="#" onclick="gotopage('equapment/elecDeviceAction_home.do','start')">首页&nbsp;&nbsp;|</a>
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
					<td><input type="hidden" name="pageNO"
							value="<%=pagebean.getPageNo()%>"></td>
						<td><input type="hidden" name="prevpageNO"
							value="<%=(pagebean.getPageNo() - 1)%>"></td>
						<td><input type="hidden" name="nextpageNO"
							value="<%=(pagebean.getPageNo() + 1)%>"></td>
						<td><input type="hidden" name="sumPage"
							value="<%=pagebean.getSumPage()%>"></td>
						<td><input type="hidden" name="pageSize" value=""></td>
					<td>
						<input type="hidden" name="typeView" value="设备查询">
						<input type="hidden" name="direction" value="">
						<input type="hidden" name="pageNo" value="1">
						<input type="hidden" name="sumPage" value="13">
						<input type="hidden" name="lastRecordIndex" value="124">
						<input type="hidden" name="changeFlag" value="receive">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

