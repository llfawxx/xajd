<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/syscommon/head.ini"%>
		<script type="text/javascript" src="js/jquery/plugins/dataGrid/dataGrid.js"></script>
		<script type="text/javascript" src="xsgzgl/xpjpy/pjdm/bjdldm/js/bjdldm.js"></script>
		<script type="text/javascript">
			jQuery(function(){
				jQuery("#dataTable").initGrid(gridSetting);
				jQuery("#lbmc").bind("keypress",function(event){
					if(event.keyCode==13||"13"==event.keyCode){
						query();
						return false;
					}
				});
			});
		</script>
	</head>
	<body>
		<div class="tab_cur">
			<p class="location">
				<em>您的当前位置：</em><a>${title }</a>
			</p>
		</div>
		<html:form action="/xpj_bjdldm">
		<div class="toolbox">
			<!-- 按钮 -->
			<logic:equal name="writeAble" value="yes">	
			<div class="buttonbox">
				<ul>
					<li><a href="javascript:void(0);" onclick="add();" class="btn_zj">增加</a></li>
					<li><a href="javascript:void(0);" onclick="update();" class="btn_xg">修改</a></li>
					<li><a href="javascript:void(0);" onclick="del();" class="btn_sc">删除</a></li>						
				</ul>
			</div>
			</logic:equal>
			<div class="comp_title" id="comp_title">
		      <ul style="width:90%" id="tabUl">
		      	<li ><a href="javascript:void(0);" onclick="goXmlx();return false;"><span>评奖项目类型</span></a></li>
				<li ><a href="javascript:void(0);" onclick="goXmxz();return false;"><span>评奖项目性质</span></a></li>
				<li class="ha" ><a href="javascript:void(0);"><span>评奖班级大类</span></a></li>
		      </ul>
		    </div>
			<!-- 过滤条件 -->
			<div class="searchtab">
				<table width="100%" border="0">
					<tr>
						<th width="15%">班级大类名称</th>
						<td>
							<input type="text" id="lbmc" name="lbmc" maxleng="20" />
						</td>
						<td>
							<div class="btn">
								<button type="button" class="btn_cx" id="search_go" onclick="query()">
									查 询
								</button>
							</div>
						</td>
					</tr>					
				</table>
			</div>
		</div>
		</html:form>
		<div class="formbox">
			<!--标题start-->
			<h3 class="datetitle_01">
				<span> 班级大类维护列表 </span>
			</h3>

			<table id="dataTable"></table>
			<div id="pager"></div>

		</div>
	</body>
</html>
