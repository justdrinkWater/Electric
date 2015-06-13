<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<title>load</title>
<link href="${pageContext.request.contextPath }/css/Style.css"
	type="text/css" rel="stylesheet" />
</head>

<body>
	<table width="100%" border="0" id="table8">
		<tr>
			<s:if test="#request.comMsg != null">
				<s:iterator value="%{#request.comMsg}" var="com">
					<td align="left" valign="middle" style="word-break: break-all">
						<span class="style1">&nbsp;&nbsp;&nbsp;${com.devRun}</span>
					</td>
				</s:iterator>
			</s:if>
		</tr>
	</table>
</body>
</html>