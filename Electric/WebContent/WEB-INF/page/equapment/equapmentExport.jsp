<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>导出</title>
<link href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/function.js"></script>
<script src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	function Add() {

		allRoles = document.getElementById("colname1");
		selectRoles = document.getElementById("colname2");

		for (var i = 0; i < allRoles.options.length; i++) {
			if (allRoles.options[i].selected == true) {
				var ifExit = false;
				for (var n = 0; n < selectRoles.options.length; n++) {
					if (selectRoles.options[n].value == allRoles.options[i].value) {
						ifExit = true;
					}
				}
				if (ifExit == false) {
					selectRoles.add(new Option(allRoles.options[i].text,
							allRoles.options[i].value));
				} else {
					alert(yicunzai);
				}
				allRoles.remove(i);
				i--;
			}
		}

		setValue();
	}

	function Remove() {

		allRoles = document.getElementById("colname1");
		selectRoles = document.getElementById("colname2");

		for (var i = 0; i < selectRoles.options.length; i++) {
			if (selectRoles.options[i].selected == true) {
				allRoles.add(new Option(selectRoles.options[i].text,
						selectRoles.options[i].value));
				selectRoles.remove(i);
				i--;
			}
		}

		setValue();
	}

	function upcol() {

		var rightcol = document.getElementById("colname2");
		var selectflag = 0;

		for (var i = 0; i < rightcol.options.length; i++) {

			if (rightcol.options[i].selected == true && i != 0) {

				var temptext = rightcol.options[i].text;
				var tempvalue = rightcol.options[i].value;

				rightcol.options[i].value = rightcol.options[i - 1].value;
				rightcol.options[i].text = rightcol.options[i - 1].text;
				rightcol.options[i - 1].value = tempvalue;
				rightcol.options[i - 1].text = temptext;

				selectflag = i - 1;
				break; //这个标志表明目前只能一次移一行，不支持多选

			}
		}

		for (var i = 0; i < rightcol.options.length; i++) {
			rightcol.options[i].selected = false;
		}

		rightcol.options[selectflag].selected = true;

		setValue();
	}

	function downcol() {

		var rightcol = document.getElementById("colname2");
		var selectflag = 0;

		for (var i = 0; i < rightcol.options.length; i++) {

			if (rightcol.options[i].selected == true
					&& i != rightcol.options.length - 1) {

				var temptext = rightcol.options[i].text;
				var tempvalue = rightcol.options[i].value;

				rightcol.options[i].value = rightcol.options[i + 1].value;
				rightcol.options[i].text = rightcol.options[i + 1].text;
				rightcol.options[i + 1].value = tempvalue;
				rightcol.options[i + 1].text = temptext;

				selectflag = i + 1;
				break; //这个标志表明目前只能一次移一行，不支持多选

			}
		}

		if (selectflag != 0) { //如果此标志为0，说明光标已经移到最下边，没有发生向下交换的行动
			for (var i = 0; i < rightcol.options.length; i++) {
				rightcol.options[i].selected = false;
			}

			rightcol.options[selectflag].selected = true;
		}

		setValue();

	}

	function setValue() {

		var rightcol = document.getElementById("colname2");
		var leftcol = document.getElementById("colname1");

		selectid = "";
		selectname = "";
		noselectid = "";
		noselectname = "";

		for (var m = 0; m < rightcol.options.length; m++) {
			if (m == rightcol.options.length - 1) {
				selectid += rightcol.options[m].value;
				selectname += rightcol.options[m].text;
			} else {
				selectid += rightcol.options[m].value + "#";
				selectname += rightcol.options[m].text + "#";
			}
		}

		for (var m = 0; m < leftcol.options.length; m++) {
			if (m == leftcol.options.length - 1) {
				noselectid += leftcol.options[m].value;
				noselectname += leftcol.options[m].text;
			} else {
				noselectid += leftcol.options[m].value + "#";
				noselectname += leftcol.options[m].text + "#";
			}
		}

 		document.Form1.names.value = selectname;
		document.Form1.fields.value = selectid;
		document.Form1.nonames.value = noselectname;
		document.Form1.nofields.value = noselectid; 

	}

	function checksubmit() {

		if (document.Form1.names.value == ""
				|| document.Form1.fields.value == "") {

			alert("请至少选择一列作为导出列");
			return;
		}
		$.ajax({  
	        type : "POST",  
	        url : "equapement/elecDeviceAction_setExportExcel.do",
	        data : $("#Form1").serialize(),  
	        success : function(msg) {
	        	window.opener.location.reload();
	        	window.close();
	        },
	        error:function(){
	        	alert("添加失败");
	        }
	    });
	}
