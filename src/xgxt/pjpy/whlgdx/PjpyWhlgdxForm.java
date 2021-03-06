/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package xgxt.pjpy.whlgdx;

import org.apache.struts.action.ActionForm;

/**
 * <p>Title: 学生工作管理系统</p>
 * <p>Description: 武汉理工大学评奖评优Form
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: zfsoft</p>
 * <p>Author: 李容</p>
 * <p>Version: 1.0</p>
 * <p>Time: 2008-08-01</p>
 */
@SuppressWarnings("serial")
public class PjpyWhlgdxForm extends ActionForm {
	private String[] cbv;
	private String xn;//学年
	private String nd;//年度
	private String xq;//学期
	private String xh;//学号
	private String xm;//姓名
	private String xb;//性别
	private String nj;//年级
	private String xydm;//学院代码
	private String xymc;//学院名称
	private String zydm;//专业代码
	private String zymc;//专业名称
	private String bjdm;//班级代码
	private String bjmc;//班级名称
	private String dcj;//德成绩
	private String xxpjcj;//学习平均成绩
	private String xxpjcjpm;//学习平均层次排名
	private String xxpjcjpmbl;//学习平均成绩排名比例
	private String sztzzf;//素质拓展总分
	private String zhszcpcjpm;//综合素质测评成绩排名
	private String zhszcpcjpmbl;//综合素质测评成绩排名比例
	private String dkzdfs;//单科最低分数
	private String wygjqk;//外语过级情况
	private String zhszcpzf;//综合素质测评总分
	private String stszzf;//身体素质总分
	private String bz;//备注 
	private String xjbjlbdm;//先进班级类别
	private String xjbjlbmc;//先进班级类别名称
	private String bj;
	private String jxjdm;//奖学金代码
	private String zdm;//字段名   
	private String jxjfl;//奖学金分类
	private String xmdm;//项目代码
	private String[] cztj;//操作条件
	private String zdz;//字段值
	private String sfpks;//是否贫困生
	private String sqly;//申请理由
	private String lwmc;//论文名称
	private String qkmc;//期刊名称
	private String fbsj;//发布时间
	private String sfdyzz;//是否第一作者
	private String gkfs;//高考分数
	private String gzashjqk;//高中奥赛获奖情况
	private String sqdj;//申报等级
	private String sfdlsq;//是否单列申请
	private String dlsqly;//单列申请理由
	private String rychdm;//荣誉称号代码
	
