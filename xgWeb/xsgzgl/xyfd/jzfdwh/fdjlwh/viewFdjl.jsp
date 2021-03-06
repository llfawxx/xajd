
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
	<script type="text/javascript" src="xsgzgl/xyfd/jzfdwh/fdjlwh/js/fdjl.js"></script>

</head>
<body style="width:100%">
<html:form action="/xyfd_fdjl" method="post" styleId="demoForm">
	<input type="hidden" id="yyh" name="yyh" value="${fdyyxx.yyh}"/>
	<div style='width:100%;height:500px;overflow-x:hidden;overflow-y:auto;'>
		<table width="100%" border="0" class="formlist">
			<thead>
			<tr>
				<th colspan="4">
					<span>辅导记录信息</span>
				</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<th width="20%">辅导人员姓名</th>
				<td width="30%">
					${fdyyxx.fdjsxm}
				</td>
				<th width="20%">辅导人员类别</th>
				<td width="30%">
					${fdyyxx.fdjslb}
				</td>
			</tr>
			<tr>
				<th>辅导时间</th>
				<td>
					${fdyyxx.fdsj}
				</td>
				<th>辅导地点</th>
				<td>
					${fdyyxx.fdsdd}
				</td>
			</tr>
			<tr>
				<th>学生姓名</th>
				<td>
					${fdyyxx.xm}
				</td>
				<th>电话</th>
				<td>
					${jbxx.sjhm}
				</td>
			</tr>
			</tbody>
			<thead>
				<tr>
					<th colspan="4"><span>问题记录：</span></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4">
						<html:textarea name="fdjlxx" property="fdjl" styleId="fdjl"
									   style="width: 500px;height: 100px;resize:none;" readonly="true"></html:textarea>
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
					<div class="btn">
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