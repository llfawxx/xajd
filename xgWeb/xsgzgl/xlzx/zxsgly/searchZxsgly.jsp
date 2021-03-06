<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/syscommon/head.ini"%>
		<script type="text/javascript" src="js/jquery/plugins/dataGrid/dataGrid.js"></script>
		<script type="text/javascript" src="js/calendar/calendar.js"></script>
		<script type="text/javascript" src="xsgzgl/xlzx/zxsgly/js/zxsgly.js"></script>
		<script type="text/javascript">
		jQuery(function(){
			var gridSetting = {
				caption : "",
				pager : "pager",
				url : "xlzx_zxsgly.do?method=searchRs",
				colList : [ {
					label : '职工号',
					name : 'zgh',
					index : 'zgh',
					key : true,
					width : '15%'
				}, {
					label : '姓名',
					name : 'xm',
					index : 'xm',
					width : '10%'
				}, {
					label : '性别',
					name : 'xb',
					index : 'xb',
					width : '5%'
				}, {
					label : '部门',
					name : 'bmmc',
					index : 'bmmc',
					width : '15%'
				}, {
					label : '联系电话',
					name : 'lxdh',
					index : 'lxdh',
					width : '10%'
				}],
				sortname : "bmdm,bmmc,zgh",
				sortorder : "asc"
			}
			var map = getSuperSearch();
			gridSetting["params"] = map;
			jQuery("#dataTable").initGrid(gridSetting);
		})
		</script>
	</head>

	<body>
		<div class="tab_cur">
			<p class="location">
				<em>您的当前位置：</em><a>${title }</a>
			</p>
		</div>
		<html:form action="/xlzx_zxsgly">
			<%@ include file="/comm/hiddenValue.jsp"%>
			
			<div class="toolbox">
				<!-- 按钮 -->
				<div class="buttonbox">
					<ul>
						<logic:equal name="writeAble" value="yes">
						<li>
							<a href="javascript:void(0);" class="btn_zj" onclick="add();return false;"  >增加</a>
							<a href="javascript:void(0);" class="btn_sc" onclick="del();return false;"  >删除</a>
						</li>
						</logic:equal>
					</ul>
				</div>
				<!-- 过滤条件 -->	
				<%@ include file="/comm/search/superSearchArea.jsp"%>
				<!-- 过滤条件 end-->
			</div>
		</html:form>
		
		<div class="main_box">
			<h3 class=datetitle_01>
				<span>咨询师信息列表&nbsp;&nbsp; </span>
			</h3>
			<div class="con_overlfow">
				<table id="dataTable" ></table>
				<div id="pager"></div>
			</div>
		</div>
	</body>
</html>
