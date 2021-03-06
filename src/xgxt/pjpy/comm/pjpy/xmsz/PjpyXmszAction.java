/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package xgxt.pjpy.comm.pjpy.xmsz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import xgxt.action.Base;
import xgxt.action.BaseAction;
import xgxt.form.User;
import xgxt.gygl.gywh.DelDataDetect;
import xgxt.gygl.gywh.DelDetectModel;
import xgxt.pjpy.comm.pjpy.jbsz.PjpyJbszService;
import xgxt.utils.FormModleCommon;
import xgxt.utils.SearchUtils;

/**
 * MyEclipse Struts Creation date: 02-16-2011
 * 
 * XDoclet definition:
 * 
 * @struts.action validate="true"
 */
public class PjpyXmszAction extends BaseAction {
	/*
	 * Generated Methods
	 */

	/**
	 * Method pjxmsz
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 * @throws Exception 
	 */
	public ActionForward pjxmsz(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		DelDataDetect delData=new DelDataDetect();
		DelDetectModel model=new DelDetectModel();
		PjpyJbszService jbszService = new PjpyJbszService();
		PjpyXmszForm myForm=(PjpyXmszForm)form;
		PjpyXmszService service = new PjpyXmszService();
		HashMap<String, String> jbszMap = jbszService.getPjpyJbsz();
		
		User user = getUser(request);// 用户对象
		String doType = request.getParameter("doType");
		
		boolean blog=service.getPjXtszb();
		if (!blog) {
			String msg = "评奖基本设置尚未完成，无法进行接下去的操作，请联系管理员或相关人员对其进行设置，请确认！";
			request.setAttribute("yhInfo", msg);
			return new ActionForward("/yhInfo.do", false);
		}
		
		String tableName = "xg_pjpy_pjxmwhb";
		String viewName = "view_xg_pjpy_pjxmwh";
		
		//是否启用开关保存
		if("save".equalsIgnoreCase(doType)){
			request.setAttribute("result", service.updateSfqy(myForm));
			doType="query";
		}
		
		//批量删除
		if ("delete".equalsIgnoreCase(doType)) {
			model.setPath("pjpy_jbsz_xmsz.do");
			model.setPkValue(myForm.getPrimarykey_cbv());
			delData.dataDetect(model,request);
			if(model.isBool()){
				this.deleteOperation(request, tableName);
				jbszService.delRssz(model);
				
			}else{
				request.setAttribute("delMessage", model.getMessage());
			}
			doType="query";
			
		}
		
		//复制项目
		if("fzxm".equalsIgnoreCase(doType)){
			boolean result=service.fzlnxm(myForm);
			request.setAttribute("result", result);
			doType="query";
		}
		
		String queryequals_pjxn=request.getParameter("queryequals_pjxn");
		String queryequals_pjxq=request.getParameter("queryequals_pjxq");
		String queryequals_pjnd=request.getParameter("queryequals_pjnd");
		
		if(Base.isNull(queryequals_pjnd)){
			queryequals_pjnd=jbszMap.get("pjnd");
			myForm.setQueryequals_pjnd(jbszMap.get("pjnd"));
		}
		if(Base.isNull(queryequals_pjxn)){
			queryequals_pjxn=jbszMap.get("pjxn");
			myForm.setQueryequals_pjxn(jbszMap.get("pjxn"));
		}
		if(Base.isNull(queryequals_pjxq)){
			queryequals_pjxq=jbszMap.get("pjxq");
			myForm.setQueryequals_pjxq(jbszMap.get("pjxq"));
		}
		if(	queryequals_pjxn.equalsIgnoreCase(jbszMap.get("pjxn"))
				&& queryequals_pjxq.equalsIgnoreCase(jbszMap.get("pjxq"))
				&& queryequals_pjnd.equalsIgnoreCase(jbszMap.get("pjnd"))){
			request.setAttribute("showDqpj", "yes");
		}
	
		String pjxn=myForm.getPjxn();
		String pjxq=myForm.getPjxq();
		String pjnd=myForm.getPjnd();
		
		if(Base.isNull(pjxn)){
			pjxn=jbszMap.get("pjxn");
			myForm.setPjxn(jbszMap.get("pjxn"));
		}
		if(Base.isNull(pjxq)){
			pjxq=jbszMap.get("pjxq");
			myForm.setPjxq(jbszMap.get("pjxq"));
		}
		if(Base.isNull(pjnd)){
			pjnd=jbszMap.get("pjnd");
			myForm.setPjnd(jbszMap.get("pjnd"));
		}
		
		if (pjxn.equalsIgnoreCase(jbszMap.get("pjxn"))
				&& pjxq.equalsIgnoreCase(jbszMap.get("pjxq"))
				&& pjnd.equalsIgnoreCase(jbszMap.get("pjnd"))) {
			request.setAttribute("showDqpj", "yes");
		}
		
		// 查询
		// if ("query".equalsIgnoreCase(doType)) {
//		String[] outputColumn = { "pkValue", "pjxn", "xqmc", "pjnd", "xmdm",
//				"xmmc", "sqfsm", "sqzqm", "lcmc", "sftbxm", "sfqy" };
		String[] outputColumn = { "pkValue", "xmdm", "xmmc", "sqfsm", "sqzqm",
				"lcmc", "sftbxm", "sfqy" };
		List<HashMap<String,String>> topTr = SearchUtils.getTopTr(viewName, outputColumn, null);
//		this.selectPageDataByPagination(request, myForm, tableName, viewName,
//				outputColumn);
		ArrayList<String[]> rs = service.getXmszList(myForm, user);
		request.setAttribute("topTr", topTr);
		request.setAttribute("rs", rs);
		//}
			
		// 初始化列表（项目性质、项目类别等）
		service.initList(request);
		request.setAttribute("xmxzList", service.getXmxzList());
		request.setAttribute("path", "pjpy_jbsz_xmsz.do");
		FormModleCommon.commonRequestSet(request);
		FormModleCommon.setNdXnXqList(request);
		return mapping.findForward("pjxmsz");
	}

