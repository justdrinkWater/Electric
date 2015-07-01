<%@page import="com.sw.elec.util.PageBean"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<table cellpadding="0" cellspacing="0" border="0" width="90%" bgcolor="#f5fafe" align="center">
	<TR>
		<TD align="center"
			background="${pageContext.request.contextPath }/images/cotNavGround.gif"
			width="25"><img
			src="${pageContext.request.contextPath }/images/yin.gif"
			width="15"></TD>
		<TD class="DropShadow"
			background="${pageContext.request.contextPath }/images/cotNavGround.gif"
			width="100">设备计划信息列表</TD>
		<td>&nbsp;&nbsp;<input type="button" height=20
			style="font-size: 12px; color: black;" name="chkall" value="全选"
			onClick="CheckAll(this.form)"> <input type="button"
			height=20 style="font-size: 12px; color: black;"
			name="chkOthers" value="取消" onClick="CheckOthers(this.form)">
		</td>
		<td class="ta_01" align="right">
			<input name="BT_Search"	type="button" style="font-size: 12px; color: black;"
				id="BT_Search" value="查询" onclick="gotoquery('elecDevicePlanAction_home.do')" />
			<input name="BT_Add" type="button" style="font-size: 12px; color: black;" id="BT_Add"
				onClick="openWindow('elecDevicePlanAction_add.do',800,450);" value="添加" /> 
			<input name="BT_import" type="button" style="font-size: 12px; color: black;" id="BT_import"
				onClick="openWindow('elecDevicePlanAction_import.do','600','450');" value="导入">
			<input type="button" name="chkall" height="20" style="font-size: 12px; color: black;" value="购置"
				onclick="jsDPToD()"> 
			<input type="button" name="chkall2"	height="20" style="font-size: 12px; color: black;" value="计划顺延"
				onclick="jsPlanNext()">
		</td>
	</TR>
</table>

<table cellpadding="0" cellspacing="0" border="0" width="90%"
	bgcolor="#f5fafe" align="center">
	<tr>
		<td class="ta_01" align="center" bgcolor="#f5fafe">
			<table cellspacing="0" cellpadding="1" rules="all"
				bordercolor="gray" border="1" id="DataGrid1"
				style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
				<tr
					style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
					<td align="center" width="5%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">序号</td>
					<td align="center" width="22%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">名称</td>
					<td align="center" width="9%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">数量</td>
					<td align="center" width="9%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">金额</td>
					<td align="center" width="14%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">规格型号</td>
					<td align="center" width="9%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">用途</td>
					<td align="center" width="11%" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">使用单位</td>
					<td width="9%" align="center" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">是否购置</td>
					<td width="5%" align="center" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">编辑</td>
					<td width="5%" align="center" height=22
						background="${pageContext.request.contextPath }/images/tablehead.jpg">删除</td>
				</tr>
				<s:if test="#request.planList!=null">
					<s:iterator value="%{#request.planList}" var="plan">
						<tr onMouseOver="this.style.backgroundColor = 'white'"
							onMouseOut="this.style.backgroundColor = '#F5FAFE';">
							<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="5%">
								<s:property value="#plan.num"/>
							</td>
							<td align="center" width="22%">
								<a href="javascript:;" onClick="openWindow('planView.jsp',800,450);" class="cl_01">
									<s:property value="#plan.devName"/>
								</a>
							</td>
							<td align="center" width="9%">
								<s:property value="#plan.quality"/>
							</td>
							<td align="center" width="9%">
								<s:property value="#plan.devExpense"/>
							</td>
							<td align="center" width="14%">
								<s:property value="#plan.specType"/>
							</td>
							<td align="center" width="9%">
								<s:property value="#plan.useness"/>
							</td>
							<td align="center" width="11%" style="HEIGHT: 22px">
								<s:property value="#plan.useUnit"/>
							</td>
							<td align="center">
								<input type="checkbox" id="devPlanID" name="devPlanID" value="" />
							</td>
							<td align="center">
								<a href="javascript:;" onClick="openWindow('elecDevicePlanAction_edit.do?devPlanID=<s:property value="#plan.devPlanID"/>',800,450);">
									<img src="${pageContext.request.contextPath }/images/edit.gif"	style="CURSOR: hand" border="0">
								</a>
							</td>
							<td align="center">
								<a href="javascript:Pub.submitActionWithForm('Form2','elecDevicePlanAction_delete.do?devPlanID=<s:property value="#plan.devPlanID"/>','Form1')"
									onclick="return confirm('确认要删['<s:property value="#plan.devName"/>']除？')"> 
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
							<a href="#" onclick="gotopage('equapment/elecDevicePlanAction_home.do','start')">首&nbsp;页&nbsp;&nbsp;|</a>
						</u>
						
					</td>
					<td width="7%" align="center">
						<u>
							<a href="#" onclick="gotopage('equapment/elecDevicePlanAction_home.do','prev')">上一页&nbsp|</a>
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
							href="#" onclick="gotopage('equapment/elecDevicePlanAction_home.do','next')">下一页&nbsp;|</a></u></td>
					<td width="5%" align="center"><u><a
							href="#" onclick="gotopage('equapment/elecDevicePlanAction_home.do','end')">末页</a></u></td>
					<%} %>
					<td width="6%" align="center">第<%=pagebean.getPageNo() %>页</td>
					<td width="6%" align="center">共<%=pagebean.getSumPage() %>页</td>
					<td width="18%" align="right">至第<input type="text"
						name="goPage" size="3" style="width: 50px">页 <u><a
							href="#" onclick="gotopage('equapment/elecDevicePlanAction_home.do','go')">确定</a></u></td>
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