</script>
</head>

<body onload="setValue()">
	<s:form id="Form1" name="Form1" method="POST">
		<br>
		<table border="0" width="100%" cellspacing="0" cellpadding="0">
			<tr>
				<td class="ta_01" align="center"
					background="${pageContext.request.contextPath }/images/b-info.gif">
					<font face="宋体" size="2"><strong>导出字段设置</strong></font>
				</td>
			</tr>
			<tr height=10>
				<td></td>
			</tr>

			<tr>
				<td width="100%">
					<table border="0" width="100%" cellspacing="3" cellpadding="0">
						<tr height=10>
							<TD width="1%"></TD>
							<TD width="30%" class="DropShadow" align="left"
								background="${pageContext.request.contextPath }/images/cotNavGround.gif"><img
								src="${pageContext.request.contextPath }/images/yin.gif"
								width="15">未导出字段列表</TD>
							<td width="16%">
							<TD width="34%" class="DropShadow" align="left"
								background="${pageContext.request.contextPath }/images/cotNavGround.gif"><img
								src="${pageContext.request.contextPath }/images/yin.gif"
								width="15">导出字段列表</TD>
							<td width="19%">
						</tr>

						<tr>
							<td width="1%"></td>
							<td width="84%" colspan="4">
								<table border="0" width="100%" cellspacing="0" cellpadding="0">
									<tr>
										<td width="30%" rowspan="4">
											<select size="15"
												name="colname1" multiple style="width: 200px" id="colname1"
												ondblclick="JavaScript:Add('colname1','colname2','colname')">
													<s:iterator value="#request.fields" var="field">
														<option value="<s:property value="key"/>">
															<s:property value="value"/>
														</option>
													</s:iterator>
											</select>
										</td>
										<td width="35%" rowspan="4" id="colnameDiv">
										<select
											size="15" name="colname2" id="colname2" multiple
											style="width: 200px"
											ondblclick="JavaScript:Remove('colname1','colname2','colname')">
										</select></td>
										<td width="20%"></td>
									</tr>
									<tr>
										<td width="90" align="center"><input name="DoAddb"
											type="button" value=">>" onClick="JavaScript:Add()"
											class=btn_mouseout
											onmouseover="this.className='btn_mouseover'"
											onmouseout="this.className='btn_mouseout'"
											style="width: 30px; font-size: 12px; color: black;">
										</td>
										<td width="120" align="center"><input name="doup"
											type="button" value="向上" onClick="upcol()" class=btn_mouseout
											onmouseover="this.className='btn_mouseover'"
											onmouseout="this.className='btn_mouseout'"
											style="width: 50px; font-size: 12px; color: black;">
										</td>
									</tr>
									<tr>
										<td width="90" align="center"><input name="DoDelb"
											type="button" value="<<"  onClick="
											JavaScript:Remove()" class=btn_mouseout
											onmouseover="this.className='btn_mouseover'"
											onmouseout="this.className='btn_mouseout'"
											style="width: 30px; font-size: 12px; color: black;">
										</td>
										<td width="120" align="center"><input name="dodown"
											type="button" value="向下" onClick="downcol()"
											class=btn_mouseout
											onmouseover="this.className='btn_mouseover'"
											onmouseout="this.className='btn_mouseout'"
											style="width: 50px; font-size: 12px; color: black;">
										</td>
									</tr>

									<tr>
										<td width="73">
										<INPUT type="hidden" name="names" id="names" value=""> 
										<INPUT type="hidden" name="fields" id="fields" value="">
										<INPUT type="hidden" name="nonames" id="nonames" value=""> 
										<INPUT type="hidden" name="nofields" id="nofields" value="">
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr height=10>
				<td></td>
			</tr>
			<tr height=20>
				<td
					background="${pageContext.request.contextPath }/images/b-info.gif"></td>
			</tr>
			<tr height=10>
				<td></td>
			</tr>
			<tr>
				<td align="center"><INPUT type="button" name="save" id="save"
					value="保存" onclick="checksubmit()"
					style="width: 60px; font-size: 12px; color: black;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
					style="width: 60px; font-size: 12px; color: black;" type="reset"
					value="关闭" id="Reset1" name="Reset1" onclick="window.close();">
				</td>
			</tr>
		</table>
	</s:form>
</body>
</html>

