<%@page import="com.sw.elec.util.PageBean"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>设备购置计划</title>
<link href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/function.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/pub.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/page.js"></script>
<script type="text/javascript">
	function CheckOthers(form) {
		for (var i = 0; i < form.elements.length; i++) {
			var e = form.elements[i];
			if (e.checked == false) {
				e.checked = true;// form.chkall.checked;
			} else {
				e.checked = false;
			}
			e.checked = false;
		}
	}
	function CheckAll(form) {
		for (var i = 0; i < form.elements.length; i++) {
			var e = form.elements[i];
			e.checked = true// form.chkall.checked;
		}
	}
	function jsDPToD() {
		document.Form1.direction.value = "";
		document.Form1.goPage.value = "";
		var devplan = document.Form2.devPlanId;
		var devplanid = "";
		var flag = 0;
		if (typeof (devplan) == "undefined") {
			return;
		}
		if (typeof (devplan.length) != "undefined") { //多个

			for (var i = 0; i < devplan.length; i++) {
				if (devplan[i].checked == true) {

					devplanid += devplan[i].value + ",";
					flag = 1;
				}
			}
		} else { //只有一个
			if (devplan.checked == true) {
				devplanid += devplan.value + ",";
				flag = 1;
			}
		}
		document.Form1.plantodev.value = devplanid;
		if (flag == 1) {
			Pub.submitActionWithForm('Form2', 'devicePlanToDevice.do', 'Form1');
		}
	}
	function savewithopener(path) {
		changeformvalue();
		document.Form1.pageNo.value = "1";
		document.Form1.direction.value = "";
		document.Form1.goPage.value = document.Form1.pageNo.value;
		Pub.submitActionWithForm('Form2', path, 'Form1');
	}
</script>

</head>
<body>
	<table cellspacing="1" cellpadding="0" width="90%" align="center" bgcolor="#f5fafe" border="0">
		<tr>
			<td class="ta_01" align="center"
				background="${pageContext.request.contextPath }/images/b-info.gif">
				<font face="宋体" size="2"><strong>设备购置计划</strong></font>
			</td>
		</tr>
		<TR height=10>
			<td></td>
		</TR>
		<tr>
			<td>
				<s:form name="Form1" method="post" id="Form1" cssStyle="margin: 0px;">
				
				<s:hidden name="searchFlag" id="searchFlag" value="1"/>
				<input type="hidden" name="pageNO" value=""> 
				<input type="hidden" name="pageSize" value="">
				
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
								id="devName" size="22" value="" /></td>
						</tr>
						<tr>
							<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">计划时间：</td>
							<td class="ta_01" width="300">
								<input name="planDatef"	type="date" id="planDatef" size="10" value="">
									 ~ 
								 <input
								name="planDatet" type="date" id="planDatet" size="10" value="">
							</td>

							<td width="100" class="ta_01" align="center" bgcolor="#f5fafe"
								height="22">设备类型：</td>
							<td class="ta_01" width="247">
								<s:if test="#request.devTypes != null">
									<s:select list="%{#request.devTypes}" id="devType" name="devType" cssClass="bg"
												headerKey="" headerValue="全部"
												listKey="ddlCode" listValue="ddlName">
									</s:select>
								</s:if>
							</td>
						</tr>
					</table>
				</s:form> <br>
				<s:form name="Form2" id="Form2" cssStyle="margin: 0px;">

					<table cellpadding="0" cellspacing="0" border="0" width="100%"
						bgcolor="#f5fafe">
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

					<table cellpadding="0" cellspacing="0" border="0" width="100%"
						bgcolor="#f5fafe">
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
