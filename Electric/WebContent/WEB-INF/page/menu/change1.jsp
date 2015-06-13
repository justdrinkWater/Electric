<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<HTML xmlns:v="urn:schemas-microsoft-com:vml"
	xmlns:o="urn:schemas-microsoft-com:office:office"
	xmlns="http://www.w3.org/TR/REC-html40">
<HEAD>
<TITLE>name</TITLE>
<STYLE type=text/css>
BODY {
	MARGIN: 0px;
	BACKGROUND-COLOR: #ffffff
}

BODY {
	COLOR: #000000
}

TD {
	COLOR: #000000
}

TH {
	COLOR: #000000
}
</STYLE>

<STYLE>
BODY {
	SCROLLBAR-FACE-COLOR: #cccccc;
	SCROLLBAR-HIGHLIGHT-COLOR: #ffffff;
	SCROLLBAR-SHADOW-COLOR: #ffffff;
	SCROLLBAR-3DLIGHT-COLOR: #cccccc;
	SCROLLBAR-ARROW-COLOR: #ffffff;
	SCROLLBAR-TRACK-COLOR: #ffffff;
	SCROLLBAR-DARKSHADOW-COLOR: #cccccc
}
</STYLE>
<script type="text/javascript">
	var screen = false;
	i = 0;
	width = 0;
	function shiftwindow() {
		if (parent.main.cols == "170,1%,*") {
			parent.main.cols = '0,1%,99%';
			document.all.image.src = "${pageContext.request.contextPath }/images/you.gif";
		} else if (parent.main.cols == "0,1%,99%") {
			parent.main.cols = '170,1%,*';
			document.all.image.src = "${pageContext.request.contextPath }/images/zuo.gif";
		}
	}
</script>
</HEAD>
<BODY MS_POSITIONING="GridLayout">
	<table width=1 style="cursor: hand" height="100%" background=""
		cellspacing="0" cellpadding="0">
		<tr>
			<td onclick="shiftwindow()" title="全屏/半屏" background="" width="20">

				<p align="center">
					<img id="image"
						src="${pageContext.request.contextPath }/images/zuo.gif" width="9"
						height="79">
				</p>

			</td>
		</tr>
	</table>
</body>
</html>