	/**
	 * Method pjxmszOne
	 * 评奖项目设置(增加)
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward pjxmszOne(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		PjpyXmszForm myForm = (PjpyXmszForm) form;
		PjpyXmszService service = new PjpyXmszService();
		PjpyJbszService jbszService = new PjpyJbszService();

		// ==============获取评奖基本设置===========
		HashMap<String, String> jbszMap = jbszService.getPjpyJbsz();
		
		// =============显示============
		myForm.setPjnd(jbszMap.get("pjnd"));
		myForm.setPjxn(jbszMap.get("pjxn"));
		myForm.setPjxq(jbszMap.get("pjxq"));
		// =============显示 end===========

		// ==============保存================
		myForm.setSave_pjnd(jbszMap.get("pjnd"));
		myForm.setSave_pjxn(jbszMap.get("pjxn"));
		myForm.setSave_pjxq(jbszMap.get("pjxq"));
		// ==============保存end================
		
		// =================获取评奖基本设置end=======================

		String tabName = "xg_pjpy_pjxmwhb";
		String doType = request.getParameter("doType");

		if ("save".equalsIgnoreCase(doType)) {
			this.insertOperation(request, tabName);
		}
		
		request.setAttribute("doType", doType);
		// 初始化列表（项目性质、项目类别等）
		service.initList(request);
		request.setAttribute("xmxzList", service.getXmxzList());
		request.setAttribute("lcList", service.getShlcList());//审核流程
		request.setAttribute("path", "pjpy_jbsz_xmsz.do");
		FormModleCommon.commonRequestSet(request);
		FormModleCommon.setNdXnXqList(request);
		return mapping.findForward("pjxmszOne");
	}
	/**
	 * Method pjxmszOne
	 * 评奖流程化项目设置(增加)  流程一
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward pjxmszFlow(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		PjpyXmszForm myForm = (PjpyXmszForm) form;
		PjpyXmszService service = new PjpyXmszService();
		PjpyJbszService jbszService = new PjpyJbszService();

		// ==============获取评奖基本设置===========
		HashMap<String, String> jbszMap = jbszService.getPjpyJbsz();
		
		// =============显示============
		myForm.setPjnd(jbszMap.get("pjnd"));
		myForm.setPjxn(jbszMap.get("pjxn"));
		myForm.setPjxq(jbszMap.get("pjxq"));
		myForm.setPjxqmc(service.getXqmc(jbszMap.get("pjxq")));
		// =============显示 end===========

		// ==============保存================
		myForm.setSave_pjnd(jbszMap.get("pjnd"));
		myForm.setSave_pjxn(jbszMap.get("pjxn"));
		myForm.setSave_pjxq(jbszMap.get("pjxq"));
		// ==============保存end================
		
		// =================获取评奖基本设置end=======================

		String tabName = "xg_pjpy_pjxmwhb";
		String doType = request.getParameter("doType");

		if ("save".equalsIgnoreCase(doType)) {
			this.insertOperation(request, tabName);
			String xmdm = myForm.getSave_xmdm();
			//String 
			return new ActionForward("/pjpy_ty_jdsz.do?method=jdszFlow&doType=''&xmdm="+xmdm,false);
		}
		request.setAttribute("myForm", myForm);
		request.setAttribute("doType", doType);
		// 初始化列表（项目性质、项目类别等）
		service.initList(request);
		request.setAttribute("xmxzList", service.getXmxzList());
		request.setAttribute("lcList", service.getShlcList());//审核流程
		request.setAttribute("path", "pjpy_jbsz_xmsz.do");
		FormModleCommon.commonRequestSet(request);
		FormModleCommon.setNdXnXqList(request);
		return mapping.findForward("pjxmszFlow");
	}
	/**
	 * Method pjxmszOne
	 * 评奖项目设置(修改)
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward pjxmszUpdate(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		PjpyXmszForm myForm = (PjpyXmszForm) form;
		PjpyXmszService service = new PjpyXmszService();
		PjpyJbszService jbszService = new PjpyJbszService();
		
		String tabName = "xg_pjpy_pjxmwhb";
		String viewName="view_xg_pjpy_pjxmwh";
		String doType = request.getParameter("doType");
		String pkValue = request.getParameter("pkValue");
		
		// ==============获取评奖基本设置===========
		HashMap<String, String> jbszMap = jbszService.getPjpyJbsz();
		
		// =============显示============
		myForm.setPjnd(jbszMap.get("pjnd"));
		myForm.setPjxn(jbszMap.get("pjxn"));
		myForm.setPjxq(jbszMap.get("pjxq"));
		// =============显示 end===========

		// ==============保存================
		myForm.setSave_pjnd(jbszMap.get("pjnd"));
		myForm.setSave_pjxn(jbszMap.get("pjxn"));
		myForm.setSave_pjxq(jbszMap.get("pjxq"));
		// ==============保存end================
		
		
		
		// =================获取评奖基本设置end=======================
		if("save".equalsIgnoreCase(doType)){
			boolean b=service.checkSfysq(myForm.getSave_xmdm()); 
			if(!b){//若有学生申请，则不可修改
				this.updateOperation(request, tabName);
			}else{
				request.setAttribute("message", "该项目已有学生申请，不可修改！");
			}
		}
		
		
		if("update".equalsIgnoreCase(doType)){
			this.selectPageDataByOne(request, tabName, viewName, pkValue);	
			
		}
		
		request.setAttribute("pkValue", pkValue);
		request.setAttribute("doType", doType);
		// 初始化列表（项目性质、项目类别等）
		service.initList(request);
		request.setAttribute("xmxzList", service.getXmxzList());
		request.setAttribute("lcList", service.getShlcList());//审核流程
		request.setAttribute("path", "pjpy_zhsz.do");
		FormModleCommon.commonRequestSet(request);
		FormModleCommon.setNdXnXqList(request);
		return mapping.findForward("pjxmszOne");
	}
	
	
	/**
	 * Method pjxmszOne
	 * 评奖项目设置(修改)
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward pjxmszFlowUpdate(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		PjpyXmszForm myForm = (PjpyXmszForm) form;
		PjpyXmszService service = new PjpyXmszService();
		PjpyJbszService jbszService = new PjpyJbszService();
		
		String tabName = "xg_pjpy_pjxmwhb";
		String viewName="view_xg_pjpy_pjxmwh";
		String doType ="update";
		String pkValue = request.getParameter("pkValue");
		
		
		// ==============获取评奖基本设置===========
		HashMap<String, String> jbszMap = jbszService.getPjpyJbsz();
		
		// =============显示============
		myForm.setPjnd(jbszMap.get("pjnd"));
		myForm.setPjxn(jbszMap.get("pjxn"));
		myForm.setPjxq(jbszMap.get("pjxq"));
		// =============显示 end===========
	
		// ==============保存================
		myForm.setSave_pjnd(jbszMap.get("pjnd"));
		myForm.setSave_pjxn(jbszMap.get("pjxn"));
		myForm.setSave_pjxq(jbszMap.get("pjxq"));
		// ==============保存end================
		
		// =================获取评奖基本设置end=======================
		pkValue = myForm.getXmdm()+myForm.getPjxn()+myForm.getPjxq()+myForm.getPjnd();
		if("save".equalsIgnoreCase(doType)){
			boolean b=service.checkSfysq(myForm.getSave_xmdm()); 
			if(!b){//若有学生申请，则不可修改
				this.updateOperation(request, tabName);
			}else{
				request.setAttribute("message", "该项目已有学生申请，不可修改！");
			}
		}
		
		
		if("update".equalsIgnoreCase(doType)){
			this.selectPageDataByOne(request, tabName, viewName, pkValue);	
		}
		
		request.setAttribute("pkValue", pkValue);
		request.setAttribute("doType", doType);
		// 初始化列表（项目性质、项目类别等）
		service.initList(request);
		request.setAttribute("xmxzList", service.getXmxzList());
		request.setAttribute("lcList", service.getShlcList());//审核流程
		request.setAttribute("path", "pjpy_jbsz_xmsz.do");
		FormModleCommon.commonRequestSet(request);
		FormModleCommon.setNdXnXqList(request);
		return mapping.findForward("pjxmszFlow");
	}
	/**
	 * 判断项目代码是否存在
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward xmdmExist(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		PjpyXmszForm myForm = (PjpyXmszForm) form;
		PjpyXmszService service = new PjpyXmszService();
		PjpyJbszService jbszService = new PjpyJbszService();
		// ==============获取评奖基本设置===========
		HashMap<String, String> jbszMap = jbszService.getPjpyJbsz();
		myForm.setPjnd(jbszMap.get("pjnd"));
		myForm.setPjxn(jbszMap.get("pjxn"));
		myForm.setPjxq(jbszMap.get("pjxq"));
		
		String xmdm = request.getParameter("xmdm");
		myForm.setXmdm(xmdm);
		// 提示信息
		boolean message = false;
        try {
			 if(service.xmdmExist(myForm)){
				 message = true;
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=gbk");
		
		response.getWriter().print(message);
		
		return null;
	}
	
}