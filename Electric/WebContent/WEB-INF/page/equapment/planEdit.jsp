



<%@ page language="java" pageEncoding="UTF-8"%>



<html>

	<head>
		<script language="javascript" src="${pageContext.request.contextPath }/script/calendar.js" charset="gb2312"></script>
		<LINK href="${pageContext.request.contextPath }/css/Style.css" type="text/css" rel="stylesheet">
		<script type='text/javascript' src="${pageContext.request.contextPath }/script/validate.js"></script>


<SCRIPT type="text/javascript">
function ini(){
   document.all.devType.focus();
}
function check(){
         var theForm = document.forms[0];
    if(!checkNull(theForm.devType))
		{
			alert("请选择设备类型");
			theForm.devType.focus(); 
			return false;
		} 
	if(Trim(theForm.devType.value)==""){
	
	    	alert("请选择设备类型");
			theForm.devType.focus();
			return false;
	    }
	if(Trim(theForm.devName.value)==""){
	
	    	alert("请输入设备名称");
			theForm.devName.focus();
			return false;
	    }
	    
	    /*if(Trim(theForm.trademark.value)==""){
	
	    	alert("请输入品牌");
			theForm.trademark.focus();
			return false;
	    }*/
	    
	    /*if(Trim(theForm.specType.value)==""){
	
	    	alert("请输入规格型号");
			theForm.specType.focus();
			return false;
	    }*/

	     if(Trim(theForm.quality.value)==""){
	
	    	alert("请输入数量");
			theForm.quality.focus();
			return false;
	    }
	    if(Trim(theForm.qunit.value)==""){
	
	    	alert("请输入数量单位");
			theForm.qunit.focus();
			return false;
	    }

	     /*if(Trim(theForm.useUnit.value)==""){
	
	    	alert("请输入使用单位");
			theForm.useUnit.focus();
			return false;
	    }*/
	     if(Trim(theForm.jctId.value)==""){
	
	    	alert("请输入所属单位");
			theForm.jctId.focus();
			return false;
	    }
	    
	    if(Trim(theForm.planDate.value)==""){
	
	    	alert("请输入计划时间");
			theForm.planDate.focus();
			return false;
	    }
	    
	    if (theForm.configure.value.length >25) {
					alert("配置的长度不能超过25个汉字！");
					theForm.configure.focus();
					return false;
				}
	    
	    /*if(Trim(theForm.adjustPeriod.value)==""){
	
	    	alert("请输入校准周期");
			theForm.adjustPeriod.focus();
			return false;
	    }*/
	    
	    /*if(Trim(theForm.overhaulPeriod.value)==""){
	
	    	alert("请输入检修周期");
			theForm.overhaulPeriod.focus();
			return false;
	    }*/
	    
	    
	 if(window.opener)
	{
		document.Form1.action="updateDevicePlan.do";
		document.Form1.submit();
		alert("保存成功！");
	    window.opener.Pub.submitActionWithForm('Form1','toDevicePlan.do','F1');
	}
	self.close();
}

function checkNumber(item){
			if(item.value != ""){
				isNumber1(item);
			}
		}
		
		function isNumber1(obj){
					
			if(obj == null){
				alert("对象为空!");
			return false;
			}
			
			var v = obj.value;
				
			var pattern = /^[0-9]*[1-9][0-9]*$/;
			flag = pattern.test(v);			
			if(!flag){
				alert("请输正整数!");
				
				obj.select();
				obj.focus();
				return false;
			}else{
				return true;
			}
		}
		
		function checkDecimal(item){
			if(item.value != "0" && item.value != "")
			{
				isDecimal(item);
			}
		}
		
		function isDecimal(obj){
				if(obj == null)
					alert("对象为空");
					
				var v = obj.value;
					
				var pattern = /^[0-9]+\.\d{1,2}$/;
				flag = pattern.test(v);
				
				if(!flag){
					alert("输入格式为: 0.00");			
					obj.select();
					obj.focus();
					return false;
				}else{
					return true;
				}
			}