	public String getDlsqly() {
		return dlsqly;
	}
	public void setDlsqly(String dlsqly) {
		this.dlsqly = dlsqly;
	}
	public String getRychdm() {
		return rychdm;
	}
	public void setRychdm(String rychdm) {
		this.rychdm = rychdm;
	}
	public String getSfdlsq() {
		return sfdlsq;
	}
	public void setSfdlsq(String sfdlsq) {
		this.sfdlsq = sfdlsq;
	}
	public String getSqly() {
		return sqly;
	}
	public void setSqly(String sqly) {
		this.sqly = sqly;
	}
	public String getSfpks() {
		return sfpks;
	}
	public void setSfpks(String sfpks) {
		this.sfpks = sfpks;
	}
	public String getZdz() {
		return zdz;
	}
	public void setZdz(String zdz) {
		this.zdz = zdz;
	}
	public String getXmdm() {
		return xmdm;
	}
	public void setXmdm(String xmdm) {
		this.xmdm = xmdm;
	}
	public String getJxjfl() {
		return jxjfl;
	}
	public void setJxjfl(String jxjfl) {
		this.jxjfl = jxjfl;
	}
	public String getZdm() {
		return zdm;
	}
	public void setZdm(String zdm) {
		this.zdm = zdm;
	}
	public String getJxjdm() {
		return jxjdm;
	}
	public void setJxjdm(String jxjdm) {
		this.jxjdm = jxjdm;
	}
	public String getBj() {
		return bj;
	}
	public void setBj(String bj) {
		this.bj = bj;
	}
	public String getXjbjlbdm() {
		return xjbjlbdm;
	}
	public void setXjbjlbdm(String xjbjlbdm) {
		this.xjbjlbdm = xjbjlbdm;
	}
	public String getXjbjlbmc() {
		return xjbjlbmc;
	}
	public void setXjbjlbmc(String xjbjlbmc) {
		this.xjbjlbmc = xjbjlbmc;
	}
	public String getBjdm() {
		return bjdm;
	}
	public void setBjdm(String bjdm) {
		this.bjdm = bjdm;
	}
	public String getBjmc() {
		return bjmc;
	}
	public void setBjmc(String bjmc) {
		this.bjmc = bjmc;
	}
	public String getDcj() {
		return dcj;
	}
	public void setDcj(String dcj) {
		this.dcj = dcj;
	}
	public String getDkzdfs() {
		return dkzdfs;
	}
	public void setDkzdfs(String dkzdfs) {
		this.dkzdfs = dkzdfs;
	}
	public String getNd() {
		return nd;
	}
	public void setNd(String nd) {
		this.nd = nd;
	}
	public String getNj() {
		return nj;
	}
	public void setNj(String nj) {
		this.nj = nj;
	}
	public String getSztzzf() {
		return sztzzf;
	}
	public void setSztzzf(String sztzzf) {
		this.sztzzf = sztzzf;
	}
	public String getWygjqk() {
		return wygjqk;
	}
	public void setWygjqk(String wygjqk) {
		this.wygjqk = wygjqk;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getXh() {
		return xh;
	}
	public void setXh(String xh) {
		this.xh = xh;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getXn() {
		return xn;
	}
	public void setXn(String xn) {
		this.xn = xn;
	}
	public String getXq() {
		return xq;
	}
	public void setXq(String xq) {
		this.xq = xq;
	}
	public String getXxpjcj() {
		return xxpjcj;
	}
	public void setXxpjcj(String xxpjcj) {
		this.xxpjcj = xxpjcj;
	}
	public String getXxpjcjpm() {
		return xxpjcjpm;
	}
	public void setXxpjcjpm(String xxpjcjpm) {
		this.xxpjcjpm = xxpjcjpm;
	}
	public String getXxpjcjpmbl() {
		return xxpjcjpmbl;
	}
	public void setXxpjcjpmbl(String xxpjcjpmbl) {
		this.xxpjcjpmbl = xxpjcjpmbl;
	}
	public String getXydm() {
		return xydm;
	}
	public void setXydm(String xydm) {
		this.xydm = xydm;
	}
	public String getXymc() {
		return xymc;
	}
	public void setXymc(String xymc) {
		this.xymc = xymc;
	}
	public String getZhszcpcjpm() {
		return zhszcpcjpm;
	}
	public void setZhszcpcjpm(String zhszcpcjpm) {
		this.zhszcpcjpm = zhszcpcjpm;
	}
	public String getZhszcpcjpmbl() {
		return zhszcpcjpmbl;
	}
	public void setZhszcpcjpmbl(String zhszcpcjpmbl) {
		this.zhszcpcjpmbl = zhszcpcjpmbl;
	}
	public String getZydm() {
		return zydm;
	}
	public void setZydm(String zydm) {
		this.zydm = zydm;
	}
	public String getZymc() {
		return zymc;
	}
	public void setZymc(String zymc) {
		this.zymc = zymc;
	}	
	public String getStszzf() {
		return stszzf;
	}
	public void setStszzf(String stszzf) {
		this.stszzf = stszzf;
	}
	public String getZhszcpzf() {
		return zhszcpzf;
	}
	public void setZhszcpzf(String zhszcpzf) {
		this.zhszcpzf = zhszcpzf;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String[] getCbv() {
		return cbv;
	}
	public void setCbv(String[] cbv) {
		this.cbv = cbv;
	}
	public String[] getCztj() {
		return cztj;
	}
	public void setCztj(String[] cztj) {
		this.cztj = cztj;
	}
	public String getFbsj() {
		return fbsj;
	}
	public void setFbsj(String fbsj) {
		this.fbsj = fbsj;
	}
	public String getGzashjqk() {
		return gzashjqk;
	}
	public void setGzashjqk(String gzashjqk) {
		this.gzashjqk = gzashjqk;
	}
	public String getLwmc() {
		return lwmc;
	}
	public void setLwmc(String lwmc) {
		this.lwmc = lwmc;
	}
	public String getQkmc() {
		return qkmc;
	}
	public void setQkmc(String qkmc) {
		this.qkmc = qkmc;
	}
	public String getSfdyzz() {
		return sfdyzz;
	}
	public void setSfdyzz(String sfdyzz) {
		this.sfdyzz = sfdyzz;
	}
	public String getSqdj() {
		return sqdj;
	}
	public void setSqdj(String sqdj) {
		this.sqdj = sqdj;
	}
	public String getGkfs() {
		return gkfs;
	}
	public void setGkfs(String gkfs) {
		this.gkfs = gkfs;
	}
}