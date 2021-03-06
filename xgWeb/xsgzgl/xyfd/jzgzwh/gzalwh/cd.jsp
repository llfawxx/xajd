<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
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
	<script type="text/javascript" src="xsgzgl/xyfd/jzgzwh/gzalwh/js/gzal.js"></script>
	<script type="text/javascript">
        function saveCdjl() {
            var checkId = 'cdyy-cdsj';
            if(!checkNotNull(checkId)){
                showAlertDivLayer("请将必填项填写完整！");
                return false;
            }
            var url = 'xyfd_gzaljl.do?method=updateGzal&type=cd';
            ajaxSubFormWithFun("demoForm",url,function(data){
                showAlertDivLayer(data["message"],{},{"clkFun":function(){
                    if (parent.window){
                        refershParent();
                    }
                    iFClose();
                }});
            });
        }
	</script>
</head>
<body style="width:100%">
<html:form action="/xyfd_gzaljl" method="post" styleId="demoForm">
	<input type="hidden" id="jdh" name="jdh" value="${model.jdh}"/>
	<div style='width:100%;height:300px;overflow-x:hidden;overflow-y:auto;'>
		<table width="100%" border="0" class="formlist">
			<thead>
			<tr>
				<th colspan="2">
					<span>撤档</span>
				</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<th width="30%"><span class="red">*</span>撤档原因</th>
				<td width="70%">
					<textarea name="cdyy" id="cdyy" style="width: 100%;resize:none;" ></textarea>
				</td>
			</tr>
			<tr>
				<th><span class="red">*</span>撤档时间</th>
				<td>
					<input type="text" id="cdsj" name="cdsj" onclick="showCalendar('cdsj','yyyy-MM-dd HH:mm');" readonly="readonly"/>
				</td>
			</tr>
			</tbody>
		</table>
	<div style="position:fixed;bottom:0;width: 100%">
		<table width="100%" border="0" class="formlist">
			<tfoot>
			<tr>
				<td colspan="4" >
					<div class="bz">"<span class="red">*</span>"为必填项</div>
					<div class="btn">
						<button type="button" type="button" onclick="saveCdjl();return false;" >
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
	</div>
</html:form>
</body>
</html>

 