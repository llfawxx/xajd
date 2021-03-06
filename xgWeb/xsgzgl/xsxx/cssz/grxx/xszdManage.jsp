<%@ page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- 作者：伟大的骆 -->
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="/syscommon/pagehead_V4.ini"%>
		<link rel="stylesheet" type="text/css" href="js/jquery/themes/default/easyui.css" />
	    <link rel="stylesheet" type="text/css" href="js/jquery/themes/icon.css" />
	    <script language="javascript" src="js/check.js"></script>
		<script language="javascript" src="js/comm/commFunction.js"></script>
		<script language="javascript" defer="defer">
		//显示字段选择Div
		function showZdxzDiv(){
			
			var url="xsxx_cssz_grxx_method.do?method=showZdxzDiv";
			
			//其他数据
		 	var parameter = {
				"yhlx":"xsqx"
			};
		  
			jQuery("#div_zdxz").load(url,parameter,function(){});
		}
		
		//点击全部
		function checkAll(num){
			var cb_name = "cb_"+num;
			
			var count = jQuery("input[name="+cb_name+"]").length;

			var cb_check = $("cb_all_"+num).checked;
			
			for(var i=0;i<count;i++){
				var obj = jQuery("input[name="+cb_name+"]")[i];
				obj.checked=cb_check;
			}
			
		}
		
		//前一步
		function preStep(tag){
			if(tag == "ok"){
				saveZdqx("pre");
			}
		}
		
		//下一步
		function nextStep(tag){
			if(tag == "ok"){
				saveZdqx("next");
			}
		}
		
		function saveZdqx(step){
		
			var i = 0;
			var zd = new Array();   				  
			jQuery("input[type=checkbox][value!=all]:checked").each(
				function(){zd[i] = escape(jQuery(this).val());i++;}
			);
			
			var url="xsxx_cssz_grxx_method.do?method=saveZdqx";
			
			$("divWaiting").style.display="";
			$("divDisable").style.display="";
				
			var over = "no";
			if("next" == step){
				over = "yes";
			}
			
			//参数
		 	var parameter = {
				"yhlx":"xsqx",
				"zd":zd.join("!!@@!!"),
				"over":over
			};
			
			jQuery.post(url,parameter,function(result){
			
				//$("divWaiting").style.display="none";
				//$("divDisable").style.display="none";
				
				if("pre" == step){
					refreshForm("xsxx_cssz_grxx.do");
				}else if("next" == step){
					$("divWaiting").style.display="none";
					$("divDisable").style.display="none";
					alertInfo(result);
					//refreshForm("xsxx_cssz_grxx_method.do?method=lszdManage");
				}
			});
		}
		</script>
	</head>
	<body onload="showZdxzDiv()" >
		<!-- 标题 -->
		<div class="tab_cur">
			<p class="location">
				<em>您的当前位置：</em><a>${title }</a>
			</p>
			<p class="help">
				<a href="#" onclick="return false;" onmousedown ="showHelpDiv();">使用帮助</a>
			</p>
		</div>			
		<!-- 标题 end-->
		<!-- 提示信息 START-->
		<div class="prompt" id="div_help" style="display: none">
			<h3>
				<span>提示：</span>
			</h3>
			<p>
				鼠标移动到右上角<font color="blue">帮助中心</font>，可查看本模块的相关说明。</br>
				<span id="div_help" style="display: none">
				1.以下罗列出的字段为学校学生信息库的相关字段，如果不能满足学校的实际情况，请<font color="blue">联系相关人员</font>。</br>
				2.勾选相关字段后点击<font color="blue">保存</font>后，本次设置完成。</br>
				3.只有被勾选的字段，学生用户才有<font color="blue">权限</font>进行修改。</br>
				4.如果您点击了<font color="blue">上一步</font>，那么系统会认为您还未设置完成，必须要再操作一下<font color="blue">保存</font>按钮。</br>
				</span>
			</p>
			<a class="close" title="隐藏"  onclick="this.parentNode.style.display='none';"></a>
		</div>
		<!-- 提示信息 end-->
		
		<html:form action="/xsxx_cssz" method="post">

			<!-- 隐藏域 -->
			<%@ include file="/comm/hiddenValue.jsp"%>
			<!-- 隐藏域 end-->
			
			<!-- 维护信息 -->
			<table class="formlist" width="">
				<thead onclick="">
					<tr>
						<th>
							<span>学生可修改字段选择</span>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="">	
							<div style="width:100%;height:420px;overflow-x:hidden;overflow-y:auto;" id="div_zdxz">
							
							</div>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td>
							<div class="btn">
								<!-- 下一步 -->
								<button type="button" onclick="confirmInfo('请确认您的设置',preStep);">
									上一步
								</button>
								
								<!-- 下一步 -->
<%--								<button type="button" onclick="confirmInfo('请确认您的设置',nextStep);">--%>
<%--									下一步--%>
<%--								</button>--%>
								
								<button type="button" onclick="confirmInfo('请确认您的设置',nextStep);">
									保 存
								</button>
							</div>
						</td>
					</tr>
				</tfoot>
			</table>
			<!-- 维护信息 end-->
			
			<!-- 提示信息 -->
			<%@ include file="/comm/other/tsxx.jsp"%>

		</html:form>
	</body>
</html>