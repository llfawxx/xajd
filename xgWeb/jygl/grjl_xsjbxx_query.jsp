<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/syscommon/pagehead_V4.ini"%>
		<script language="javascript">
			function querygo(){
				 	document.forms[0].action = "/xgxt/grjlquerygo.do?act=go";
				 	document.forms[0].submit();
		    }
		   
		   	function stu_send(type)
				{
					var xh=curr_row.cells[3].innerText;
					if(type=="grjl"){
					window.dialogArguments.refreshForm('/xgxt/stuinfo_input.do?act=go&xsxh='+xh);
					window.close();
					}
				}
		</script>
	</head>
	<body>
		<script language="javascript" src="js/function.js"></script>
		<html:form action="/data_search" method="post">
			<div class="tab_cur">
				<p class="location">
					<em>您的当前位置:</em><a>就业管理 - 学生信息 - 学生信息查询</a>
				</p>
			</div>
			<div class="searchtab">		
				<table width="100%" class="tbstyle">
					<thead>
						<tr style="cursor:hand">
							<th>学号</th>
							<td><html:text name="rs1" property="xsxh" /></td>
							<th>姓名</th>
							<td><html:text name="rs1" property="name" style="width:70px"/></td>
							<th>性别</th>
							<td><html:select name="rs1" property="xbdm" style="width:50px">
									<html:option value=""></html:option>
									<html:option value="1">
										男
									</html:option>
									<html:option value="2">
										女
									</html:option>
								</html:select></td>
						</tr>
						<tr>
							<th>学生类别</th>
							<td><html:select name="rs1" property="xslb" style="width:80px">
									<html:option value=""></html:option>
									<html:option value="本专生">
										本专生
									</html:option>
									<html:option value="研究生">
										研究生
									</html:option>
								</html:select>
							</td>
							<logic:equal name="who" value="teacher">
								<th><bean:message key="lable.xsgzyxpzxy" /></th>
								<td><html:select name="rs1" property="xymc" style="width:150px">
										<html:option value=""></html:option>
										<html:options collection="xyList" property="xymc"
											labelProperty="xymc" />
								</html:select></td>
							</logic:equal>
							<logic:equal name="who" value="fudaoyuan">
							    <th><bean:message key="lable.xsgzyxpzxy" /></th>
							    <td><html:text name="rs1" property="xymc" style="width:150px" readonly="true" /></td>
							</logic:equal>
							<th>入学年度</th>
							<td><html:select name="rs1" property="nd" style="width:150px">
										<html:option value=""></html:option>
										<html:options collection="ndList" property="nj"
											labelProperty="nj" />
								</html:select></td>
							</tr>
							<tr>
								<th>毕业年度</th>
								<td>
									<select name="bynd" style="width:100px">
										<option value=""></option>
										<option value="2007">
											2007
										</option>
										<option value="2008">
											2008
										</option>
										<option value="2009">
											2009
										</option>
										<option value="2010">
											2010
										</option>
										<option value="2011">
											2011
										</option>
										<option value="2012">
											2012
										</option>
										<option value="2013">
											2013
										</option>
										<option value="2014">
											2014
										</option>
										<option value="2015">
											2015
										</option>
									</select>
								</td>
								<td colspan="4"></td>
							</tr>
					</thead>
					<tfoot>
						<tr>
							<td colspan="6">
								<div class="btn">
									<button class="button2" onclick="querygo()">
										查 询
									</button>
									 <button class="btn_cz" id="btn_cz" onclick="searchReset();return false;">
										重 置
									 </button>
								</div>
							</td>
						</tr>
				</tfoot>
				</table>
			</div>
			<div class="formbox">
				<logic:empty name="rs">
				    <h3 class="datetitle_01">
				    <span>
				    	查询结果&nbsp;&nbsp;
							<font color="red">未找到任何记录！</font> 
				    </span>
				    </h3>
				 </logic:empty>
				<logic:notEmpty name="rs">
					<h3 class="datetitle_01">
						<span>
							查询结果&nbsp;&nbsp;<font color="blue">单击表头可以排序</font> 
						</span>
					</h3>
					<table width="100%" id="rsTable" class="dateline">
						<thead>
							<tr align="center" style="cursor:hand">
								<logic:iterate id="tit" name="topTr" offset="1">
									<td id="<bean:write name="tit" property="en"/>"
										onclick="tableSort(this)">
										<bean:write name="tit" property="cn" />
									</td>
								</logic:iterate>
							</tr>
						</thead>
						<logic:iterate name="rs" id="s">
							<tr onclick="rowOnClick(this)" style="cursor:hand"
								ondblclick="stu_send('grjl')">
								<logic:iterate id="v" name="s" offset="0" length="1">
									<input type="hidden" value="<bean:write name="v"/>" />
								</logic:iterate>
								<logic:iterate id="v" name="s" offset="1">
									<td align="center">
										<bean:write name="v" />
									</td>
								</logic:iterate>
							</tr>
						</logic:iterate>
					</table>
			</logic:notEmpty>
			</div>
		</html:form>
		<script type="text/javascript" src="js/bottomButton.js"></script>
	</body>
</html>