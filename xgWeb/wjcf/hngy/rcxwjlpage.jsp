<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ include file="/syscommon/pagehead.ini"%>
<script language="javascript" src="/xgxt/pjpy/xibeierminyuan/js/xbemyJs.js"></script>
<script language="javascript" src="/xgxt/pjpy/zjjd/zjjdjs/zjjdjs.js"></script>
	<script type="text/javascript" src="js/calendar.js"></script>
		<script type="text/javascript" src="js/calendar-zh.js"></script>
		<script type="text/javascript" src="js/calendar-setup.js"></script>
<script type="text/javascript" src="pjpy/hbsf/hbsfjs.js"></script>
<body onload="xyDisabled('xy');">
	<html:form action="/wjcfhngywh.do" method="post">
		<input type="hidden" name="zyV" id="zyV" value="" />
		<input type="hidden" name="bjV" id="bjV" value="" />
		<input type="hidden" name="userType" id="userType"
			value="${userType }" />
		<input type="hidden" name="tableName" id="tableName" value="${tableName }"/>
		<input type="hidden" name="realTable" id="realTable" value="${realTable }"/>
		<input type="hidden" name="failInfo" id="failInfo" value="${failinfo }"/>
		<div class="title">
			<div class="title_img" id="title_m">
				当前位置:违纪处分 - 数据维护 - 日常行为记录
			</div>
		</div>
		<fieldset>
			<legend>
				条件选择
			</legend>
			<table width="100%" class="tbstyle">
				<thead>
					<tr>
						<td align="" nowrap="nowrap">
							学年：
							<html:select property="xn" styleId="xn" style="width:90px"
								styleClass="select">
								<html:options collection="xnList" property="xn"
									labelProperty="xn" />
							</html:select>
							&nbsp;&nbsp; 学期：
							<html:select property="xq" styleId="xq" style="width:90px"
								styleClass="select">
								<html:option value=""></html:option>
								<html:options collection="xqList" property="xqdm"
									labelProperty="xqmc" />
							</html:select>
							&nbsp;&nbsp;
							年度:
							<html:select property="nd" styleId="nd" style="width:90px">
								
								<html:options collection="xnList" property="nd"
									labelProperty="nd" />
							</html:select>
							&nbsp;&nbsp; 年级：
							<html:select property="nj" styleId="nj" style="width:90px"
								styleClass="select" onchange="initZyList();initBjList()">
								<html:option value=""></html:option>
								<html:options collection="njList" property="nj"
									labelProperty="nj" />
							</html:select>
						</td>
						<td width="10" rowspan="3" align="center" valign="middle">
							<button type="button" class="button2" style="height:40px" id="search_go"
								onclick="refreshForm('wjcf_hngy_rcxwjlqry.do')">
								查询
							</button>
						</td>
					</tr>
					<tr>
						<td align="left" nowrap>
							学号：
							<html:text property="xh" styleId="xh" styleClass="inputtext"
								style="width:100px">
							</html:text>
							&nbsp;&nbsp;姓名：
							<html:text property="xm" styleId="xm" styleClass="inputtext"
								style="width:100px">
							</html:text>
							&nbsp;&nbsp;违纪次数:
							<html:text property="cs" styleId="cs" style="width:90px" onkeypress="chkonlynum()"></html:text>
							&nbsp;&nbsp;违纪时间:
							<html:text property="wjsj" styleId="wjsj" style="width:120px"
								onblur="dateFormatChg(this)" style="cursor:hand;"
								onclick="return showCalendar('wjsj','y-mm-dd');" />
						</td>
					</tr>
					<tr>
						<td align="left" nowrap>
							<bean:message key="lable.xsgzyxpzxy" />：
							<html:select property="xydm" style="width:175px"
								styleClass="select" styleId="xy"
								onchange="initZyList();initBjList()">
								<html:option value=""></html:option>
								<html:options collection="xyList" property="xydm"
									labelProperty="xymc" />
							</html:select>
							&nbsp;&nbsp; 专业：
							<html:select property="zydm" style="width:170px" styleId="zy"
								styleClass="select" onchange="initBjList()">
								<html:option value=""></html:option>
								<html:options collection="zyList" property="zydm"
									labelProperty="zymc" />
							</html:select>
							&nbsp;&nbsp; 班级：
							<html:select property="bjdm" style="170px" styleId="bj"
								styleClass="select">
								<html:option value=""></html:option>
								<html:options collection="bjList" property="bjdm"
									labelProperty="bjmc" />
							</html:select>
						</td>
					</tr>
				</thead>
			</table>
		</fieldset>
			<logic:empty name="rs">
				<br />
				<br />
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
						<font color="blue">提示：单击表头可以进行排序；双击一行可以查看详细信息；</font>
					</legend>
					<table width="100%" id="rsTable" class="tbstyle">
						<thead>
							<tr align="center" style="cursor:hand">
								<td nowrap>
									<input type="checkbox" id="cb" name="cb" onclick="selectAll()" />
								</td>
								<logic:iterate id="tit" name="topTr" offset="1">
									<td id="<bean:write name="tit" property="en"/>"
										onclick="tableSort(this)" nowrap>
										<bean:write name="tit" property="cn" />
									</td>
								</logic:iterate>
							</tr>
						</thead>
						<logic:iterate name="rs" id="s">
							<tr onclick="rowOnClick(this)" style="cursor:hand;"
								align="center" ondblclick="modiAndDel('wjcf_hngy_rcxwmodi.do?act=view&pkValue=','modi','600','510')">
								<td>
									<input type="checkbox" id="cbv" name="cbv"
										value="<logic:iterate id="v" name="s" offset="0" length="1"><bean:write name="v"/></logic:iterate>" />
								</td>
								<logic:iterate id="v" name="s" offset="1">
									<td>
										<bean:write name="v" />
									</td>
								</logic:iterate>
							</tr>
						</logic:iterate>
					</table>
				</fieldset>
			</logic:notEmpty>
			<div id="toolTipLayer" style="position:absolute; visibility: hidden" /></div>
				<logic:equal value="yes" name="writeAble" scope="request">
					<center>
						<div class="buttontool" id="btn"
							style="position: absolute;left:1%;top:100px" width="100%">
							<button type="button" class="button2" id="btn_add"
								onclick="showTopWin('wjcf_hngy_rcxwadd.do','600','550')"
								style="width:80px">
								增加
							</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="button2" id="btn_edit"
								onclick="modiAndDel('wjcf_hngy_rcxwmodi.do?pkValue=','modi','600','550');"
								style="width:80px">
								修改
							</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="button2" id="btn_delete"
								onclick="deldata('wjcf_hngy_rcxwdel.do')"
								style="width:80px">
								删除
							</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="button2" id="btn_impdata"
								onclick="impAndChkData()"
								style="width:80px">
								导入数据
							</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="button2" id="btn_expdata"
								onclick="dataExport()"
								style="width:80px">
								导出数据
							</button>
							&nbsp;&nbsp;&nbsp;
							<a href="xlsDown/rcxwjl.xls"
													target="_blank">模板下载</a>
						</div>
					</center>
				</logic:equal>
			<div id="tmpdiv"></div>
	</html:form>
		<script language="javascript">
			document.getElementById("btn").style.pixelTop = document.body.clientHeight - 35;
			document.getElementById("btn").style.width = "96%";
			window.setInterval("initBTNTool('btn')",1);
		</script>
		<logic:present name="deleted">
			<logic:equal value="yes" name="deleted">
				<script>
					alert('操作成功!');
					document.getElementById('search_go').onclick();
				</script>
			</logic:equal>
			<logic:equal value="no" name="deleted">
				<script>
					alert(''+document.getElementById('failInfo').value);
					document.getElementById('search_go').onclick();
				</script>
			</logic:equal>
		</logic:present>
</body>
