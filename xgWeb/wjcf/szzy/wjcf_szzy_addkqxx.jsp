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
	<body>
		<script language="javascript" src="js/function.js"></script>
		<script language="javascript" src="wjcf/szzy/szzyjs/szzyjs.js"></script>
		<script language="javascript" src="js/wjcfFuction.js"></script>
		<script type="text/javascript" src="js/calendar.js"></script>
		<script type="text/javascript" src="js/calendar-zh.js"></script>
		<script type="text/javascript" src="js/calendar-setup.js"></script>
		<html:form action="/szzykqxxwh.do" method="post">
		<html:text  property="xn_id" styleId="xn_id" style="display:none;"></html:text>
			<div class="title">
				<div class="title_img" id="title_m">
					当前所在位置：违纪处分 - 学生考勤 - 考勤信息维护 - 增加考勤信息
				</div>
			</div>
			<input type="hidden" name="pkValue" id="pkValue"
				value="<bean:write name='pkValue' scope="request" />" />
				<input type="hidden" name="pkValue2" id="pkValue2"
				value="<bean:write name='pkValue2' scope="request"/>" />
			<table width="100%" align="center" class="tbstyle">
				<thead>
					<tr style="height:22px">
						<td colspan="4" align="center">
							考勤信息
						</td>
					</tr>
				</thead>
				<tr style="height:22px">
					<td align="right">
						学年：
					</td>
					<td align="left">
						<html:text name="rs" property="xn" styleId="xn" readonly="true"></html:text>
					</td>
					<td align="right">
						学期：
					</td>
					<td align="left">
						<html:text name="rs" property="xq" styleId="xq" readonly="true"></html:text>
					</td>
				</tr>
				<tr style="height:22px">
					<td align="right">
						班级名称：
					</td>
					<td align="left">
						<html:hidden name="rs" property="bjdm"/>
						<html:text name="rs" property="bjmc" readonly="true"></html:text>
					</td>
					<td align="right">
						课程名称：
					</td>
					<td align="left">
						<html:hidden name="rs" property="kcdm"/>
						<html:text name="rs" property="kcmc" readonly="true"></html:text>
					</td>
				</tr>
				<tr style="height:22px">
					<td align="right">
						应到人数：
					</td>
					<td align="left">
						<html:text property="ydrs" name="rs" readonly="true"></html:text>
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr style="height:22px">
					<td align="right">
						<font color="red">*</font>实到人数：
					</td>
					<td align="left">
						<html:hidden name="rs" property="ydrs" styleId="ydrs"/>
						<html:text name="rs" property="sdrs" onblur="CheckData(this)" styleClass="inputtext" ></html:text>
					</td>
					<td align="right">
						请假人数：
					</td>
					<td align="left">
						<html:text name="rs" property="qjrs" onblur="CheckData(this)" styleClass="inputtext"></html:text>
					</td>
				</tr>
				<tr style="height:22px">
					<td align="right">
						病假,事假：
					</td>
					<td align="left">
						<html:text name="rs" property="bjsj" styleId="bjsj" onblur="CheckData(this)" styleClass="inputtext"></html:text>
					</td>
					<td align="right">
						公假：
					</td>
					<td align="left">
						<html:text name="rs" property="gj" styleId="gj" onblur="CheckData(this)" styleClass="inputtext"></html:text>
					</td>
				</tr>
				<tr style="height:22px">
					<td align="right">
						考勤员：
					</td>
					<td>
						<html:text name="rs" property="kqy" styleId="kqy" styleClass="inputtext" styleClass="inputtext" maxlength="15"></html:text>
					</td>
					<td align="right">
						<font color="red">*</font>抽查日期：
					</td>
					<td align="left">
					<logic:notPresent name="ispk">
						<html:text name="rs" style="cursor:hand;inputtext" styleId="rq"
							property="rq"
							readonly="true"
							onclick="return showCalendar('rq','yy-mm-dd');"
							/>
					</logic:notPresent>
					<logic:equal value="yes" name="ispk">
						<html:text name="rs" style="inputtext" styleId="rq"
							property="rq"
							readonly="true"/>
					</logic:equal>
					</td>
				</tr>							
				<tr style="height:22px">				
					<td align="right">
						<font color="red">*</font>抽查开始时间：
					</td>
					<td align="left">
					<logic:notPresent name="ispk">
						<html:text name="rs" property="kssj" onblur="check_time('kssj')" styleId="kssj" styleClass="inputtext" maxlength="5"></html:text>
					</logic:notPresent>
					<logic:equal value="yes" name="ispk">
						<html:text name="rs" property="kssj" readonly="true" styleId="kssj" styleClass="inputtext" maxlength="5"></html:text>
					</logic:equal>
					</td>
					<td align="right">
						<font color="red">*</font>抽查结束时间：
					</td>
					<td align="left">
					<logic:notPresent name="ispk">
						<html:text name="rs" property="jssj" onblur="check_time('jssj')" styleId="jssj" styleClass="inputtext" maxlength="5"></html:text>
					</logic:notPresent>
					<logic:equal value="yes" name="ispk">
						<html:text name="rs" property="jssj" readonly="true" styleId="jssj" styleClass="inputtext" maxlength="5"></html:text>
					</logic:equal>
					</td>				
				</tr>
				     <html:hidden property="kssj" styleId="kssj" value="08:00"/>
				     <html:hidden property="jssj" styleId="jssj" value="09:00"/>		   
				<tr style="height:22px">
					<td align="right">
						备注：
					</td>
					<td align="left" colspan="3">
						<html:textarea name="rs" property="bz" cols="56" rows="3" styleClass="inputtext"></html:textarea>
					</td>
				</tr>
			</table>
			<div class="buttontool" align="center">
			<logic:equal value="yes" name="writeAble" scope="request">
				<logic:notPresent name="ispk">
					<button type="button" class="button2"
					onclick="savedata5('sdrs-rq-kssj-jssj','szzysavekqxx.do?pkVal=')"
					style="width:80px" id="buttonSave">
					保 存
				</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				</logic:notPresent>
				<logic:equal value="yes"  name="ispk">
					<button type="button" class="button2"
					onclick="savedata5('sdrs-rq-kssj-jssj','szzysavekqxx.do?pkVal=')"
					style="width:80px" id="buttonSave">
					修 改
				</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				</logic:equal>
				<button type="button" class="button2" onclick="Close();return false;" style="width:80px"
					id="buttonClose">
					关 闭
				</button>
				</logic:equal>
			</div>
		</html:form>
		<logic:equal value="yes" name="isszzy">
			<script>
				alert("操作成功!");
				Close();
				window.dialogArguments.document.getElementById('search_go').click();
			</script>
		</logic:equal>
		<logic:equal value="no" name="isszzy">
			<script>
				alert("操作失败!");
				Close();
				window.dialogArguments.document.getElementById('search_go').click();
			</script>
		</logic:equal>
	</body>
</html>
