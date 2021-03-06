package com.zfsoft.xgxt.xszz.knsrdbjpy.knsjcszbjpy;

import org.apache.struts.action.ActionForm;

import xgxt.comm.search.SearchModel;
import xgxt.utils.Pages;

public class KnsjcszbjpyForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private String type;
	private Pages pages = new Pages();
	private SearchModel searchModel = new SearchModel();
	private String sqkg ;//申请开关
	private String sqkssj ;//申请开始时间
	private String sqjssj ;//申请结束时间
	private String splc ;//审批流程
	private String sfwcjtdc ;//是否完成家庭调查
	private String isopen ;//当前时间是否开启
	private String sqsftxdc;//申请时是否填写困难档次
	private String kxzrdzb;// 可选择认定指标（0： 无限制；1: 1个）
	
	// ========= 班级评议 < =============
	private String bjpyisopen ;//当前时间是否开启
	private String bjpykg; // 班级评议开关
	private String bjpykssj; // 班级评议开始时间
	private String bjpyjssj; // 班级评议结束时间
	private String xzrsxx; // 小组人数下限
	private String pyyxbl; // 评议有效比例
	private String xzrssfbxwjs; // 小组人数是否必须为奇数
	// ========= 班级评议 > =============
	
	//========================人数设置参数start===============//
	private String[] guids;// guid数组
	private String[] njs;// 年级数组
	private String[] xydms;//
	private String[] zydms;
	private String[] bjdms;
	private String[] zrss;
	private String[] zzrss;
	private String[] bls;
	
	private String rskznj;//人数控制年级
	private String rssfkz;//人数是否控制
	private String rskzjb;//人数控制级别
	private String rskzfw;//人数控制范围
	private String xn;//当前学年
	private String xq;//当前学期
	private String bl;//比例
	private String guid;
	private String bmdm;
	private String zzrs;
	private String nj;
	private String zme;//总名额
	//查询条件
	private String xydm;
	private String zydm;
	private String bjdm;
	private String njq;
	private String sfysz;//人数是否已设置
	//========================人数设置参数end=================//	
	 
	
	public String getSqkg() {
		return sqkg;
	}
	/**
	 * @return the guids
	 */
	public String[] getGuids() {
		return guids;
	}
	/**
	 * @param guids要设置的 guids
	 */
	public void setGuids(String[] guids) {
		this.guids = guids;
	}
	/**
	 * @return the njs
	 */
	public String[] getNjs() {
		return njs;
	}
	/**
	 * @param njs要设置的 njs
	 */
	public void setNjs(String[] njs) {
		this.njs = njs;
	}
	/**
	 * @return the xydms
	 */
	public String[] getXydms() {
		return xydms;
	}
	/**
	 * @param xydms要设置的 xydms
	 */
	public void setXydms(String[] xydms) {
		this.xydms = xydms;
	}
	/**
	 * @return the zydms
	 */
	public String[] getZydms() {
		return zydms;
	}
	/**
	 * @param zydms要设置的 zydms
	 */
	public void setZydms(String[] zydms) {
		this.zydms = zydms;
	}
	/**
	 * @return the bjdms
	 */
	public String[] getBjdms() {
		return bjdms;
	}
	/**
	 * @param bjdms要设置的 bjdms
	 */
	public void setBjdms(String[] bjdms) {
		this.bjdms = bjdms;
	}
	/**
	 * @return the zrss
	 */
	public String[] getZrss() {
		return zrss;
	}
	/**
	 * @param zrss要设置的 zrss
	 */
	public void setZrss(String[] zrss) {
		this.zrss = zrss;
	}
	/**
	 * @return the zzrss
	 */
	public String[] getZzrss() {
		return zzrss;
	}
	/**
	 * @param zzrss要设置的 zzrss
	 */
	public void setZzrss(String[] zzrss) {
		this.zzrss = zzrss;
	}
	/**
	 * @return the xydm
	 */
	public String getXydm() {
		return xydm;
	}
	/**
	 * @param xydm要设置的 xydm
	 */
	public void setXydm(String xydm) {
		this.xydm = xydm;
	}
	/**
	 * @return the zydm
	 */
	public String getZydm() {
		return zydm;
	}
	/**
	 * @param zydm要设置的 zydm
	 */
	public void setZydm(String zydm) {
		this.zydm = zydm;
	}
	/**
	 * @return the bjdm
	 */
	public String getBjdm() {
		return bjdm;
	}
	/**
	 * @param bjdm要设置的 bjdm
	 */
	public void setBjdm(String bjdm) {
		this.bjdm = bjdm;
	}
	/**
	 * @return the sfysz
	 */
	public String getSfysz() {
		return sfysz;
	}
	/**
	 * @param sfysz要设置的 sfysz
	 */
	public void setSfysz(String sfysz) {
		this.sfysz = sfysz;
	}
	/**
	 * @return the guid
	 */
	public String getGuid() {
		return guid;
	}
	/**
	 * @param guid要设置的 guid
	 */
	public void setGuid(String guid) {
		this.guid = guid;
	}
	/**
	 * @return the bmdm
	 */
	public String getBmdm() {
		return bmdm;
	}
	/**
	 * @param bmdm要设置的 bmdm
	 */
	public void setBmdm(String bmdm) {
		this.bmdm = bmdm;
	}
	/**
	 * @return the zzrs
	 */
	public String getZzrs() {
		return zzrs;
	}
	/**
	 * @param zzrs要设置的 zzrs
	 */
	public void setZzrs(String zzrs) {
		this.zzrs = zzrs;
	}
	/**
	 * @return the nj
	 */
	public String getNj() {
		return nj;
	}
	/**
	 * @param nj要设置的 nj
	 */
	public void setNj(String nj) {
		this.nj = nj;
	}
	public void setSqkg(String sqkg) {
		this.sqkg = sqkg;
	}
	public String getSqkssj() {
		return sqkssj;
	}
	public void setSqkssj(String sqkssj) {
		this.sqkssj = sqkssj;
	}
	public String getSqjssj() {
		return sqjssj;
	}
	public void setSqjssj(String sqjssj) {
		this.sqjssj = sqjssj;
	}
	public String getSplc() {
		return splc;
	}
	public void setSplc(String splc) {
		this.splc = splc;
	}
	public String getSfwcjtdc() {
		return sfwcjtdc;
	}
	public void setSfwcjtdc(String sfwcjtdc) {
		this.sfwcjtdc = sfwcjtdc;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Pages getPages() {
		return pages;
	}
	public void setPages(Pages pages) {
		this.pages = pages;
	}
	public SearchModel getSearchModel() {
		return searchModel;
	}
	public void setSearchModel(SearchModel searchModel) {
		this.searchModel = searchModel;
	}
	public String getIsopen() {
		return isopen;
	}
	public void setIsopen(String isopen) {
		this.isopen = isopen;
	}
	public void setSqsftxdc(String sqsftxdc) {
		this.sqsftxdc = sqsftxdc;
	}
	public String getSqsftxdc() {
		return sqsftxdc;
	}
	public String getKxzrdzb() {
		return kxzrdzb;
	}
	public void setKxzrdzb(String kxzrdzb) {
		this.kxzrdzb = kxzrdzb;
	}
	public String getBjpyisopen() {
		return bjpyisopen;
	}
	public void setBjpyisopen(String bjpyisopen) {
		this.bjpyisopen = bjpyisopen;
	}
	public String getBjpykg() {
		return bjpykg;
	}
	public void setBjpykg(String bjpykg) {
		this.bjpykg = bjpykg;
	}
	public String getBjpykssj() {
		return bjpykssj;
	}
	public void setBjpykssj(String bjpykssj) {
		this.bjpykssj = bjpykssj;
	}
	public String getBjpyjssj() {
		return bjpyjssj;
	}
	public void setBjpyjssj(String bjpyjssj) {
		this.bjpyjssj = bjpyjssj;
	}
	public String getXzrsxx() {
		return xzrsxx;
	}
	public void setXzrsxx(String xzrsxx) {
		this.xzrsxx = xzrsxx;
	}
	public String getPyyxbl() {
		return pyyxbl;
	}
	public void setPyyxbl(String pyyxbl) {
		this.pyyxbl = pyyxbl;
	}
	public String getXzrssfbxwjs() {
		return xzrssfbxwjs;
	}
	public void setXzrssfbxwjs(String xzrssfbxwjs) {
		this.xzrssfbxwjs = xzrssfbxwjs;
	}
	public void setRssfkz(String rssfkz) {
		this.rssfkz = rssfkz;
	}
	public String getRssfkz() {
		return rssfkz;
	}
	public void setRskzjb(String rskzjb) {
		this.rskzjb = rskzjb;
	}
	public String getRskzjb() {
		return rskzjb;
	}
	public void setRskzfw(String rskzfw) {
		this.rskzfw = rskzfw;
	}
	public String getRskzfw() {
		return rskzfw;
	}
	public void setXn(String xn) {
		this.xn = xn;
	}
	public String getXn() {
		return xn;
	}
	public void setXq(String xq) {
		this.xq = xq;
	}
	public String getXq() {
		return xq;
	}
	public void setBl(String bl) {
		this.bl = bl;
	}
	public String getBl() {
		return bl;
	}
	public void setRskznj(String rskznj) {
		this.rskznj = rskznj;
	}
	public String getRskznj() {
		return rskznj;
	}
	public void setZme(String zme) {
		this.zme = zme;
	}
	public String getZme() {
		return zme;
	}
	public void setBls(String[] bls) {
		this.bls = bls;
	}
	public String[] getBls() {
		return bls;
	}
	public void setNjq(String njq) {
		this.njq = njq;
	}
	public String getNjq() {
		return njq;
	}
	
	


}
