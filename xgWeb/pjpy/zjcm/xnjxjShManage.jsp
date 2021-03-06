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
		<title><bean:message key="lable.title" />
		</title>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
		<meta http-equiv="Pragma" http-equiv="no-cache" />
		<meta http-equiv="Cache-Control" http-equiv="no-cache" />
		<meta http-equiv="Expires" http-equiv="0" />
		<meta name="Copyright" content="正方软件 zfsoft" />
	</head>
	<%
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	<link rel="icon" href="images/icon.ico" type="image/x-icon" />
	<link id="csss" rel="stylesheet" rev="stylesheet" href="style/main.css"
		type="text/css" media="all" />

	<link id="csssDate" rel="stylesheet" rev="stylesheet"
		href="js/calendar.css" type="text/css" media="all" />
	<script language="javascript">	
	
	function xnjxjSb(kshrs){	
		if(curr_row == null){
			alert('请选择要审核的信息!');
			return false;
		}
		var jxjdm  = $("jxjdm").value;
		var userType = $("userType").value;
		var cjrs = $("cjrs").value;
		var pk = curr_row.getElementsByTagName("input")[0].value;
		var url = "/xgxt/zjcm_xnjxj.do?method=xnJxjSh";
		url+="&pk="+pk;
		url+="&jxjdm="+jxjdm;
		url+="&cjrs="+cjrs;
		
		var selectId = $("jxjdm").selectedIndex;
		var jxjmc = $("jxjdm").options[selectId].text;
		var isDxjxj = true;
		
		for(var i=0;i<jxjmc.length;i++){
			if(i>0){
				var mc = jxjmc.charAt(i-1)+jxjmc.charAt(i);
				if(mc == "一等" || mc == "二等" || mc == "三等"){
					isDxjxj = false;
					break;
				}
			}
		}
		
		if(userType == "xx" || userType == "admin"){
			var xxsh = curr_row.cells[10].innerText;
			if(kshrs == 0 && xxsh !="通过 "){
				if(isDxjxj){
					url+="&dxj=yes";
				}else{
					url+="&cjsh=yes";
				}
			}
		}
		showTopWin(url,680,450);
	}
	
	function xwjxjView(){
		var pk = curr_row.getElementsByTagName("input")[0].value;
		var url = "/xgxt/zjcm_xnjxj.do?method=xnJxjSh";
		url+="&pk="+pk;
		url+="&jg=yes";
		//showTopWin(url,680,450);
		showOpenWindow(url,680,450);
	}
	
	function searchJxjSq(){
		var jxjdm = $("jxjdm").value;
		var bjdm = $("bjdm").value;
		if(jxjdm == ""){
			alert("请确定需要审核的奖学金");
			return false;
		}
		if(bjdm == ""){
			alert("请确定需要审核的班级");
			return false;
		}
		allNotEmpThenGo('/xgxt/zjcm_xnjxj.do?method=shManage');
	}
	function xnjxjSh(shzt,kshrs){
		var checkBoxArr = document.getElementsByName("checkVal");
		var jxjdm = $("jxjdm").value;
		var flag = false;
		var chknum = "0"
		var userType = $("userType").value;
		var url = "/xgxt/zjcm_xnjxj.do?method=shManage&doType=save&shzt="+shzt;
		url += "&jxjdm="+jxjdm;
		
		for(var i=0;i<checkBoxArr.length;i++){
			if(checkBoxArr[i].checked==true){
				flag = true;
				if($("xxsh"+i).value != "通过"){
					chknum++;
				}
			}
		}
		
		var selectId = $("jxjdm").selectedIndex;
		var jxjmc = $("jxjdm").options[selectId].text;
		var isDxjxj = true;
		
		for(var i=0;i<jxjmc.length;i++){
			if(i>0){
				var mc = jxjmc.charAt(i-1)+jxjmc.charAt(i);
				if(mc == "一等" || mc == "二等" || mc == "三等"){
					isDxjxj = false;
					break;
				}
			}
		}
		
		if(flag){
			if(jxjdm == ""){
				alert("请确定需要审核的奖学金");
				return false;
			}
			if(userType == "xx" || userType == "admin"){
			if(shzt == "tg" && chknum > kshrs){
				if(isDxjxj){
					alert("审核人数大于该奖学金剩余人数,请确认！！");
					return false;
				}
				if (confirm("审核人数大于该奖学金剩余人数，将自动审核通过其次级奖学金\n同意请按'确定'按钮,否则请取消")) {
					 url = "/xgxt/zjcm_xnjxj.do?method=shManage&doType=cjsave&shzt="+shzt;
				}else{
					return false;
				}
			}
			}
			showTips('处理数据中，请等待......');
			refreshForm(url);
		}else{
			alert("请勾选要处理的数据");
			return false;
		}
	}
	function chRs(shzt,num){
		var jxjrs = $("jxjrs").value;
		var hdrs = $("hdrs").value;
		var kshrs="0";
		if(jxjrs !="" && hdrs != ""){
			if(jxjrs > hdrs){
				kshrs = parseInt(jxjrs)-parseInt(hdrs);
			}
		}
		
		if(num == "2"){
			xnjxjSh(shzt,kshrs);
		}else if(num == "3"){
			xwjxjView();
		}else{
			xnjxjSb(kshrs);
		}
	}
	function jxjsh(istg) {
		var jxjdm = $("jxjdm").value;
		var bjdm = $("bjdm").value;
		var url = "/xgxt/zjcm_xnjxj.do?method=shManage&go=save&lb=" + istg;
		var userType = document.getElementById('userType').value;
		if((jxjdm == ""||bjdm==""||jxjdm==null||bjdm==null) && 'xy'==userType){
			alert("请选择要审核的班级和奖学金!");
			return false;
		}
		if (isSelect('checkVal')) {
			var userType = document.getElementById('userType').value;
			if (istg=='yes' && 'xy' == userType) {
				var jxjrs = document.getElementById('jxjrs').value;
				var hdrs = document.getElementById('hdrs').value;
				var chknum = 0;
				var checkBoxArr = document.getElementsByName('checkVal');

				for(var i=0;i<checkBoxArr.length;i++){
					if(checkBoxArr[i].checked==true){
						chknum++;
					}
				}
				jxjrs = jxjrs != null && jxjrs != "" ? parseInt(jxjrs) : 0;
				hdrs = hdrs != null && hdrs != "" ? parseInt(hdrs) : 0;

				if (jxjrs !=0 && ((hdrs + chknum) > jxjrs)) {
					alert("该奖学金审核通过人数已超限制人数，\n获奖名额：" + jxjrs + "人，已审核通过：" + hdrs + "人，当前审核：" + chknum + "人。");
					return false;
				}
			} 
			refreshForm(url);
		}
	}
	//双击一行显示详细信息
	function viewJxjDetails(type) {
		if (curr_row == null) {
			alert("请选择要操作的数据行！");
			return false;
		}
		var pk = curr_row.cells[0].getElementsByTagName("input")[0].value;
		if (pk == null || pk == "") {
			alert("请选择要操作的数据行！");
			return false;
		} else {
			showTopWin('pjpy_zjcm_jxjshDetails.do?pkValue=' + pk + '&go='+type,620,540);
		}
	}
	</script>
	<body onload="xyDisabled('xy');">
		<script language="javascript" src="js/function.js"></script>
		<script type="text/javascript" src="js/calendar.js"></script>
		<script type="text/javascript" src="js/pjpy/pjpy_zjlg.js"></script>
		<script type="text/javascript" src="js/calendar-zh.js"></script>
		<script type="text/javascript" src="js/calendar-setup.js"></script>
		<script type="text/javascript" src="js/jxglFunction.js"></script>
		<script type='text/javascript' src='/xgxt/dwr/interface/GetListData.js'></script>
		<script type='text/javascript' src='/xgxt/dwr/interface/zjcmZhfDAO.js'></script>
		<script type='text/javascript' src='/xgxt/dwr/engine.js'></script>
		<script type='text/javascript' src='dwr/util.js'></script>
		<script language="javascript" src="js/AjaxFunction.js"></script>
		<script type="text/javascript" src="pjpy/zjcm/cssz/cssz.js"></script>
		<html:form action="/zjcm_zhf" method="post">
			<input type="hidden" name="pjxn" id="pjxn" value="${pjxn}"/>
			<input type="hidden" name="pjxq" id="pjxq" value="${pjxq}"/>
			<input type="hidden" name="jxjrs" id="jxjrs" value="${jxjrs}"/>
			<input type="hidden" name="cjrs" id="cjrs" value="${cjrs}"/>
			<input type="hidden" name="hdrs" id="hdrs" value="${hdrs}"/>
			<input type="hidden" name="msg" id="msg" value="${msg}"/>
			<input type="hidden" name="xyV" id="xyV" value=""/>
			<input type="hidden" name="zyV" id="zyV" value=""/>
			<input type="hidden" name="bjV" id="bjV" value=""/>
			<input type="hidden" name="njV" id="njV" value=""/>
			<input type="hidden" id="isFdy" name="isFdy" value="${fdyQx }" />
			<input type="hidden" id="userName" name="userName" value="${userName }"/>
			<input type="hidden" id="userType" name="userType" value="${userType }" />
			<input type="hidden" id="tableName" name="tableName" value="${tableName }" />
			<input type="hidden" id="realTable" name="realTable" value="${realTable }" />
			<input type="hidden" id="isFdy" name="isFdy" value="${isFdy }" />
			<div class="title">
				<div class="title_img" id="title_m">
					当前所在位置：<bean:write name="title"/>
				</div>
			</div>
			<div class="rightcontent">
				<fieldset>
					<legend>
						查 询
					</legend>
					<table width="100%" class="tbstyle">
						<thead>
							<tr>
								<td align="left">
									年级：
									<html:select property="nj" style=""
										onchange="initZyList();initBjList()">
										<html:option value=""></html:option>
										<html:options collection="njList" property="nj"
											labelProperty="nj" />
									</html:select>
									学年：
									<html:select property="xn" style="" disabled="true">
										<html:option value=""></html:option>
										<html:options collection="xnList" property="xn"
											labelProperty="xn" />
									</html:select>
									学期：
									<html:select property="xq" style="" disabled="true">
										<html:option value=""></html:option>
										<html:options collection="xqList" property="xqdm"
											labelProperty="xqmc" />
									</html:select>
									&nbsp;&nbsp;&nbsp;学号：
									<html:text property="xh" style="width:85px" maxlength="20"></html:text>
									&nbsp;&nbsp;&nbsp;姓名：
									<html:text property="xm" style="width:85px" maxlength="20"></html:text>								
								</td>
								<td width="10" rowspan="3" align="center" valign="middle">
