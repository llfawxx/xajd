
<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="/syscommon/head.ini"%>
	<script type="text/javascript" src="js/jquery/jquery.form.js"></script>
	<script type="text/javascript" src="js/check.js"></script>
	<script type="text/javascript" src="js/jquery/plugins/dataGrid/dataGrid.js"></script>
	<script type="text/javascript" src="js/jquery/ajaxSubmit.js"></script>
	<script type="text/javascript" src="js/calendar/calendar.js"></script>
	<script type="text/javascript" src="js/jquery/plugins/upload/ajaxfileupload.js"></script>
	<script type="text/javascript" src="xsgzgl/comm/fileUpload/jmf.js"></script>
	<script type="text/javascript" src="xsgzgl/comm/fileUpload/f.js"></script>
	<script type="text/javascript" src="xsgzgl/xyfd/jzfdwh/xyzyzxwh/js/xyzyzx.js"></script>
	<script type="text/javascript">
		function selectStu() {
            var goto = encodeURIComponent('${gotopath}');
            showDialog('请选择一个学生', 800, 500, 'xsxx_xsgl.do?method=showStudentsForFdyy&goto=' + goto);
        }
        function selectFdjs() {
            showDialog('请选择一个辅导人员', 600, 500, 'xyfd_xyzyzxjl.do?method=selectFdjs');
        }
		jQuery(function () {
			setZxyy();
        })

        function changeZxyy() {
			setZxyy();
        }
        function setZxyy() {
            var zxyy = jQuery("#zxyy").val();
            jQuery("#gk").hide();
            jQuery("#gk1").hide();
            jQuery("#jtyy1").hide();
            if(zxyy=='01'){ //挂科
                jQuery("#gk").show();
                jQuery("#gk1").show();
            }
            if(zxyy=='07'){//其它
                jQuery("#jtyy1").show();
            }
        }
	</script>
</head>
<body style="width:100%">
<html:form action="/xyfd_xyzyzxjl" method="post" styleId="demoForm">
	<div style='width:100%;height:500px;overflow-x:hidden;overflow-y:auto;'>
		<table width="100%" border="0" class="formlist">
			<thead>
			<tr>
				<th colspan="4">
					<span>咨询记录信息</span>
				</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<th width="20%">学生姓名</th>
				<td width="30%">
					${jbxx.xm}
				</td>
				<th width="20%"><span class="red">*</span>学号</th>
				<td width="30%">
					<input type="text" id="xh" name="xh" value="${jbxx.xh}" readonly="readonly"/>
					<button class="btn_01" type="button" onclick="selectStu();">选择</button>
				</td>
			</tr>
			<tr>
				<th>专业</th>
				<td>
					${jbxx.zymc}
				</td>
				<th>行政班级</th>
				<td>
					${jbxx.bjmc}
				</td>
			</tr>
			<tr>
				<th><span class="red">*</span>咨询原因</th>
				<td>
					<html:select name="model" property="zxyy" styleId="zxyy" style="width:173px" onchange="changeZxyy()">
						<html:option value="">--请选择--</html:option>
						<html:options collection="zxyyList" labelProperty="zxyymc" property="zxyydm"/>
					</html:select>
				</td>
				<th id="gk" style="display: none"><span class="red">*</span>挂科门数</th>
				<td id="gk1" style="display: none">
					<input type="text" id="gks" name="gks" value=""/>
				</td>
			</tr>
			<tr id="jtyy1" style="display: none">
				<th><span class="red">*</span>具体原因</th>
				<td colspan="3">
					<input type="text" id="jtyy" name="jtyy" value="" style="width: 100%"/>
				</td>
			</tr>
			<tr>
				<th>辅导人员姓名</th>
				<td>
					<input type="hidden" id="fdjs" name="fdjs" value=""/>
					<input type="text" id="fdjsxm" name="fdjsxm" value="" readonly="readonly"/>
					<button class="btn_01" type="button" onclick="selectFdjs();">选择</button>
				</td>
				<th>辅导人员类型</th>
				<td id="fdjslx">
				</td>
			</tr>
			<tr>
				<th>辅导时间</th>
				<td>
					<input type="text" id="fdrq" name="fdrq" onclick="showCalendar('fdrq','yyyy-MM-dd HH:mm');" readonly="readonly"/>
				</td>
				<th>辅导地点</th>
				<td>
					<input type="text" id="fddd" name="fddd"/>
				</td>
			</tr>
			<tr>
				<th colspan="4" style="text-align: left"><span class="red">*</span>具体举措：</th>
			</tr>
			<tr>
				<td colspan="4">
					<textarea name="jtjc" id="jtjc" style="width: 100%;height: 100px;resize:none;"
							  onblur="check()" placeholder="请输入20~500个字符！"></textarea>
				</td>
			</tr>
			</tbody>

		</table>
	</div>
	<div style="position:fixed;bottom:0;width: 100%">
		<table width="100%" border="0" class="formlist">
			<tfoot>
			<tr>
				<td colspan="4" >
					<div class="bz">"<span class="red">*</span>"为必填项</div>
					<div class="btn">
						<button type="button" type="button" onclick="saveZxjl();return false;" >
							保存记录
						</button>
						<button type="button" name="关 闭" onclick="iFClose();">
							关 闭
						</button>
					</div>
				</td>
			</tr>
			</tfoot>
		</table>
	</div>
</html:form>
</body>
</html>

     