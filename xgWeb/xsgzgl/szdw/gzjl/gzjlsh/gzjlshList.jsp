<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/syscommon/head.ini"%>
		<script type="text/javascript" src="js/jquery/plugins/dataGrid/dataGrid.js"></script>
		<script type="text/javascript" src="js/calendar/calendar.js"></script>
		<script type="text/javascript" src="xsgzgl/szdw/gzjl/gzjlsh/gzjlsh.js"></script>
		<script type="text/javascript">
		var gridSetting = {};
		var gridSetting2 = {};
		var xxdm = ${xxdm};
		if("11842"==xxdm){
			gridSetting = {
					caption:"工作记录审核",
					pager:"pager",
					url:"gzjlsh.do?method=gzjlshList&type=query",
					colList:[
						{label:'key',name:'sqid', index: 'sqid',key:true ,hidden:true},
						{label:'gwdm',name:'gwdm', index: 'gwdm',hidden:true},
						{label:'审批流程',name:'splc', index: 'splc',hidden:true},
						{label:'职工号',name:'zgh', index: 'zgh',width:'10%',formatter:zghLink},
						{label:'姓名',name:'xm', index: 'xm',width:'10%'},
						{label : '<bean:message key="lable.xb" />', name:'xymc',index: 'xymc',width:'15%'},
						{label:'工作类别',name:'gzlbmc', index: 'gzlbmc',width:'10%'},
						{label:'六困生',name:'lksmc',index:'lksmc',width:'15%'},
						{label:'工作时间',name:'gzsj', index: 'gzsj',width:'10%'},
						{label:'记录时间',name:'jlsj', index: 'jlsj',width:'16%'},
						{label:'申请时间',name:'sqsj', index: 'sqsj',width:'20%',hidden:true},
						{label:'审核状态',name:'shztmc', index: 'shztmc',width:'14%'},
						{label:'shzt',name:'shzt', index: 'shzt',hidden:true},
						{label:'审核Id',name:'shid', index: 'shid',hidden:true},
						{label:'岗位Id',name:'gwid', index: 'gwid',hidden:true}
					],
					params:{shzt:"dsh"},
					sortname: "sqsj",
				 	sortorder: "desc",
				 	radioselect:false
			};
			gridSetting2 = {
					caption:"工作记录审核",
					pager:"pager",
					url:"gzjlsh.do?method=gzjlshList&type=query",
					colList:[
						{label:'key',name:'sqid', index: 'sqid',key:true ,hidden:true},
						{label:'gwdm',name:'gwdm', index: 'gwdm',hidden:true},
						{label:'审批流程',name:'splc', index: 'splc',hidden:true},
						{label:'职工号',name:'zgh', index: 'zgh',width:'12%',formatter:zghLink},
						{label:'姓名',name:'xm', index: 'xm',width:'6%'},
						{label : '<bean:message key="lable.xb" />', name:'xymc',index: 'xymc',width:'12%'},
						{label:'工作类别',name:'gzlbmc', index: 'gzlbmc',width:'10%'},
						{label:'六困生',name:'lksmc',index:'lksmc',width:'10%'},
						{label:'工作时间',name:'gzsj', index: 'gzsj',width:'13%'},
						{label:'申请时间',name:'sqsj', index: 'sqsj',width:'20%',hidden:true},
						{label:'审核状态',name:'shztmc', index: 'shztmc',width:'6%'},
						{label:'shzt',name:'shzt', index: 'shzt',hidden:true},
						{label:'审核Id',name:'shid', index: 'shid',hidden:true},
						{label:'岗位Id',name:'gwid', index: 'gwid',hidden:true}
					],
					params:{shzt:"ysh"},
					sortname: "sqsj",
				 	sortorder: "desc",
				 	radioselect:true
			}
		}else{
			gridSetting = {
					caption:"工作记录审核",
					pager:"pager",
					url:"gzjlsh.do?method=gzjlshList&type=query",
					colList:[
						{label:'key',name:'sqid', index: 'sqid',key:true ,hidden:true},
						{label:'gwdm',name:'gwdm', index: 'gwdm',hidden:true},
						{label:'审批流程',name:'splc', index: 'splc',hidden:true},
						{label:'职工号',name:'zgh', index: 'zgh',width:'10%',formatter:zghLink},
						{label:'姓名',name:'xm', index: 'xm',width:'10%'},
						{label : '<bean:message key="lable.xb" />', name:'xymc',index: 'xymc',width:'15%'},
						{label:'工作类别',name:'gzlbmc', index: 'gzlbmc',width:'15%'},
						{label:'工作时间',name:'gzsj', index: 'gzsj',width:'20%'},
						{label:'记录时间',name:'jlsj', index: 'jlsj',width:'16%'},
						{label:'申请时间',name:'sqsj', index: 'sqsj',width:'20%',hidden:true},
						{label:'审核状态',name:'shztmc', index: 'shztmc',width:'14%'},
						{label:'shzt',name:'shzt', index: 'shzt',hidden:true},
						{label:'审核Id',name:'shid', index: 'shid',hidden:true},
						{label:'岗位Id',name:'gwid', index: 'gwid',hidden:true}
					],
					params:{shzt:"dsh"},
					sortname: "sqsj",
				 	sortorder: "desc",
				 	radioselect:false
			};
			gridSetting2 = {
					caption:"工作记录审核",
					pager:"pager",
					url:"gzjlsh.do?method=gzjlshList&type=query",
					colList:[
						{label:'key',name:'sqid', index: 'sqid',key:true ,hidden:true},
						{label:'gwdm',name:'gwdm', index: 'gwdm',hidden:true},
						{label:'审批流程',name:'splc', index: 'splc',hidden:true},
						{label:'职工号',name:'zgh', index: 'zgh',width:'12%',formatter:zghLink},
						{label:'姓名',name:'xm', index: 'xm',width:'6%'},
						{label : '<bean:message key="lable.xb" />', name:'xymc',index: 'xymc',width:'12%'},
						{label:'工作类别',name:'gzlbmc', index: 'gzlbmc',width:'12%'},
						{label:'工作时间',name:'gzsj', index: 'gzsj',width:'21%'},
						{label:'申请时间',name:'sqsj', index: 'sqsj',width:'20%',hidden:true},
						{label:'审核状态',name:'shztmc', index: 'shztmc',width:'6%'},
						{label:'shzt',name:'shzt', index: 'shzt',hidden:true},
						{label:'审核Id',name:'shid', index: 'shid',hidden:true},
						{label:'岗位Id',name:'gwid', index: 'gwid',hidden:true}
					],
					params:{shzt:"ysh"},
					sortname: "sqsj",
				 	sortorder: "desc",
				 	radioselect:true
			}
		}
	
		jQuery(function(){
			var map = getSuperSearch();
			map["shzt"]="dsh";
			gridSetting["params"] = map;
			jQuery("#dataTable").initGrid(gridSetting);
		});
	
			
		
		</script>
	</head>

	<body>
		<div class="tab_cur">
			<p class="location">
				<em>您的当前位置：</em><a>${title }</a>
			</p>
		</div>
		<html:form action="/gzjlsh">
			<input type="hidden" name="shkg" id="shkg" value="${shkg}"/>
			<input type="hidden" id="shzt" value="dsh"/>
			<%@ include file="/comm/hiddenValue.jsp"%>
			<div class="toolbox">
				<!-- 按钮 -->
				<div class="buttonbox">
					<ul>
					<logic:equal name="writeAble" value="yes">
						<li id="li_sh">
							<a href="javascript:void(0);" onclick="gzjlsh();return false;" 
							   title="选中您要审核的记录，点击该按钮可以打开审核页面。"
							   class="btn_sh">审核</a>
						</li>						
						<li id="li_qx" style="display: none;">
							<a href="javascript:void(0);" onclick="cancelSh();return false;" 
							   title="选中一条记录，点击该按钮您可以撤消失误的审核操作。"
							   class="btn_qxsh">撤消</a>
						</li>	
						</logic:equal>					
						<li><a href="javascript:void(0);" onclick="splcInfo();return false;" 
							   title="选中一条记录，点击该按钮可以查看审核流程。"
							   class="btn_cs">流程跟踪</a></li>	
					</ul>
				</div>
				<!-- 过滤条件 -->	
				<%@ include file="/comm/search/superSearchArea.jsp"%>
				<!-- 过滤条件 end-->
				<div class="comp_title" id="comp_title">
			      <ul style="width:90%">
			        <li class="ha"><a href="javascript:void(0);" onclick="selectTab(this,'dsh');"><span>待处理</span></a></li>
			        <li><a href="javascript:void(0);" onclick="selectTab(this,'ysh');"><span>已处理</span></a></li>
			      </ul>
			    </div>
			</div>
		</html:form>
		<div class="main_box">
			<h3 class=datetitle_01>
				<span>工作记录审核列表&nbsp;&nbsp; </span>
			</h3>
			<div class="con_overlfow">
				<table id="dataTable" ></table>
				<div id="pager"></div>
			</div>
		</div>
	</body>
</html>