<%--									<input type="hidden" name="go" value="a" />--%>
									<button class="button2" style="height:40px" id="search_go"
										onclick="allNotEmpThenGo('/xgxt/zjcm_xnjxj.do?method=shManage&go=go')">
										查询
									</button>
								</td>
							</tr>
							<tr>
								<td align="left" nowrap>
									<bean:message key="lable.xsgzyxpzxy" />：
									<html:select property="xydm" style="" styleId="xy"
										onchange="initZyList();initBjList()">
										<html:option value=""></html:option>
										<html:options collection="xyList" property="xydm"
											labelProperty="xymc" />
									</html:select>
									&nbsp;&nbsp;专业：
									<html:select property="zydm" style="" styleId="zy"
										onchange="initBjList()">
										<html:option value=""></html:option>
										<html:options collection="zyList" property="zydm"
											labelProperty="zymc" />
									</html:select>
									&nbsp;&nbsp;班级：
									<html:select property="bjdm" style="" styleId="bj" onchange="refreshForm('/xgxt/zjcm_xnjxj.do?method=shManage')">
										<html:option value=""></html:option>
										<html:options collection="bjList" property="bjdm"
											labelProperty="bjmc" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									获得奖学金：
									<html:select property="jxjdm" style="" onchange="refreshForm('/xgxt/zjcm_xnjxj.do?method=shManage')">
										<html:option value=""></html:option>
										<html:options collection="jxjList" property="dm" labelProperty="mc" />
									</html:select>

								&nbsp;&nbsp;审核结果：
								<html:select property="sh" style="">
									<html:option value=""></html:option>
									<html:option value="未审核">未审核</html:option>
									<html:option value="通过">通过</html:option>
									<html:option value="不通过">不通过</html:option>
								</html:select>
								</td>
							</tr>
						</thead>
					</table>
				</fieldset>
				<logic:empty name="rs">
					<p align="center">
						未找到任何记录！
					</p>
				</logic:empty>
				<logic:notEmpty name="rs">
					<fieldset>
						<legend>
							记录数：
							<bean:write name="rsNum" />
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<font color="blue">提示：单击表头可以排序;双击记录可查看详细;</font>
							<font color="red">红色字体数据为该生在校期间受过处分.</font>
							<logic:equal value="yes" name="view">
							<font color="red">注：该奖学金获奖人数上限为&nbsp;${jxjrs }&nbsp;人，现已通过&nbsp;${hdrs }&nbsp;人.</font>
							</logic:equal>
							
						</legend>
						<table width="100%" id="rsTable" class="tbstyle">
							<thead>
								<tr align="center" style="cursor:hand;">
									<td >
										<input type="checkbox" id="selall" name="selall" style="height: 17.5px"
											onclick="selAll()">
									</td>
									<logic:iterate id="tit" name="topTr" offset="3">
										<td id="<bean:write name="tit" property="en"/>"
											onclick="tableSort(this)" nowrap>
											<bean:write name="tit" property="cn" />
										</td>
									</logic:iterate>
								</tr>
							</thead>
							<logic:iterate name="rs" id="s" indexId="index">
								<tr onclick="rowOnClick(this);" ondblclick="viewJxjDetails('view')" style="cursor:hand;color:<logic:iterate id="v" name="s" offset="1" length="1"><bean:write name="v"/></logic:iterate>">
									<td>
									<input type="checkbox" id="checkVal" name="checkVal" style="height: 17.5px"
								 		value="<logic:iterate id="v" name="s" offset="0" length="1"><bean:write name="v"/></logic:iterate>" <logic:iterate id="v" name="s" offset="2" length="1"><bean:write name="v"/></logic:iterate>>
								 	<input type=hidden id="xxsh${index}" value="<logic:iterate id="v" name="s" offset="10" length="1"><bean:write name="v"/></logic:iterate>"/>
									</td>	
									<td>
										<logic:iterate id="v" name="s" offset="3" length="1">
											<bean:write name="v" />
										</logic:iterate>
									</td>
									<logic:iterate id="v" name="s" offset="4" >
										<td align="left">
											<bean:write name="v" />
										</td>
									</logic:iterate>
								</tr>
							</logic:iterate>
						</table>
						<TABLE width="100%" id="Table" class="tbstyle">
							<TR>
								<TD height=3></TD>
							</TR>
							<TR>
								<TD>
									<jsp:include flush="true"
											page="/sjcz/turnpage.jsp?form=pjpyZjcmActionForm"></jsp:include>
								</TD>
							</TR>
							<TR>
								<TD height=3></TD>
							</TR>
						</TABLE>
					</fieldset>
				</logic:notEmpty>
				<div id="toolTipLayer" style="position:absolute; visibility: hidden" /></div>
				<center>
					<div class="buttontool" id="btn"
						style="position: absolute;left:1%;top:100px" width="100%">
						<logic:equal name="writeAble" value="yes">
							<button class="button2"
								onclick="viewJxjDetails('')"
								style="width:80px">
								单个审核
							</button>
							&nbsp;&nbsp;
							<button class="button2"
								onclick="jxjsh('yes')"
								style="width:80px">
								审核通过
							</button>
							&nbsp;&nbsp;
							<button class="button2"
								onclick="jxjsh('no')"
								style="width:80px">
								审核不通过
							</button>
						</logic:equal>
					</div>
				</center>
				<div id="tmpdiv"></div>
			</div>
		</html:form>
		<script language="javascript">
                  document.getElementById("btn").style.pixelTop = document.body.clientHeight - 35;
                  document.getElementById("btn").style.width = "96%";
                  window.setInterval("initBTNTool('btn')",1);
                </script>
		<logic:equal value="true" name="result">
			<script>
				alert("操作成功!");
				document.getElementById('search_go').click();
			</script>
		</logic:equal>
		<logic:equal value="false" name="result">
			<script>
				alert("操作失败!"+$("msg").value);
				document.getElementById('search_go').click();
			</script>
		</logic:equal>

	</body>
</html>
