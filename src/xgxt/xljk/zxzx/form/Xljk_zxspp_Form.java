/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package xgxt.xljk.zxzx.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 10-21-2010
 * 
 * XDoclet definition:
 * @struts.form name="xljk_zxspp_Form"
 */
public class Xljk_zxspp_Form extends ActionForm {
	/*
	 * Generated Methods
	 */
	private String zgh;//职工号
	private String xm;//姓名
	private String querylike_zgh;//职工号
	private String querylike_xm;//姓名
	private String queryequals_bmdm;//部门代码
	private String bmdm;//部门代码
	private String fdyxx;
	private String zxsxx;
	private String ppzxs;
	private String []ppzxsxx;
	private String zxxbh;
	private String zxxxm;
	public String getZxxbh() {
		return zxxbh;
	}
	public void setZxxbh(String zxxbh) {
		this.zxxbh = zxxbh;
	}
	public String getZxxxm() {
		return zxxxm;
	}
	public void setZxxxm(String zxxxm) {
		this.zxxxm = zxxxm;
	}
	public String getBmdm() {
		return bmdm;
	}
	public void setBmdm(String bmdm) {
		this.bmdm = bmdm;
	}
	public String getFdyxx() {
		return fdyxx;
	}
	public void setFdyxx(String fdyxx) {
		this.fdyxx = fdyxx;
	}
	public String getPpzxs() {
		return ppzxs;
	}
	public void setPpzxs(String ppzxs) {
		this.ppzxs = ppzxs;
	}
	public String[] getPpzxsxx() {
		return ppzxsxx;
	}
	public void setPpzxsxx(String[] ppzxsxx) {
		this.ppzxsxx = ppzxsxx;
	}
	public String getQueryequals_bmdm() {
		return queryequals_bmdm;
	}
	public void setQueryequals_bmdm(String queryequals_bmdm) {
		this.queryequals_bmdm = queryequals_bmdm;
	}
	public String getQuerylike_xm() {
		return querylike_xm;
	}
	public void setQuerylike_xm(String querylike_xm) {
		this.querylike_xm = querylike_xm;
	}
	public String getQuerylike_zgh() {
		return querylike_zgh;
	}
	public void setQuerylike_zgh(String querylike_zgh) {
		this.querylike_zgh = querylike_zgh;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getZgh() {
		return zgh;
	}
	public void setZgh(String zgh) {
		this.zgh = zgh;
	}
	public String getZxsxx() {
		return zxsxx;
	}
	public void setZxsxx(String zxsxx) {
		this.zxsxx = zxsxx;
	}
}