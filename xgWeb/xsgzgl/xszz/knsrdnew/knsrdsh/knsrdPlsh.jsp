<%@ page language="java" pageEncoding="GBK"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/syscommon/head.ini"%>
		<script type="text/javascript" src="js/check.js"></script>
		<script type="text/javascript">
		
			function savePlsh(shzt){
				
				var rddc = jQuery("#rddc").val();
				var shyj = jQuery("#shyj").val();
				
				if (shzt == "1" && rddc == ""){
					showAlert("请选择推荐档次！");
					return false;
				}
				
				if (shyj == ""){
					showAlert("请填写审核意见！");
					return false;
				}
				
				var api = frameElement.api,W = api.opener;
				W.savePlsh(shzt,rddc,shyj);
				closeDialog();
			}
		</script>
	</head>
	<body>
		<html:form action="/xg_xszz_knsrd_knshgl" method="post" onsubmit="return false;">
			<div class="tab">
				<table class="formlist">
					<tfoot>
						<tr>
							<td colspan="2">
								<div class="btn">
									<button type="button" onclick="savePlsh('1');">
										通过
									</button>
									<button type="button" onclick="savePlsh('2');">
										不通过
									</button>
<%--									<button type="button" onclick="savePlsh('3');" >--%>
<%--										退回--%>
<%--									</button>--%>
									<button type="button" name="关 闭" onclick="closeDialog();">
										关 闭
									</button>
								</div>
							</td>
						</tr>
					</tfoot>
					<thead>
						<tr>
							<td colspan="2">
								<span>
									批量审核
								</span>
							</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th width="25%">推荐档次</th>
							<td width="75%">
								<html:select property="rddc" styleId="rddc">
									<html:option value=""></html:option>
									<html:options collection="knsdcList" property="dcdm" labelProperty="dcmc"/>
								</html:select>
							</td>
						</tr>
						<tr>
							<th>
								<font color="red">*</font>
								审核意见
								<br/>
								<font color="red">(限200字)</font>
							</th>
							<td>
								<jsp:include page="/xsgzgl/comm/shlc/cyyj.jsp?gnid=knsrd&id=shyj" />
								<html:textarea property="shyj" style="width:98%;margin-top:5px" rows="6"
											   onblur="checkLen(this,200);"  styleId="shyj"
								></html:textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</html:form>
	</body>
</html>
