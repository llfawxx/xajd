<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/syscommon/head.ini"%>
		<script type="text/javascript" src="js/jquery/plugins/dataGrid/dataGrid.js"></script>
		<script type="text/javascript" src="js/calendar/calendar.js"></script>
		<script type="text/javascript" src="xsgzgl/gyjc/jcjg/js/ccrc.js"></script>
		<script type="text/javascript">
		jQuery(function(){
			var gridSetting = {
				caption : "",
				pager : "pager",
				url : "gyjc_wscc.do?method=wsccList&type=query",
				colList : [   {
					label : '楼栋号',
					name : 'ldmc',
					index : 'ldmc',
					width : '10%'
				}, {
					label : '寝室号',
					name : 'qsh',
					index : 'qsh',
					width : '20%',
				}, {
					label : '所属学院',
					name : 'bmmc',
					index : 'bmmc',
					width : '20%',
				}, {
					label : '检查时间',
					name : 'jcsj',
					index : 'jcsj',
					width : '30%',
				},
				{
					label : '评价等级',
					name : 'pjdj',
					index : 'pjdj',
					width : '10%',
				},
                    {
                        label : 'key',
                        name : 'ccid',
                        index : 'ccid',
                        hidden : true
                    }
                    ,
                    {
                        label : 'key2',
                        name : 'lddm',
                        index : 'lddm',
                        hidden : true
                    }
			],
				sortname : "jcsj",
				sortorder : "desc",
				radioselect:true
			}
			var map = getSuperSearch();
			map["xydm"]=jQuery("#xydm").val();
			map["js"]=jQuery("#js").val();
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
		<html:form action="/gyjc_ccrcsz">
			<%@ include file="/comm/hiddenValue.jsp"%>
			<html:hidden property="js" styleId="js" value="${userType}"/>
			
			<div class="toolbox">
				<!-- 按钮 -->
				<div class="buttonbox">
					<ul>
						
						<li>
							<a href="javascript:void(0);" class="btn_sz" onclick="ccjgck();return false;"  >查看</a>
						</li>
						<li>
							<a href="javascript:void(0);" onclick="updatecc();return false;" class="btn_sz" >修改</a>
						</li>
						<li><a href="#" class="btn_dc" onclick="exportConfigCC();return false;">导出</a></li>
						
						
					</ul>
				</div>
				<!-- 过滤条件 -->	
				<%@ include file="/comm/search/superSearchArea.jsp"%>
				<!-- 过滤条件 end-->
			</div>
		</html:form>
		
		<div class="main_box">
			<h3 class=datetitle_01>
				<span>卫生抽查列表&nbsp;&nbsp;</span>
			</h3>
			<div class="con_overlfow">
				<table id="dataTable" ></table>
				<div id="pager"></div>
			</div>
		</div>
	</body>
</html>
