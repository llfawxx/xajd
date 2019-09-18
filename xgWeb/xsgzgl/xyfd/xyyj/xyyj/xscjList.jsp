<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/syscommon/head.ini"%>
		<script type="text/javascript" src="js/jquery/plugins/dataGrid/dataGrid.js"></script>
		<script type="text/javascript" src="js/calendar/calendar.js"></script>
		<script type="text/javascript" src="xsgzgl/comm/exportNew/import.js"></script>
		<script type="text/javascript" src="xsgzgl/xyfd/xyyj/xyyj/js/xyyj.js"></script>
		<script type="text/javascript" src="js/jquery/plugins/upload/ajaxfileupload.js"></script>

		<script type="text/javascript">
		jQuery(function(){			
			var gridSetting = {
				caption : "成绩列表",
				pager : "pager",
                url : "xyfd_xyyj.do?method=xscjList&type=query",
                colList : [
                    { label : '学年', name : 'xn', index : 'xq',width:'10%'},
                    { label : '学期', name : 'xq', index : 'xq',width:'10%',hidden:true},
                    { label : '学期', name : 'xqmc', index : 'xqmc',width:'10%'},
                    { label : '行政班级', name : 'bjdm', index : 'bjdm',width:'10%',hidden:true},
                    { label : '行政班级', name : 'bjmc', index : 'bjmc',width:'10%'},
                    { label : '不及格科目', name : 'kcmc', index : 'kcmc', width : '10%' },
                    { label : '成绩', name : 'cj', index : 'cj', width : '5%' },
                    { label : '学分', name : 'xf', index : 'xf', width : '5%' },
                    { label : '课程性质', name : 'kcxz', index : 'kcxz', width : '10%' },
                    { label : '课程类别', name : 'kclx', index : 'kclx', width : '10%'}
                ],
                sortname : "xq,xn",
                sortorder : "desc"
            }
			var map = getSuperSearch();
			map["xh"] = jQuery("#xh").val();
			gridSetting["params"] = map;
			jQuery("#dataTable").initGrid(gridSetting);
		})

        function searchRs() {
            var map = getSuperSearch();
            map["xh"] = jQuery("#xh").val();
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
		<html:form action="/xyfd_zjyj">
			<input type="hidden" id="userName" name="userName" value="${userName}"/>
			<%@ include file="/comm/hiddenValue.jsp"%>
			
			<div class="toolbox">
				<!-- 按钮 -->
				<!-- 过滤条件 -->	
				<%@ include file="/comm/search/superSearchArea.jsp"%>
				<!-- 过滤条件 end-->
			</div>
		</html:form>
		<div class="main_box">
			<h3 class=datetitle_01>
				<span>活动补录申请列表&nbsp;&nbsp; </span>
			</h3>
			<div class="con_overlfow">
				<input type="hidden" id="xh" name="xh" value="${model.xh}"/>
				<table id="dataTable" ></table>
				<div id="pager"></div>
			</div>
		</div>
	</body>
</html>
