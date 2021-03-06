<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean"
	prefix="bean"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html"
	prefix="html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic"
	prefix="logic"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html locale="true">
<head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" rev="stylesheet" href="style/main.css"
		type="text/css" media="all" />
	<script language="JavaScript" src="style/dmwh.js"></script>
	<script language="JavaScript" src="style/xjgl.js"></script>
	<script language="JavaScript" src="style/jhgl.js"></script>
	<script language="JavaScript" src="style/szgl.js"></script>
	<script language="javascript" src="style/function.js"></script>
	<script type="text/javascript" src="dwr/interface/ajaxCommon.js"></script>
	<script type="text/javascript" src="dwr/engine.js"></script>
	<script type="text/javascript" src="dwr/util.js"></script>
	<script language="javascript">
		function dtan(){
	    	document.getElementById("btn").style.pixelTop = document.body.offsetHeight - 40;
	    	document.getElementById("btn").style.width = "100%";
	    	window.setInterval("initBTNTool('btn')",1);
		}
		function cz(a,b){
    	var dm = document.forms[0].dm.value;
    	if(b=="modify"){
			 if(document.forms[0].dm.value==""){
			   alert("\u8bf7\u9009\u62e9\u8981\u4fee\u6539\u7684\u8bb0\u5f55\uff01");
			   return false;
			 }
		     window.showModalDialog(a+"&dm="+dm,window,"Status:NO;dialogWidth:500px;dialogHeight:350px");
	     }
	     else if(b=="add"){
	     	window.showModalDialog(a,window,"Status:NO;dialogWidth:500px;dialogHeight:350px");
	     }else if(b=="ck"){
			 if(document.forms[0].dm.value==""){
			   alert("\u8bf7\u9009\u62e9\u8981\u4fee\u6539\u7684\u8bb0\u5f55\uff01");
			   return false;
			 }
		     window.showModalDialog(a+"&dm="+dm,window,"Status:NO;dialogWidth:500px;dialogHeight:350px");
	     }
		}
	</script>
</head>

<body>
	<html:form action="jytjgl">
	<input type="hidden" name="dm" value="">
	<input type="hidden" name="form_action" value="/yjsjwgl/jyhdgl.do?act=find"/>
	<input type="hidden" id="mkdm" name="mkdm"
			value="<bean:write name="mkdm" scope="request"/>" />
		<div id="title">
			<div class="titiel_img"></div>
			当前所在位置：就业管理-->就业户档管理
		</div>
		<div>
			<fieldset>
				<legend>
					查询条件
				</legend>
				<table width="99%">
					<thead>
						<tr>
							<td align="center">学&nbsp;号：</td>
							<td width="40%" align="center">
								<html:text name="jyglForm" property="xh"></html:text>
							</td>
							<td align="center">
								<button class="button2"
									onclick="changTab('/yjsjwgl/jyhdgl.do?act=find')"
									style="width: 60px">
									查&nbsp;&nbsp;询
								</button>
							</td>
						</tr>
					</thead>
				</table>
			</fieldset>
		</div>
		<div>
			<fieldset>
				<legend>
					<font color="blue">双击行可查看详细信息</font>
				</legend>
				<table width="99%">
					<thead>${toolMenu }</thead>
					<thead>
						<tr>
							<td width="3%"  align="center">
						   		<input type="checkbox" name="qbxz" value="all" onclick="cjdyxz('checkvalue')">
						    </td>
							<td align="center" width="6%">
								学号
							</td>
							<td align="center" width="7%">
								转迁时间
							</td>
							<td align="center" width="8%">
								留校保管开始时间
							</td>
							<td align="center" width="8%">
								留校保管结束时间
							</td>
							<td align="center" width="6%">
								留校原因
							</td>
							<td align="center" width="12%">
								去向省市
							</td>
						</tr>
					</thead>
					<logic:present name="jytjList">
					<logic:iterate id="model" name="jytjList" scope="request">
						<tr style="cursor: hand" onclick="cols(this)"
								id="<bean:write name='model' property='xh'/>"
								ondblclick="cz('/yjsjwgl/jyhdgl.do?act=ck','ck')">
							<td align="center"><input type="checkbox" name="checkvalue" value="<bean:write name='model' property='xh'/>"><br></td>
							<td align="center">
								<bean:write name="model" property="xh" />
							</td>
							<td align="center">
								<bean:write name="model" property="zqsj" />
							</td>
							<td align="center">
								<bean:write name="model" property="lxbgkssj" />
							</td>
							<td align="center">
								<bean:write name="model" property="lxbgjssj" />
							</td>
							<td align="center">
								<bean:write name="model" property="lxyy" />
							</td>
							<td align="center">
								<bean:write name="model" property="szsqmc" />		
							</td>
					</logic:iterate>
					</logic:present>
				</table>
			</fieldset>
		</div>
		<div id="search_r">
			<div id="tmp"></div>
		</div>
		<div align="center">
			<div id="btn" style="position: absolute; left:0px;top:0px">
				<logic:equal name="canWrite" value="1">
					<button class="button2" style="width: 70px"
						onClick="cz('/yjsjwgl/jyhdgl.do?act=add','add')">
						增加记录
					</button>
					<button class="button2" style="width: 70px"
						onClick="cz('/yjsjwgl/jyhdgl.do?act=modify','modify')">
						修改记录
					</button>
					<button class="button2" style="width: 70px"
						onClick="changTab('/yjsjwgl/jyhdgl.do?act=delete')">
						删除记录
					</button>
				</logic:equal>
			</div>
			<script>
		     dtan();
		    </script>	
		</div>
	</html:form>

</body>

</html:html>