</SCRIPT>
		<title>购置计划信息</title>
	</head>

	<body >

		<form name="Form1" method="post">
		<br>
			
			<table cellSpacing="1" cellPadding="5" width="700" align="center" bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">

				<tr>
			        <td class="ta_01" colSpan="4" align="center" background="${pageContext.request.contextPath }/images/b-info.gif">
			         <font face="宋体" size="2"><strong>购置计划编辑</strong></font>
			        </td>
		         </tr>
				<tr>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						设备类型：



					</td>
					<td class="ta_01" bgColor="#ffffff" width="32%">
						<select name="devType" id="devType" class="bg">
							<option value="">
								设备类型
							</option>
						
						
						
						
					        <option value="1">
								电力设备dd
							</option>
					
				 
						
						
					        <option value="2">
								天线设备
							</option>
					
				 
						
						
					        <option value="3">
								通讯设备
							</option>
					
				 
						
						
					        <option value="4">
								防雷设备
							</option>
					
				 
						
						
					        <option value="5">
								办公设备
							</option>
					
				 
						
						 <option value="6" selected>
								电视机房设备
							</option>
						
						
				 
						
						
					        <option value="7">
								发电机房设备
							</option>
					
				 
				
						</select>&nbsp;<font color="#FF0000">*</font>
					</td>
					<td width="18%" align="center" bgColor="#f5fafe" class="ta_01">
						设备名称：



					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input name="devName" type="text" maxlength="50" id="devName" size="19" value="TV监视器">&nbsp;<font color="#FF0000">*</font>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input name="trademark" type="text" maxlength="25" id="trademark" size="19" value="">&nbsp;<!-- font color="#FF0000">*</font -->
					</td>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						规格型号：



					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input name="specType" type="text" maxlength="25" id="specType" size="19" value="JVC">&nbsp;<!-- font color="#FF0000">*</font -->
					</td>

				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						厂&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;家：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input name="produceHome" type="text" maxlength="25" id="produceHome" size="19" value="JVC公司">
					</td>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input name="quality" type="text" maxlength="10" style="text-align:left" id="quality" style="width:40" value="1" onblur='checkNumber(this)'>
						<input name="qunit" type="text" maxlength="5" id="qunit" style="width:105" value="">&nbsp;<font color="#FF0000">*</font>
					</td>

				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;途：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input name="useness" type="text" maxlength="25" id="useness" size="19" value="">
					</td>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						产&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input name="produceArea" type="text" maxlength="25" id="produceArea" size="19" value="">
					</td>

				</tr>

				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						金&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input name="devExpense" type="text" maxlength="17" id="devExpense" size="19" value="1.00" onblur='checkDecimal(this)'> 元


						

					</td>
					<td class="ta_01" align="center" bgColor="#f5fafe">使用单位：



					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input name="useUnit" type="text" maxlength="25" id="useUnit" size="19" value="电视机房">&nbsp;<!-- font color="#FF0000">*</font -->
					</td>

				</tr>


				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						所属单位：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<select name="jctId" id="jctId" class="bg">
				    
		                <option value=""></option>
		            
							
					
				
						
						 <option value="1" selected>
								540
							</option>
						
						
				 
						
						
					        <option value="2">
								560
							</option>
					
				 
						
						
					        <option value="3">
								成都台
							</option>
					
				 
						
						
					        <option value="4">
								厦门台
							</option>
					
				 
						
						
					        <option value="5">
								553台
							</option>
					
				 
						
						
					        <option value="6">
								201台
							</option>
					
				 
						
						
					        <option value="7">
								202台
							</option>
					
				 
						
						
					        <option value="8">
								203台
							</option>
					
				 
						
						
					        <option value="9">
								哈尔滨台
							</option>
					
				 
						
						
					        <option value="10">
								西安台
							</option>
					
				 
						
						
					        <option value="11">
								中心
							</option>
					
				 
						
						
					        <option value="12">
								北京台
							</option>
					
				 
						
						
					        <option value="13">
								海南台
							</option>
					
				 
				
				
				
				
				
						</select>&nbsp;<font color="#FF0000">*</font>
					</td>
					<td class="ta_01" align="center" bgcolor="#f5fafe" height="22">计划时间：



					</td>
					<td class="ta_01" bgcolor="#ffffff" width="277">
						<input name="planDate" type="text" size="19" id="planDate" size="12" onclick="JavaScript:calendar(this)" value="2011-10-01">&nbsp;<font color="#FF0000">*</font>
					</td>

				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">校准周期：



					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input name="adjustPeriod" type="text" maxlength="4" id="adjustPeriod" size="12" value="" onblur='checkNumber(this)'>
						<select name="apunit" id="apunit">			
							<option value=""></option>


					


					

                                        
					       <option value="年" >年</option>
							<option value="月" >月</option>
					


						</select>&nbsp;<!-- font color="#FF0000">*</font -->
					</td>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						检修周期：
					</td>
					<td class="ta_01" bgColor="#ffffff">
						<input name="overhaulPeriod" type="text" maxlength="4" id="overhaulPeriod" size="12" value="" onblur='checkNumber(this)'>
						<select name="opunit" id="opunit">
							<option value=""></option>
											
							
							
							
												
							
							
							


                                                      
						      <option value="年">年</option>
							<option value="月">月</option>
							<option value="周" >周</option>
							<option value="日">日</option>
							
						</select>&nbsp;<!-- font color="#FF0000">*</font -->
					</td>
				</tr>

				<tr>
					<TD class="ta_01" align="center" bgColor="#f5fafe">
						配&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;置：
					</TD>
					<TD class="ta_01" bgColor="#ffffff" colSpan="3">
						<textarea name="configure" id="configure" style="WIDTH:88%" rows="3"></textarea>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" style="width: 100%" align="center" bgColor="#f5fafe" colSpan="4">
					<input type="hidden" name="devPlanId" value="5e0a7de7e02f4aba839112d1b1f85882">
						
						
						<input type="button" name="BT_Submit" value="保存" id="BT_Submit"  style="font-size:12px; color:black; height=22;width=55" onclick="return check();">
						<font face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
						
						
						<input style="font-size:12px; color:black; height=22;width=55" type="reset" value="关闭" ID="Reset1" NAME="Reset1" onClick="window.close();">
						<span id="Label1"></span>
					</td>
				</tr>
			</table>
			<br>
		</form>
		
	</body>
</html>
