package xsgzgl.pjpy.general.tjcx.jxjtj;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import xgxt.action.Base;
import xgxt.comm.search.SearchModel;
import xgxt.form.RequestForm;
import xgxt.form.User;

import com.zfsoft.basic.BasicAction;

/**
 * <p>
 * Title: 学生工作管理系统
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2012
 * </p>
 * <p>
 * Company: zfsoft
 * </p>
 * <p>
 * Author: wujian
 * </p>
 * <p>
 * Version: 1.0
 * </p>
 * <p>
 * Time:2012-7-28 下午14:19:22
 * </p>
 */

public class JxjtjAction extends BasicAction {
	
	/**
	 * 奖学金统计首页查询
	 * 
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward jxjtjCx(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		JxjtjService service = new JxjtjService();
		RequestForm rForm = new RequestForm();
		User user = getUser(request);
		// ----------------设置PATH begin-----------------------
		// ----------------显示title，判断读写权----------------
		rForm.setPath("pjpy_tjcx_jxjtj.do");
		
		SearchModel searchModel=new SearchModel();
		searchModel.setSearch_tj_pjzq(new String[]{Base.currXn});
		
		// ----------------页面首次加载参数设置为1----------------
		request.setAttribute("scjz", 1);
		
		searchModel.setPath("pjpy_tjcx_jxjtj.do");
		request.setAttribute("searchTj", searchModel);
		
		// ----------------设置PATH end-----------------------
		service.setRequestValue(rForm, user, request);
		return mapping.findForward("jxjtjCx");
	}
}