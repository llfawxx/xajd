<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/syscommon/head.ini"%>
		<script type="text/javascript" src="js/jquery/plugins/dataGrid/dataGrid.js"></script>
		<script type="text/javascript">
			jQuery(function(){
				var gridSetting = {
					caption:"学生列表",
					pager:"pager",
					url:"jyglnew_jygl_cyyqglgl.do?method=getStu&type=query&xhs="+jQuery("#xhs").val(),
					colList:[
					   {label:'学号',name:'xh', index: 'xh',width:'12%',key:true},
					   {label:'姓名',name:'xm', index: 'xm',width:'8%'},
					   {label:'性别',name:'xb', index: 'xb',width:'5%'},
					   {label:'年级',name:'nj', index: 'nj',width:'8%'},
					   {label:'<bean:message key="lable.xb" />',name:'xymc', index: 'xymc',width:'20%'},
					   {label:'专业',name:'zymc', index: 'zymc',width:'20%'},
					   {label:'班级',name:'bjmc', index: 'bjmc',width:'20%'},
					   {label:'学制',name:'xz', index: 'xz',width:'7%'},
					   {label:'手机号码',name:'sjhm', index: 'sjhm',hidden:true},
					   {label:'qq号码',name:'qqhm', index: 'qqhm',hidden:true}
					],
					sortname: "xh",
				 	sortorder: "desc"
				}
				gridSetting["params"]=getSuperSearch();
				jQuery("#dataTable").initGrid(gridSetting);
			});
			function searchRs(){
				var map = getSuperSearch();
				jQuery("#dataTable").reloadGrid(map);
			}
			function save() {
				var rows = jQuery("#dataTable").getSeletRow();
				if (rows.length == 0) {
					showAlertDivLayer("请至少选择一个学生！");
					return false;
				}
				var html = "";
				for(var i = 0; i < rows.length; i++){
					var xh = rows[i]["xh"] == null ? "" : rows[i]["xh"];
					var xm = rows[i]["xm"] == null ? "" : rows[i]["xm"];
					//var xb = rows[i]["xb"] == null ? "" : rows[i]["xb"];
					//var nj = rows[i]["nj"] == null ? "" : rows[i]["nj"];
					var xymc = rows[i]["xymc"] == null ? "" : rows[i]["xymc"];
					var zymc = rows[i]["zymc"] == null ? "" : rows[i]["zymc"];
					var bjmc = rows[i]["bjmc"] == null ? "" : rows[i]["bjmc"];
					var sjhm = rows[i]["sjhm"] == null ? "" : rows[i]["sjhm"];
					var qqhm = rows[i]["qqhm"] == null ? "" : rows[i]["qqhm"];
					html += "<tr>";
					html += "<td><input type='checkbox'/></td>";
					html += "<td>" + xh;
					html += "<input type='hidden' name='xhArr' value='" + xh + "' />";
					html += "</td>";
					html += "<td>" + xm + "</td>";
					//html += "<td>" + xb + "</td>";
					//html += "<td>" + nj + "</td>";
					html += "<td>" + xymc + "</td>";
					html += "<td>" + zymc + "</td>";
					html += "<td>" + bjmc + "</td>";
					html += "<td><input type='text' name='sjhmArr' value='" + sjhm + "' style='width:86px;' maxlength='11' /></td>";
					html += "<td><input type='text' name='qqhmArr' value='" + qqhm + "' style='width:90px;' maxlength='12' /></td>";
					html += "</tr>";
				}
				var W;
				var api = frameElement.api;
				if (api) {
					if (api.get('childDialog')) {
						W = api.get('parentDialog')
					} else {
						W = api.opener;
					}
				} else if (parent.window) {
					W = parent.window;
				}
				jQuery("#tbody_xs", W.document).append(html);	
				iFClose();
			}
		</script>
	</head>

	<body>
		<html:form method="post" styleId="form" action="/jyglnew_jygl_cyyqglgl">
		<html:hidden property="xhs" styleId="xhs"/>
			<%@ include file="/comm/hiddenValue.jsp"%>
			<div class="toolbox">
				<!-- 按钮 -->
				<div class="buttonbox">
					<ul>
						<li>
							<a href="javascript:void(0);" onclick="save();return false;" class="btn_zj">添加</a>
						</li>
					</ul>
				</div>
				<%@ include file="/comm/search/superSearchArea.jsp"%>
			</div>
		</html:form>
		<div class="toolbox">
			<h3 class="datetitle_01">
				<span>学生列表</span>
			</h3>
		</div>
		<div class="formbox" style="width:100%;height:330px;overflow-x:hidden;overflow-y:auto;">
			<table id="dataTable" ></table>
		</div>
			<div id="pager"></div>
	</body>
</html>
