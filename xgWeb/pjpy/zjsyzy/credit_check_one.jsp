<%@ page language="java" contentType="text/html; charset=GBK"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles"
	prefix="tiles"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-template"
	prefix="template"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-nested"
	prefix="nested"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" lang="gb2312">
	<head>
		<title><bean:message key="lable.title" /></title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<meta http-equiv="Pragma" http-equiv="no-cache" />
		<meta http-equiv="Cache-Control"
			http-equiv="no-cache, must-revalidate" />
		<meta http-equiv="Expires" http-equiv="0" />

		<meta name="Copyright" content="正方软件 zfsoft" />
	</head>
	<link rel="icon" href="images/icon.ico" type="image/x-icon" />
	<link id="csss" rel="stylesheet" rev="stylesheet" href="style/main.css"
		type="text/css" media="all" />
	<base target="_self">
	<link id="csssDate" rel="stylesheet" rev="stylesheet"
		href="js/calendar.css" type="text/css" media="all" />
	<script language="javascript">
</script>
	<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
%>
	<body onload="checkWinType();document.all('buttonClose').focus()">
		<script language="javascript" src="js/function.js"></script>
		<script type="text/javascript" src="js/calendar.js"></script>
		<script type="text/javascript" src="js/calendar-zh.js"></script>
		<script type="text/javascript" src="js/calendar-setup.js"></script>
		<html:form action="/data_search" method="post">
			<div class="title">
				<div class="title_img" id="title_m">
					当前所在位置：评奖评优 - 审核 - 荣誉称号审核 - 单个荣誉称号审核
				</div>
			</div>
<%--			<input type="hidden" name="pkVal"--%>
<%--				value="<bean:write name="xn||nd||xh||rychdm"/>" />--%>
				<input type="hidden" id="tg" name="tg" value="${rs.yesNo }" />
				<input type="hidden" id="res" name="res" value="${mes }"/>
				<table width="100%" align="center" class="tbstyle">
				<thead>
					<tr style="height:22px">
						<td colspan="4" align="center">
							单个荣誉称号审核
						</td>
					</tr>
				</thead>
				<tr style="height:22px">
					<td align="right">
						学号：
					</td>
					<td align="left"  id="selxh">
						<bean:write name="rs" property="xh"/>
						<input type="hidden" name="xh" id="xh" value="<bean:write name="rs" property="xh"/>"/>
					</td>
					<td align="right">
						年度：
					</td>
					<td align="left">
						<bean:write name="rs" property="nd"/>
						<input type="hidden" name="nd" id="nd" value="<bean:write name="rs" property="nd"/>"/>
					</td>
				</tr>
				<tr style="height:22px">
					<td align="right">
						姓名：
					</td>
					<td align="left">
						<bean:write name="rs" property="xm"/>
					</td>
					<td align="right">
						学年：
					</td>
					<td align="left">
						<bean:write name="rs" property="xn"/>
						<input type="hidden" name="xn" id="xn" value="<bean:write name="rs" property="xn"/>"/>
						<input type="hidden" name="xq" id="xq" value="<bean:write name="rs" property="xq"/>"/>
					</td>
				</tr>
				<tr style="height:22px">
					<td align="right">
						性别：
					</td>
					<td align="left">
						<bean:write name="rs" property="xb"/>
					</td>
					<td align="right">
						荣誉称号：
					</td>
					<td align="left">
						<bean:write name="rs" property="rychmc"/>
						<input type="hidden" name="rychmc" id="rychmc" value="<bean:write name="rs" property="rychmc"/>"/>
						<input type="hidden" name="rychdm" id="rychdm" value="<bean:write name="rs" property="rychdm"/>"/>
					</td>
				</tr>
				<tr style="height:22px">
					<td align="right">
						年级：
					</td>
					<td align="left">
						<bean:write name="rs" property="nj"/>
					</td>
					<td align="right">
						德育成绩：
					</td>
					<td align="left">
						${rs.dcj }
					</td>
				</tr>
				<tr style="height:22px">
					<td align="right">
						<bean:message key="lable.xsgzyxpzxy" />：
					</td>
					<td align="left">
						<bean:write name="rs" property="xymc"/>
					</td>
					<td align="right">
						智育成绩：
					</td>
					<td align="left">
						${rs.zcj }
					</td>
				</tr>
				<tr style="height:22px">
					<td align="right">
						专业：
					</td>
					<td align="left">
						<bean:write name="rs" property="zymc"/>
					</td>
					<td align="right">
						技能加分：
					</td>
					<td align="left">
						${rs.jnjf }
					</td>
				</tr>	
				<tr style="height:22px">
					<td align="right">
						班级：
					</td>
					<td align="left">
						<bean:write name="rs" property="bjmc"/>
					</td>
					<td align="right">
						综合测评成绩：
					</td>
					<td align="left">
						${rs.cpzf }
					</td>					
				</tr>
				<tr>
					<td align="right">
						审核：
					</td>
					<td align="left" colspan="3">
						<html:select property="yesNo" styleId="yesNo" name="rs">
							<html:options collection="chkList" property="en"
								labelProperty="cn" />
						</html:select>
					</td>
				</tr>

			</table>
			<div class="buttontool" align="center">
				
				<button type="button" class="button2"
					onclick="if (document.getElementById('yesNo').value==document.getElementById('tg').value) {alert('您未作任何修改！');return;} else refreshForm('/xgxt/pjpy_zjsyzy.do?method=saveCheckCredit');"
					style="width:80px" id="buttonSave">
					保 存
				</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="button2" onclick="showTopWin('/xgxt/stu_info_details.do?xh=' + document.getElementById('selxh').innerText, 800, 600)" style="width:90px"
					id="buttonQuery">
					查看学生信息
				</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="button2" onclick="Close();return false;" style="width:80px"
					id="buttonClose">
					关 闭
				</button>
				<logic:present name="result">
					<logic:equal value="true" name="result">
						<script>
							alert('操作成功!');
							Close();
							window.dialogArguments.document.getElementById('search_go').click();
						</script>
					</logic:equal>
					<logic:equal value="false" name="result">
						<script>
							alert("" + document.getElementById("res").value);
							Close();
							window.dialogArguments.document.getElementById('search_go').click();
						</script>
					</logic:equal>					
				</logic:present>
			</div>
		</html:form>
	</body>
</html>
