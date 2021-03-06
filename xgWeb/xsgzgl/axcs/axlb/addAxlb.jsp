<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/syscommon/head.ini"%>
		<script type="text/javascript" src="js/jquery/jquery.form.js"></script>
		<script type="text/javascript" src="js/jquery/ajaxSubmit.js"></script>
		<script type="text/javascript" src="js/check.js"></script>
		<script language="javascript">
		function saveForm(){	  
			  var mc=jQuery("#mc").val();
			  var dm=jQuery("#dm").val();
			  if(jQuery.trim(mc)==""){
				  showAlert("请输入名称！");
					return false;
			  }
			  if(jQuery.trim(dm)==""){
				  showAlert("请输入代码！");
					return false;
			  }
		     var url = "axcsAxlbgl.do?method=addAxlb&type=save";
		      ajaxSubFormWithFun("AxlbglForm",url,function(data){
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
		<html:form action="/axcsAxlbgl" method="post"
			styleId="AxlbglForm" onsubmit="return false;">

			<div style='tab;width:100%;overflow-x:hidden;overflow-y:auto;'>
				<table align="center" class="formlist">
					<tbody>
						<tr>
							<th>
								<span class="red">*</span>代码
							</th>
							<td>
								<html:text property="dm" styleId="dm" maxlength="20"
									styleClass="text_nor" />
							</td>
						</tr>
						<tr>
							<th>
								<span class="red">*</span>名称
							</th>
							<td>
								<html:text property="mc" styleId="mc" maxlength="20"
									styleClass="text_nor" />
							</td>
						</tr>
						<tr>
							<th>
								说明
							</th>
							<td>
								<html:textarea property="sm" styleId="sm" style="width:95%;" rows="5" onkeypress="checkLen(this,200);"></html:textarea>
							</td>
						</tr>

					</tbody>
					</table>
			      </div>
			      <table width="100%" border="0" class="formlist" style="position: fixed; _position: absolute; bottom: 0;">
					<tfoot>
						<tr>
							<td colspan="2">
								<div class="bz">
									"
									<span class="red">*</span>"为必填项
								</div>
								<div class="btn">
									<button type="button" type="button"
										onclick="saveForm();return false;">
										保 存
									</button>
									<button type="button" type="button"
										onclick="iFClose();return false;">
										关 闭
									</button>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>

		</html:form>
	</body>
</html>

