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
<html>
	<head>
		<title><bean:message key="lable.title" />
		</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="Copyright" content="正方软件 zfsoft">
	</head>
	<link rel="icon" href="images/icon.ico" type="image/x-icon" />
	<link id="csss" rel="stylesheet" rev="stylesheet" href="style/main.css" type="text/css" media="all" />
	<link id="csss" rel="stylesheet" rev="stylesheet" href="js/calendar.css" type="text/css" media="all" />
	<%
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	
	<script language="javascript" src="js/stuinfoFunction.js"></script>
	<script language="javascript" src="js/commanFunction.js"></script>
	<script language="javascript" src="js/function.js"></script>
	<script language="javascript" src="js/xgutil.js"></script>
	<script type="text/javascript" src="/xgxt/dwr/engine.js"></script>
	<script type="text/javascript" src="/xgxt/dwr/util.js"></script>
	<script type='text/javascript' src='/xgxt/dwr/interface/xsfwzdzx.js'></script>
	<script>
		function save(){
			var ykfts = val('ykfts');
			var jscqts = val('jscqts');
			var xscqts = val('xscqts');
			
			ykfts = ykfts == null || ykfts=="" ? "0" : ykfts;
			jscqts = jscqts == null || jscqts=="" ? "0" : jscqts;
			xscqts = xscqts == null || xscqts=="" ? "0" : xscqts;
			
			if(filedNotNull('nd-yf-slbmdm','-')){
				if(toInt(ykfts)<toInt(jscqts)+toInt(xscqts)){
					alert('总出勤天数大于月开放天数！');
					return false;
				}else{
					xsfwzdzx.checkCqxx({nd:val('nd'),yf:val('yf'),slbmdm:val('slbmdm')},function(data){
						if(data == true){
							alert('您要添加的记录已经存在！');
							return false;
						}else{						
							refreshForm('xsfwzdzx.do?method=saveCqxx&doType=add');		
						}
					});
				}
			} else {
				alert ('请将带\*号的项目填写完整！');
				return false;
			}
		}
	</script>
	
	<base target="_self">
	<body>
		<html:form action="/xsfwzdzx.do">
			<div class="title">
				<div class="title_img" id="title_m">
					当前所在位置：日常事务 - 学生指导服务中心 - 出勤信息- 增加
				</div>
			</div>
				<table width="100%" class="tbstyle">
					<thead align="center">
						<tr>
							<td align="center" colspan="4">
								出勤信息
							</td>
						</tr>
					</thead>
					
					<tr>
						<td>
							<div align="right">
								<font color="red">*</font>受理部门：
							</div>
						</td>
						<td>
							<html:select property="slbmdm">
								<html:options collection="slbmList" property="slbmdm" labelProperty="slbmmc"/>
							</html:select>
						</td>
					</tr>
					<tr>
						<td align="right">
							<font color="red">*</font>年度：
						</td>
						<td>							
							<html:select property="nd">
								<html:options collection="ndList" property="nd" labelProperty="nd"/>
							</html:select>
						</td>						
					</tr>	
					<tr>
						<td align="right">
							<font color="red">*</font>月份：
						</td>
						<td>							
							<html:select property="yf">
								<html:options collection="yfList" property="yf" labelProperty="yf"/>
							</html:select>
						</td>						
					</tr>					
					<tr>
						<td align="right">
							月开放天数：
						</td>
						<td>
							<html:text property="ykfts" maxlength="2" onkeyup="value=value.replace(/[^\d]/g,'') "></html:text>
						</td>					
					</tr>
					<tr>
						<td align="right">
							教师出勤天数：
						</td>
						<td>
							<html:text property="jscqts" maxlength="2" onkeyup="value=value.replace(/[^\d]/g,'') "></html:text>
						</td>						
					</tr>
					<tr>
						<td align="right">
							学生出勤天数：
						</td>
						<td>
							<html:text property="xscqts" maxlength="2" onkeyup="value=value.replace(/[^\d]/g,'') "></html:text>
						</td>						
					</tr>
					<tr>
						<td align="right">
							备注：
						</td>
						<td>
							<html:textarea property="bz" onblur="chLeng(this,300)"></html:textarea>
						</td>						
					</tr>
				</table>
				<center>
					<div class="buttontool" id="btn">
						<button type="button" class="button2"
							onclick="save();return false;"
							style="width:80px">
							保 存
						</button>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="button2" onclick="window.close();return false;"
							style="width:80px">
							关 闭
						</button>
					</div>
				</center>

			 <logic:notEmpty name="result">
				<logic:equal value="true" name="result">
					<script>
					alert("操作成功！");
					Close();
					if(window.dialogArguments){
						window.dialogArguments.document.getElementById('search_go').click();
					}		
					</script>
				</logic:equal>
				<logic:equal value="false" name="result">
					<script>
					alert("操作失败！");
					Close();
					</script>
				</logic:equal>
			</logic:notEmpty>
		</html:form>
	</body>
</html>
