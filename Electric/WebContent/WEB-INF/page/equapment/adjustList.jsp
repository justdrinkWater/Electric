<%@page import="com.sw.elec.util.PageBean"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<table cellSpacing="0" cellPadding="0" width="90%" align="center"
			bgColor="#f5fafe" border="0">
			<TR>
				<TD align="center"
					background="${pageContext.request.contextPath }/images/cotNavGround.gif"
					width=25><img
					src="${pageContext.request.contextPath }/images/yin.gif" width="15"></TD>
				<TD class="DropShadow"
					background="${pageContext.request.contextPath }/images/cotNavGround.gif"
					width=80>校准记录列表</TD>
				<td align="right" class="ta_01">
					<input type="button"
						name="BT_Search" value="查询" id="BT_Search"
						onclick="gotoquery('elecAdjustAction_home.do')" style="font-size: 12px; color: black;">
					<input type="button" name="BT_Search" value="导出" id="BT_Search"
						style="font-size: 12px; color: black;"
						onClick="openWindow('exportXJDevice.do?XorJ=X','600','400');">
					<input name="BT_Add" type="button"
						style="font-size: 12px; color: black;" id="BT_Add"
						onClick="openWindow('adjustMoreAdd.jsp',800,450,'添加');"
						value="批量添加" /> 
					<input type="button" name="BT_Search" value="导出设置"
						id="BT_Search" style="font-size: 12px; color: black;"
						onClick="openWindow('adjustExport.jsp?XorJ=X','600','400');">

				</td>
			</TR>
		</TABLE>
		<table cellSpacing="0" cellPadding="0" width="90%" align="center"
			bgColor="#f5fafe" border="0">
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">
					<table cellspacing="0" cellpadding="1" rules="all"
						bordercolor="gray" border="1" id="DataGrid1"
						style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
						<tr
							style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
							<td align="center" width="5%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">序号</td>
							<td align="center" width="23%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">设备名</td>
							<td align="center" width="9%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">校准周期</td>
							<td align="center" width="9%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">使用日期</td>
							<td align="center" width="9%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">校准状态</td>
							<td align="center" width="11%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">校准日期</td>
							<td align="center" width="13%" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">所属单位</td>
							<td width="16%" align="center" height=22
								background="${pageContext.request.contextPath }/images/tablehead.jpg">校准记录维护</td>
						</tr>
						<s:if test="#request.adjustList != null">
							<s:iterator value="%{#request.adjustList}" var="adjust">
								<tr onMouseOver="this.style.backgroundColor = 'white'" onMouseOut="this.style.backgroundColor = '#F5FAFE';">
									<td align="center" width="5%">
										<s:property value="#adjust.num"/>
									</td>
									<td align="center">
										<a href="javascript:;"onClick="openWindow('adjustEdit.jsp',800,450);"class="cl_01"> 
											<s:property value="#adjust.devName"/>
										</a>
									</td>
									<td align="center">
										<s:property value="#adjust.adjustPeriod"/>
									</td>
									<td align="center">
										<s:property value="#adjust.useDate"/>
									</td>
									<td align="center">
										<s:property value="#adjust.isAdjust"/>
									</td>
									<td align="center" width="11%">
										<s:property value="#adjust.adjustDate"/>
									</td>
									<td align="center" style="HEIGHT: 22px">
										<s:property value="adjust.jctID"/>
									</td>
									<td align="center" style="HEIGHT: 22px">
									<a href="javascript:;" onClick="openWindow('elecAdjustAction_add.do?devID=<s:property value="#adjust.devID"/>',800,450);" class="cl_01">添加</a>
									<a href="javascript:;" onClick="openWindow('elecAdjustAction_edit.do?devID=<s:property value="#adjust.devID"/>',800,450);" class="cl_01">修改</a> 
									<a onclick="return confirm('确认要删除['<s:property value="#adjust.devName"/>']吗？')" href="javascript:Pub.submitActionWithForm('Form2','delDeviceX.do?','Form1')"class="cl_01">删除</a> 
									<a href="javascript:;" onClick="openWindow('adjustQuery.jsp?');" class="cl_01">查看</a>
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
									<a href="#" onclick="gotopage('equapment/elecAdjustAction_home.do','start')">首&nbsp;页&nbsp;&nbsp;|</a>
								</u>
								
							</td>
							<td width="7%" align="center">
								<u>
									<a href="#" onclick="gotopage('equapment/elecAdjustAction_home.do','prev')">上一页&nbsp|</a>
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
									href="#" onclick="gotopage('equapment/elecAdjustAction_home.do','next')">下一页&nbsp;|</a></u></td>
							<td width="5%" align="center"><u><a
									href="#" onclick="gotopage('equapment/elecAdjustAction_home.do','end')">末页</a></u></td>
							<%} %>
							<td width="6%" align="center">第<%=pagebean.getPageNo() %>页</td>
							<td width="6%" align="center">共<%=pagebean.getSumPage() %>页</td>
							<td width="18%" align="right">至第<input type="text"
								name="goPage" size="3" style="width: 50px">页 <u><a
									href="#" onclick="gotopage('equapment/elecAdjustAction_home.do','go')">确定</a></u></td>
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
