<%@ page language="java" import="java.util.*" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/syscommon/head.ini"%>
		<script type="text/javascript" src="js/jquery/jquery.form.js"></script>
		<script type="text/javascript" src="js/jquery/ajaxSubmit.js"></script>
		<script type="text/javascript" src="js/calendar/calendar.js"></script>
		<script type="text/javascript" src="xsgzgl/jskp/xspjjg/js/xspjjg.js"></script>
		<script type="text/javascript" src="js/check.js"></script>
		<script type="text/javascript"></script>
		<style type = "text/css"></style>
	</head>
	<body>
		<html:form action="/xspj_xspjjg" method="post" styleId="xspjjgForm">
			<div style="tab;overflow-x:hidden;overflow-y:auto;margin-bottom:0px;" >
				<table width="100%" border="0" class="formlist">
					<tbody>
						<tr>
							<th>模板下载
							</th>
							<td colspan="3">
								<a href="javascript:void(0);" onclick="mbDownload();" class="name"  style="margin-left:3px;font-weigth:bold;font-size:14px">点击这里下载导入模板</a>
							</td>
						</tr>
						<tr>
							<th>
								<span class="red">*</span>选择导入文件
							</th>
							<td colspan="3">
								<input type="file" onchange="selectFiles(this)" id="drmb" name="drmb"/>
							</td>
						</tr>
						<tr>
							<th>导入说明</th>
							<td colspan="3">
								<font color="blue">请使用本页面提供的下载模板进行导入!</font>
							</td>
						</tr>
						<tr id="errortr" style="display: none">
						    <th>错误数据下载</th>
							<td colspan="3">
								<a href="javascript:void(0);" data_file="" onclick="downloaderror();" id = "errora" class="name" style="margin-left:3px;font-weigth:bold;font-size:14px">下载</a>
							</td>
						</tr>
					</tbody>
				</table>
				</div>	
			<div>
				<table width="100%" border="0" class="formlist" style="position: fixed; _position: absolute; bottom: 0;">
					<tfoot>
						<tr>
							<td colspan="4">
								<div class="bz">
									"<span class="red">*</span>"为必填项
								</div>
								<div class="btn">
									<button type="button" onclick="importSave();">
										导入
									</button>
									<button type="button" onclick="iFClose();">
										关闭
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