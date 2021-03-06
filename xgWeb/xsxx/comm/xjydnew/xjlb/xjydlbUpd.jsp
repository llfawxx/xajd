<%@ page language="java" pageEncoding="GBK"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/syscommon/head.ini"%>
		<script type="text/javascript" src="js/jquery/jquery.form.js"></script>
		<script type="text/javascript" src="js/jquery/ajaxSubmit.js"></script>
		<script type="text/javascript" src="js/comm/commFunction.js"></script>
		<script type="text/javascript" src="xsxx/comm/xjydnew/js/xjydlb.js"></script>
		<script type="text/javascript">
		
		function saveForm(){	
			if(!check("xjlbdm-xjlbmc-sfyxj-sfzx")){
				return showAlert("请将带<font color='red'>*</font>的项目填写完整！");
			}
			  
		     var url = "xjyd.do?method=xjydlbUpd&type=update";
		      ajaxSubFormWithFun("xjydForm",url,function(data){
		    	 if(data["message"]=="保存成功！"){
		    		 showAlert(data["message"],{},{"clkFun":function(){
		    				if (parent.window){
		    					refershParent();
		    				}
		    			}});
		    	 }else{
		    		 showAlert(data["message"]);
		    	 }
				});
		  }
		</script>
	</head>
	<body>
		<html:form action="/xjyd" method="post" styleId="xjydForm" onsubmit="return false;">
			<html:hidden property="xjlbdmold"  styleId="xjlbdmold"/>
			<div class="tab">
				<table class="formlist">
					<tfoot>
						<tr>
							<td colspan="4">
								<div class="bz">
									"
									<span class="red">*</span>"为必填项
								</div>
								<div class="btn">
									<button type="button" name="保 存" onclick="saveForm();return false;">
										保 存
									</button>
									<button type="button" name="关 闭" onclick="iFClose();return false;">
										关 闭
									</button>
								</div>
							</td>
						</tr>
					</tfoot>
					<thead>
						<tr>
							<td colspan="4">
								<span>
									学籍类别维护
								</span>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>
								<span class="red">*</span>学籍类别代码
							</th>
							<td>
								<html:text property="xjlbdm" styleId="xjlbdm" maxlength="5"></html:text>
							</td>
						</tr>
						<tr>
							<th>
								<span class="red">*</span>学籍类别名称
							</th>
							<td>
								<html:text property="xjlbmc" styleId="xjlbmc" maxlength="10"></html:text>
							</td>
						</tr>
						<tr>
							<th>
								<span class="red">*</span>学籍状态
							</th>
							<td>
								<html:select property="sfyxj" styleId="sfyxj">
									<html:option value=""></html:option>
									<html:options collection="xjList" property="xjdm" labelProperty="xjmc" />
								</html:select>
							</td>
						</tr>
						<tr>
							<th>
								<span class="red">*</span>是否在校
							</th>
							<td>
								<html:select property="sfzx" styleId="sfzx">
									<html:option value=""></html:option>
									<html:options collection="zxList" property="zxdm" labelProperty="zxmc" />
								</html:select>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</html:form>
	</body>
</html>
