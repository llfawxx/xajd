/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package xgxt.bxgl.ntzy.ylbx;

import org.apache.struts.action.ActionForm;

import xgxt.utils.Pages;

/** 
 * MyEclipse Struts
 * Creation date: 10-18-2010
 * 
 * XDoclet definition:
 * @struts.form name="ntzyYlbxForm"
 */
public class NtzyYlbxForm extends ActionForm {
	/*
	 * Generated Methods
	 */
	private String tzlsh;//通知流水号
	private String grbh;//个人编号
	private String dwbh;//单位编号
	private String sfzh;//身份证号
	private String xm;//姓名
	private String xb;//性别
	private String csrq;//出生日期
	private String cym;//曾用名
	private String bjdm;//班级代码
	private String bz; //备注
	private String xh;//学号
	private String bxsj;//保险时间
	private String kssj;
	private String jssj;
	private String xydm;
	
	private String querylike_xh;//学号
	private String querylike_tzlsh;
	private String querylike_grbh;//个人编号
	private String queryequals_dwbh;//单位编号
	private String querylike_sfzh;//身份证号
	private String querylike_xm;//姓名
	private String queryequals_xb;//性别
	private String queryequals_csrq;//出生日期
	private String queryequals_cym;//曾用名
	private String queryequals_xydm;//学院代码
	private String queryequals_zydm;//专业代码
	private String queryequals_bjdm;//班级代码
	private String queryequals_bz;//备注
	private String queryequals_nj;//年级
	
	private String save_xh;//学号
	private String save_tzlsh;//流水号
	private String save_sbsj;//申请时间
	private String save_bz;//备注
	private String save_bxsj;//保险时间
	
	private Pages pages=new Pages();

	public String getBjdm() {
		return bjdm;
	}

	public void setBjdm(String bjdm) {
		this.bjdm = bjdm;
	}

	public String getCsrq() {
		return csrq;
	}

	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}

	public String getCym() {
		return cym;
	}

	public void setCym(String cym) {
		this.cym = cym;
	}

	public String getDwbh() {
		return dwbh;
	}

	public void setDwbh(String dwbh) {
		this.dwbh = dwbh;
	}

	public String getGrbh() {
		return grbh;
	}

	public void setGrbh(String grbh) {
		this.grbh = grbh;
	}

	public Pages getPages() {
		return pages;
	}

	public void setPages(Pages pages) {
		this.pages = pages;
	}

	public String getQueryequals_bjdm() {
		return queryequals_bjdm;
	}

	public void setQueryequals_bjdm(String queryequals_bjdm) {
		this.queryequals_bjdm = queryequals_bjdm;
	}

	public String getQueryequals_csrq() {
		return queryequals_csrq;
	}

	public void setQueryequals_csrq(String queryequals_csrq) {
		this.queryequals_csrq = queryequals_csrq;
	}

	public String getQueryequals_cym() {
		return queryequals_cym;
	}

	public void setQueryequals_cym(String queryequals_cym) {
		this.queryequals_cym = queryequals_cym;
	}

	public String getQueryequals_dwbh() {
		return queryequals_dwbh;
	}

	public void setQueryequals_dwbh(String queryequals_dwbh) {
		this.queryequals_dwbh = queryequals_dwbh;
	}

	public String getQueryequals_xb() {
		return queryequals_xb;
	}

	public void setQueryequals_xb(String queryequals_xb) {
		this.queryequals_xb = queryequals_xb;
	}

	public String getQuerylike_grbh() {
		return querylike_grbh;
	}

	public void setQuerylike_grbh(String querylike_grbh) {
		this.querylike_grbh = querylike_grbh;
	}

	public String getQuerylike_sfzh() {
		return querylike_sfzh;
	}

	public void setQuerylike_sfzh(String querylike_sfzh) {
		this.querylike_sfzh = querylike_sfzh;
	}

	public String getQuerylike_tzlsh() {
		return querylike_tzlsh;
	}

	public void setQuerylike_tzlsh(String querylike_tzlsh) {
		this.querylike_tzlsh = querylike_tzlsh;
	}

	public String getQuerylike_xm() {
		return querylike_xm;
	}

	public void setQuerylike_xm(String querylike_xm) {
		this.querylike_xm = querylike_xm;
	}

	public String getSfzh() {
		return sfzh;
	}

	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}

	public String getTzlsh() {
		return tzlsh;
	}

	public void setTzlsh(String tzlsh) {
		this.tzlsh = tzlsh;
	}

	public String getXb() {
		return xb;
	}

	public void setXb(String xb) {
		this.xb = xb;
	}

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getQueryequals_bz() {
		return queryequals_bz;
	}

	public void setQueryequals_bz(String queryequals_bz) {
		this.queryequals_bz = queryequals_bz;
	}

	public String getQuerylike_xh() {
		return querylike_xh;
	}

	public void setQuerylike_xh(String querylike_xh) {
		this.querylike_xh = querylike_xh;
	}

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
	}

	public String getSave_bz() {
		return save_bz;
	}

	public void setSave_bz(String save_bz) {
		this.save_bz = save_bz;
	}

	public String getSave_sbsj() {
		return save_sbsj;
	}

	public void setSave_sbsj(String save_sbsj) {
		this.save_sbsj = save_sbsj;
	}

	public String getSave_tzlsh() {
		return save_tzlsh;
	}

	public void setSave_tzlsh(String save_tzlsh) {
		this.save_tzlsh = save_tzlsh;
	}

	public String getSave_xh() {
		return save_xh;
	}

	public void setSave_xh(String save_xh) {
		this.save_xh = save_xh;
	}

	public String getBxsj() {
		return bxsj;
	}

	public void setBxsj(String bxsj) {
		this.bxsj = bxsj;
	}

	public String getSave_bxsj() {
		return save_bxsj;
	}

	public void setSave_bxsj(String save_bxsj) {
		this.save_bxsj = save_bxsj;
	}

	public String getJssj() {
		return jssj;
	}

	public void setJssj(String jssj) {
		this.jssj = jssj;
	}

	public String getKssj() {
		return kssj;
	}

	public void setKssj(String kssj) {
		this.kssj = kssj;
	}

	public String getXydm() {
		return xydm;
	}

	public void setXydm(String xydm) {
		this.xydm = xydm;
	}

	public String getQueryequals_xydm() {
		return queryequals_xydm;
	}

	public void setQueryequals_xydm(String queryequals_xydm) {
		this.queryequals_xydm = queryequals_xydm;
	}

	public String getQueryequals_zydm() {
		return queryequals_zydm;
	}

	public void setQueryequals_zydm(String queryequals_zydm) {
		this.queryequals_zydm = queryequals_zydm;
	}

	public String getQueryequals_nj() {
		return queryequals_nj;
	}

	public void setQueryequals_nj(String queryequals_nj) {
		this.queryequals_nj = queryequals_nj;
	}
}