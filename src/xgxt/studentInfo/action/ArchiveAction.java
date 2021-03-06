/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package xgxt.studentInfo.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import xgxt.studentInfo.service.ArchiveService;

/**
 * <p>Title: 学生工作管理系统</p>
 * <p>Description: 学生转档Action</p>
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: zfsoft</p>
 * <p>Author: 李容</p>
 * <p>Version: 1.0</p>
 * <p>Time: 2008-06-12</p>
 */
public class ArchiveAction extends DispatchAction {
	
	/**
	 * 转档申请
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 * **/
	ArchiveService service = new ArchiveService();
	public ActionForward distributeAppPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String sPage = request.getParameter("dyym");
		List rs = null;
		
		if(sPage!=null && !"".equalsIgnoreCase(sPage)){			
			return new ActionForward("/"+sPage);
		}		
		rs = service.getPageList("app");
		request.setAttribute("List", rs);
		return mapping.findForward("disApp");
	}
	
	/**
	 * 转档申请结果查询
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 * **/
	public ActionForward distributeQuePage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String sPage = request.getParameter("dyym");
		List rs = null;
		
		if(sPage!=null && !"".equalsIgnoreCase(sPage)){			
			return new ActionForward("/"+sPage);
		}		
		rs = service.getPageList("que");
		request.setAttribute("List", rs);
		return mapping.findForward("disQue");
	}
	
	/**
	 *Method distributeExaPage 转档申请审核
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 * **/
	public ActionForward distributeExaPage(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String sPage = request.getParameter("dyym");
		List rs = null;
		
		if(sPage!=null && !"".equalsIgnoreCase(sPage)){			
			return new ActionForward("/"+sPage);
		}		
		rs = service.getPageList("exa");
		request.setAttribute("List", rs);
		return mapping.findForward("disExa");
	}
	
	
}