<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/syscommon/head.ini"%>
		<script type="text/javascript" src="js/jquery/plugins/dataGrid/dataGrid.js"></script>
		<script type="text/javascript" src="xsgzgl/xsxx/general/xsxxcj/js/xsxxcj.js"></script>
		<script type="text/javascript">
			var gridSetting = {
				caption:"学生采集信息列表",
				pager:"pager",
				url:"xsxx_gygl_xsxxcj.do?method=cxXsxxcjList&type=query",
				colList:[
				   {label:'学号',name:'xh', index: 'xh',width:'15%' ,key:true ,formatter:xhLink},
				   {label:'姓名',name:'xm', index: 'xm',width:'15%'},
				   {label:'性别',name:'xb', index: 'xb',width:'10%'},
				   {label:'<bean:message key="lable.xb" />',name:'xymc', index: 'xymc',width:'20%'},
				   {label:'专业',name:'zymc', index: 'zymc',width:'20%'},
				   {label:'班级',name:'bjmc', index: 'bjmc',width:'20%'}
				],
				sortname: "xh",
			 	sortorder: "asc"
			}

			function xhLink(cellValue,rowObject){
				return "<a href='javascript:void(0);' class='name' onclick='xsxxcjView(\""+rowObject["xh"]+"\");'>"+cellValue+"</a>";
			}

			function zxsxxView(xh){

				showDialog("学生信息查询",850,500,"xsxx_tygl.do?method=ckZxsxx&xh="+xh+"&xs");
			}
			
			jQuery(function(){
				jQuery("#dataTable").initGrid(gridSetting);
			});

			function searchRs(){
				var map = getSuperSearch();

				jQuery("#dataTable").reloadGrid(map);
			}


			
		</script>
	</head>

	<body>
	
		<div class="tab_cur">
			<p class="location">
				<em>您的当前位置：</em><a>${title }</a>
			</p>
		</div>
		<html:form action="/demo">
			<%@ include file="/comm/hiddenValue.jsp"%>
			<div class="toolbox">
				<!-- 按钮 -->
				<div class="buttonbox">
					<ul>
						<li><a href="javascript:void(0);" onclick="addXsxxcj()" class="btn_zj">增加</a></li>
						<li><a href="javascript:void(0);" onclick="update();" class="btn_xg">修改</a></li>
						<li><a href="javascript:void(0);" onclick="viewXsxxcj();" class="btn_ck">查看</a></li>
						<li><a href="javascript:void(0);" onclick="delXsxxcj();" class="btn_sc">删除</a></li>		
						<li><a href="#" class="btn_dc" onclick="exportConfig();return false;">导出</a></li>
						<li><a href="#" class="btn_dc" onclick="exportXsjbxxtz();return false;">导出基本信息统计</a></li>	
						<li><a href="#" class="btn_dc" onclick="exportXsknxxtz();return false;">导出困难情况统计</a></li>				
					</ul>
				</div>
				<!-- 过滤条件 -->	
				<%@ include file="/comm/search/superSearchArea.jsp"%>
				<!-- 过滤条件 end-->
			</div>
		</html:form>
		<div class="formbox">
			<!--标题start-->
			<h3 class="datetitle_01">
				<span> 学生采集信息列表 </span>
			</h3>

			<table id="dataTable" ></table>
			<div id="pager"></div>

		</div>
	</body>
</html>
