<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.sw.elec.util.PageBean"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String popedom = (String) request.getSession().getAttribute(
			"globle_popedom");
%>
<table cellSpacing="1" cellPadding="0" width="90%" align="center"
	bgColor="#f5fafe" border="0">
	<TBODY>
		<TR height=10>
			<td></td>
		</TR>
		<tr>
			<td>
				<TABLE style="WIDTH: 105px; HEIGHT: 20px" border="0">
					<TR>
						<TD align="center"
							background="${pageContext.request.contextPath }/images/cotNavGround.gif"><img
							src="${pageContext.request.contextPath }/images/yin.gif"
							width="15"></TD>
						<TD class="DropShadow"
							background="${pageContext.request.contextPath }/images/cotNavGround.gif">用户列表</TD>
					</TR>
				</TABLE>
			</td>
			<td class="ta_01" align="right"><input
				style="font-size: 12px; color: black;" id="BT_Add" type="button"
				value="查询" name="BT_find"
				onclick="gotoquery('system/elecUserAction_home.do')">&nbsp;&nbsp;
				<%
					if (popedom.contains("l")) {
				%> <input style="font-size: 12px; color: black;" id="BT_Add"
				type="button" value="添加用户" name="BT_Add"
				onclick="openWindow('system/elecUserAction_add.do','700','400')">
				<%
					}
				%></td>
		</tr>
		<tr>
			<td class="ta_01" align="center" bgColor="#f5fafe" colspan="4">
				<table cellspacing="0" cellpadding="1" rules="all"
					bordercolor="gray" border="1" id="DataGrid1"
					style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
					<tr
						style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
						<td align="center" width="20%" height=22
							background="${pageContext.request.contextPath }/images/tablehead.jpg">登录名</td>
						<td align="center" width="20%" height=22
							background="${pageContext.request.contextPath }/images/tablehead.jpg">用户姓名</td>
						<td align="center" width="10%" height=22
							background="${pageContext.request.contextPath }/images/tablehead.jpg">性别</td>
						<td align="center" width="20%" height=22
							background="${pageContext.request.contextPath }/images/tablehead.jpg">联系电话</td>
						<td align="center" width="10%" height=22
							background="${pageContext.request.contextPath }/images/tablehead.jpg">是否在职</td>
						<td width="10%" align="center" height=22
							background="${pageContext.request.contextPath }/images/tablehead.jpg">编辑</td>
						<td width="10%" align="center" height=22
							background="${pageContext.request.contextPath }/images/tablehead.jpg">删除</td>
					</tr>
					<s:if test="#request.userList!=null && #request.userList.size()>0">
						<s:iterator value="%{#request.userList}" var="user">
							<tr onmouseover="this.style.backgroundColor = 'white'"
								onmouseout="this.style.backgroundColor = '#F5FAFE';">
								<td style="HEIGHT: 22px" align="center" width="20%"><s:property
										value="%{#user.logonName}" /></td>
								<td style="HEIGHT: 22px" align="center" width="20%"><a
									href="#"
									onclick="openWindow('system/elecUserAction_edit.do?userID=<s:property value="%{#user.userID}"/>&viewflag=1','700','400');">
										<s:property value="%{#user.userName}" />
								</a></td>
								<td style="HEIGHT: 22px" align="center" width="10%"><s:property
										value="%{#user.sexID}" /></td>
								<td style="HEIGHT: 22px" align="center" width="20%"><s:property
										value="%{#user.contactTel}" /></td>
								<td style="HEIGHT: 22px" align="center" width="10%"><s:property
										value="%{#user.isDuty}" /></td>

								<td align="center" style="HEIGHT: 22px" align="center"
									width="10%">
									<%
										if (popedom.contains("n")) {
									%> <a href="#"
									onclick="openWindow('system/elecUserAction_edit.do?userID=<s:property value="%{#user.userID}"/>','700','400');">
										<img src="${pageContext.request.contextPath }/images/edit.gif"
										border="0" style="CURSOR: hand">
								</a> <%
 	}
 %>
								</td>

								<td align="center" style="HEIGHT: 22px" align="center"
									width="10%">
									<%
										if (popedom.contains("m")) {
									%> <a
									href="system/elecUserAction_delete.do?userID=<s:property value='%{#user.userID}'/>"
									onclick="return confirm('你确定要删除  <s:property value="%{#user.userName}"/>？')">
										<img
										src="${pageContext.request.contextPath }/images/delete.gif"
										width="16" height="16" border="0" style="CURSOR: hand">
								</a> <%
 	}
 %>
								</td>
							</tr>
						</s:iterator>
					</s:if>
				</table>
			</td>
		</tr>
		<!-- ly add start-->
		<tr>
			<td width="100%" height="1" colspan="4">
				<table border="0" width="100%" cellspacing="0" cellpadding="0">
					<%
						PageBean pagebean = (PageBean) request.getAttribute("page");
					%>
					<tr>
						<td width="15%" align="left">总记录数：<%=pagebean.getTotalResult()%>条
						</td>
						<td width="14%" align="right"></td>
						<%
							if (pagebean.getFirstPage()) {
						%>
						<td width="8%" align="center">首页&nbsp;&nbsp;|</td>
						<td width="10%" align="center">上一页&nbsp;&nbsp;&nbsp;|</td>
						<%
							} else {
						%>
						<td width="8%" align="center"><u><a href="#"
								onClick="gotopage('system/elecUserAction_home.do','start')">首页&nbsp;&nbsp;|</a></u></td>
						<td width="10%" align="center"><u><a href="#"
								onClick="gotopage('system/elecUserAction_home.do','prev')">上一页&nbsp;&nbsp;&nbsp;|</a></u></td>
						<%
							}
						%>
						<%
							if (pagebean.getLastPage()) {
						%>
						<td width="10%" align="center">下一页&nbsp;&nbsp;&nbsp;|</td>
						<td width="8%" align="center">末页</td>
						<%
							} else {
						%>
						<td width="10%" align="center"><u><a href="#"
								onClick="gotopage('system/elecUserAction_home.do','next')">下一页&nbsp;&nbsp;&nbsp;|</a></u></td>
						<td width="8%" align="center"><u><a href="#"
								onClick="gotopage('system/elecUserAction_home.do','end')">末页</a></u></td>
						<%
							} 
						%>
						<td width="6%" align="center">第<%=pagebean.getPageNo()%>页
						</td>
						<td width="6%" align="center">共<%=pagebean.getSumPage()%>页
						</td>
						<td width="21%" align="right">至第<input size="1" type="text"
							name="goPage">页 <u>
							<a href="#"	onClick="gotopage('system/elecUserAction_home.do','go')">确定</a></u>
						</td>

						<td>
							<input type="hidden" name="pageNO" value="<%=pagebean.getPageNo()%>">
						</td>
						<td>
							<input type="hidden" name="prevpageNO" value="<%=(pagebean.getPageNo() - 1)%>">
						</td>
						<td>	
							<input type="hidden" name="nextpageNO" value="<%=(pagebean.getPageNo() + 1)%>">
						</td>
						<td>
							<input type="hidden" name="sumPage" value="<%=pagebean.getSumPage()%>">
						</td>
						<td>
							<input type="hidden" name="pageSize" value="">
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<!-- ly add  end-->
	</TBODY>
</table>
