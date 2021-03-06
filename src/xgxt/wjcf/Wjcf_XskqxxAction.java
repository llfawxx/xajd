/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package xgxt.wjcf;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import xgxt.action.Base;
import xgxt.xljk.lrh_Util.form.lrh_commen_form;
import xgxt.xljk.lrh_Util.model.stu_info_model;
import xgxt.xljk.lrh_Util.util.lrh_commen_util;
import xgxt.xljk.lrh_Util.util.stu_info_util;

/** 
 * MyEclipse Struts
 * Creation date: 08-23-2007
 * 
 * XDoclet definition:
 * @struts.action path="/Wjcf_Xskqxx" name="wjcfForm" scope="request" validate="true"
 */
public class Wjcf_XskqxxAction extends Action {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		WjcfForm wjcfForm = (WjcfForm) form;// TODO Auto-generated method stub
		try {
		    int i = Base.chkTimeOut(request.getSession());
		    if (i <= 2) {
		    	wjcfForm.setErrMsg("登陆超时，请重新登陆！");
			return new ActionForward("/login.jsp", false);
		    }

		    HttpSession session = request.getSession();
		    if (session == null) {
			request.setAttribute("errMsg", "sadfsdf");
			return mapping.findForward("false");
		    } 
		
			ActionForward myActFwd = null;
			String act = request.getParameter("act");
			String doType=request.getParameter("doType");
//		    String userName=session.getAttribute("userName").toString();
//			String userDep=session.getAttribute("userDep").toString();
//			String userNameReal=session.getAttribute("userNameReal").toString();
//			String userOnLine=session.getAttribute("userOnLine").toString();
		if (act.equals("wjcf_xsxxkqxx")) {
			if(doType!=null&&!doType.equalsIgnoreCase(""))
			{
				if(doType.equals("xsxxkqxx_search"))
				{
					myActFwd = xsxxkqxx_search(mapping,form,request,response);	
				}
				else if(doType.equals("kqcc_view"))
				{
					//myActFwd = kqcc_view(mapping,form,request,response);	
				}
				else if(doType.equals("stu_info"))
				{
					myActFwd = stu_info(mapping,form,request,response);	
				}
				else if(doType.equals("xsxxkqxx_xskqmx"))
				{
					myActFwd = xsxxkqxx_xskqmx(mapping,form,request,response);	
				}
				else if(doType.equals("xsxxkqxx_xykqtj"))
				{
					myActFwd = xsxxkqxx_xykqtj(mapping,form,request,response);	
				}
				else if(doType.equals("xsxxkqxx_qxkqtj"))
				{
					myActFwd = xsxxkqxx_qxkqtj(mapping,form,request,response);	
				}
				else if(doType.equals("export_data"))
				{
					//export_data
					myActFwd = export_data(mapping,form,request,response);	
				}
				else if(doType.equals("inport_data"))
				{
					myActFwd = inport_data(mapping,form,request,response);	
				}
			}
			else
			{
				myActFwd = index_to_jsp(mapping,form,request,response);	
			}
		}
		return myActFwd;
		}
	catch(Exception e){
		e.printStackTrace();
		wjcfForm.setErrMsg("数据连接中断，请重新登陆！");
    	return new ActionForward("/login.jsp", false);
		}
	}
	
	private ActionForward index_to_jsp(ActionMapping mapping, ActionForm form,
    	    HttpServletRequest request, HttpServletResponse response)
    	    throws Exception {
			HttpSession session = request.getSession();
			String userName=session.getAttribute("userName").toString();
//			String userDep=session.getAttribute("userDep").toString();
			WjcfForm myform = (WjcfForm)form;
			String dyym="Wjcf_Xskqxx.do?act=wjcf_xsxxkqxx";
			lrh_commen_util commen_util= new lrh_commen_util();
			WjcfUtil myutil = new WjcfUtil();
			myutil.WjcfUtil1(request);
			myform.deal_gbk();
			boolean writeflag=commen_util.checkUsrPower2(userName, dyym);
			request.setAttribute("xnList", commen_util.get_xnndList());
			request.setAttribute("xqList", commen_util.get_xqList());
			request.setAttribute("njList", commen_util.get_njList());
			request.setAttribute("xyList", commen_util.get_xyList());
			request.setAttribute("zyList", commen_util.get_zyList(myform.getXydm()));
			request.setAttribute("bjList", commen_util.get_bjList2(myform.getXydm(),myform.getZydm(),myform.getNj()));
			//request.setAttribute("kqqkList", myutil.wjcf_getkqqkList());
			if(true==writeflag)
			{
				request.setAttribute("realTable", "view_xsxxkqxx");
				request.setAttribute("writeAble", "yes");
			}
			return mapping.findForward("index_to_jsp");
	}
	
	 private ActionForward stu_info(ActionMapping mapping, ActionForm form,
	    	    HttpServletRequest request, HttpServletResponse response)
	    	    throws Exception {
		 		HttpSession session = request.getSession();
		 		WjcfForm myform = (WjcfForm) form;
		 		WjcfUtil myutil= new WjcfUtil();
		 		myform.deal_gbk();
		 		String userName=session.getAttribute("userName").toString();
		 		String url="/xgxt/Wjcf_Xskqxx.do?act=wjcf_xsxxkqxx&doType=stu_info";
		 		lrh_commen_util commen_util= new lrh_commen_util();
				String xh=request.getParameter("stu_id");
				if(xh!=null&&!xh.equalsIgnoreCase(""))
				{
					myform.setXh(xh);
					stu_info_util stu_info= new stu_info_util();
					stu_info_model stu_mod=new stu_info_model();
					stu_mod=stu_info.stu_find_byxh(xh);
					myform.setXb(stu_mod.getXB());
					myform.setXm(stu_mod.getXM());
					myform.setNj(stu_mod.getNJ());
					myform.setXydm(stu_mod.getXYDM());
					myform.setXymc(stu_mod.getXYMC());
					myform.setZydm(stu_mod.getZYDM());
					myform.setZymc(stu_mod.getZYMC());
					myform.setBjdm(stu_mod.getBJDM());
					myform.setBjmc(stu_mod.getBJMC());
					boolean writeflag=commen_util.checkUsrPower2(userName, "Wjcf_Xskqxx.do?act=wjcf_xsxxkqxx");
					request.setAttribute("xnList", commen_util.get_xnndList());
					request.setAttribute("xqList", commen_util.get_xqList());
					request.setAttribute("njList", commen_util.get_njList());
					request.setAttribute("xyList", commen_util.get_xyList());
					request.setAttribute("zyList", commen_util.get_zyList(myform.getXydm()));
					request.setAttribute("bjList", commen_util.get_bjList2(myform.getXydm(),myform.getZydm(),myform.getNj()));
					request.setAttribute("kqqkList", myutil.wjcf_getkqqkList());
					if(true==writeflag)
					{
						request.setAttribute("realTable", "view_xsxxkqxx");
						request.setAttribute("writeAble", "yes");
					}
					return mapping.findForward("index_to_jsp");
				}
				else
				{
					request.setAttribute("url", url);
					return mapping.findForward("stu_info");
				}
	 }
	 
	 private ActionForward xsxxkqxx_search(ActionMapping mapping, ActionForm form,
	    	    HttpServletRequest request, HttpServletResponse response)
	    	    throws Exception {
		 		HttpSession session = request.getSession();
		 		WjcfForm myform = (WjcfForm) form;
		 		WjcfUtil myutil= new WjcfUtil();
		 		myform.deal_gbk();
		 		String userName=session.getAttribute("userName").toString();
		 		lrh_commen_util commen_util= new lrh_commen_util();
		 		String dyym="Wjcf_Xskqxx.do?act=wjcf_xsxxkqxx";
		 		List li=myutil.xsxxkqxx_search(myform);
		 		String rsNum=String.valueOf(li.size());
		 		String []zdm={"XH","XN","XQ","KCMC","MC","XM","XB","XYMC","ZYMC","BJMC","KQSJ"};
		 		List topTr=commen_util.Get_Table_Title("VIEW_XSXXKQXX", zdm);
		 		request.setAttribute("rs", li);
		 		request.setAttribute("rsNum", rsNum);
		 		request.setAttribute("topTr", topTr);
		 		boolean writeflag=commen_util.checkUsrPower2(userName, dyym);
				request.setAttribute("xnList", commen_util.get_xnndList());
				request.setAttribute("xqList", commen_util.get_xqList());
				request.setAttribute("njList", commen_util.get_njList());
				request.setAttribute("xyList", commen_util.get_xyList());
				request.setAttribute("zyList", commen_util.get_zyList(myform.getXydm()));
				request.setAttribute("bjList", commen_util.get_bjList2(myform.getXydm(),myform.getZydm(),myform.getNj()));
				request.setAttribute("kqqkList", myutil.wjcf_getkqqkList());
				if(true==writeflag)
				{
					request.setAttribute("realTable", "view_xsxxkqxx");
					request.setAttribute("writeAble", "yes");
				}
				return mapping.findForward("index_to_jsp");
	 }
	 
	 private ActionForward xsxxkqxx_xskqmx(ActionMapping mapping, ActionForm form,
	    	    HttpServletRequest request, HttpServletResponse response)
	    	    throws Exception {
//		 		HttpSession session = request.getSession();
		 		WjcfForm myform = (WjcfForm) form;
		 		WjcfUtil myutil= new WjcfUtil();
		 		myutil.WjcfUtil1(request);
		 		myform.deal_gbk();
		 		String xh=request.getParameter("xh");
		 		String rq=request.getParameter("rq");
		 		myform.setXh(xh);
		 		myform.setRq(rq);
//		 		String userName=session.getAttribute("userName").toString();
//		 		String url="/xgxt/Wjcf_Xskqxx.do?act=wjcf_xsxxkqxx&doType=stu_info";		
		 		lrh_commen_util commen_util= new lrh_commen_util();
		 		myutil.xsxxkqxx_xskqmx_add(myform);
		 		List rs=myutil.xsxxkqxx_xskqmx(myform);
		 		String rsNum=String.valueOf(rs.size());
		 		String []zdm={"XH","MC","KQJG","YF"};
		 		List topTr=commen_util.Get_Table_Title("VIEW_WJCF_XSCQMXB", zdm);
		 		myform=myutil.xsxxkqxx_xskqmx_view(myform);
		 		myform=myutil.xsxxkqxx_xskqmx_cqltj(myform);
		 		request.setAttribute("rs", rs);
		 		request.setAttribute("topTr", topTr);
		 		request.setAttribute("rsNum", rsNum);
		 		return mapping.findForward("xsxxkqxx_xskqmx");
	 }
	 
	 private ActionForward xsxxkqxx_xykqtj(ActionMapping mapping, ActionForm form,
	    	    HttpServletRequest request, HttpServletResponse response)
	    	    throws Exception {
//		 		HttpSession session = request.getSession();
		 		WjcfForm myform = (WjcfForm) form;
		 		WjcfUtil myutil= new WjcfUtil();
		 		myutil.WjcfUtil1(request);
		 		myform.deal_gbk();
		 		String xydm=request.getParameter("xydm");
		 		String rq=request.getParameter("rq");
		 		myform.setXydm(xydm);
		 		myform.setRq(rq);
		 		myform=myutil.xsxxkqxx_xskqmx_xycqltj(myform);
		 		myform.setRq("20"+rq);
		 		return mapping.findForward("xsxxkqxx_xykqtj");
	 }
	 
	 private ActionForward xsxxkqxx_qxkqtj(ActionMapping mapping, ActionForm form,
	    	    HttpServletRequest request, HttpServletResponse response)
	    	    throws Exception {
//		 		HttpSession session = request.getSession();
		 		WjcfForm myform = (WjcfForm) form;
		 		WjcfUtil myutil= new WjcfUtil();
		 		myutil.WjcfUtil1(request);
		 		lrh_commen_util commen_util= new lrh_commen_util();
		 		myform.deal_gbk();
		 		String rq=request.getParameter("rq");
		 		myform.setRq(rq);
		 		myform=myutil.xsxxkqxx_xskqmx_qxcqltj(myform);
		 		List rs=myutil.xsxxkqxx_xskqmx_qxcqltj_mx(myform);
		 		String rsNum=String.valueOf(rs.size());
		 		String []zdm={"XYMC","CQL","YF"};
		 		List topTr=commen_util.Get_Table_Title("VIEW_WJCF_QXCQMXB", zdm);
		 		request.setAttribute("topTr", topTr);
		 		request.setAttribute("rs", rs);
		 		request.setAttribute("rsNum", rsNum);
		 		return mapping.findForward("xsxxkqxx_qxkqtj");
	 }
	 
	 private ActionForward export_data(ActionMapping mapping, ActionForm form,
	    	    HttpServletRequest request, HttpServletResponse response)
	    throws Exception {
//		HttpSession session = request.getSession();
		WjcfForm myform = (WjcfForm) form;
		WjcfUtil myutil= new WjcfUtil();
//		lrh_commen_util commen_util= new lrh_commen_util();
		lrh_commen_form commen_form=new lrh_commen_form();
		myform.deal_gbk();
		String usersql="select a.xn,a.xq,a.xh,a.kqsj,a.mc,a.xm,a.xb,a.xymc,a.zymc,a.bjmc,a.kcmc from";
		myform.setUsersql(usersql);
		String sql=myutil.xsxxkqxx_xskqmc_getsql(myform).getSql();
		commen_form.setSql(sql);
		String tableName=myform.getTableName();
		commen_form.setTableName(tableName);
		request.setAttribute("commen_form", commen_form);
		return mapping.findForward("export_data");
	 }
	 
	 private ActionForward inport_data(ActionMapping mapping, ActionForm form,
	    	    HttpServletRequest request, HttpServletResponse response)
	    throws Exception {
//		HttpSession session = request.getSession();
		WjcfForm myform = (WjcfForm) form;
//		WjcfUtil myutil= new WjcfUtil();
//		lrh_commen_util commen_util= new lrh_commen_util();
		lrh_commen_form commen_form=new lrh_commen_form();
		myform.deal_gbk();
		String tableName="";
		commen_form.setTableName(tableName);
		request.setAttribute("commen_form", commen_form);
		return mapping.findForward("inport_data");
	 }
	 
}