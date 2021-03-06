package xsgzgl.pjpy.szgyyq.model;

/**
 * <p>
 * Title: 学工管理系统
 * </p>
 * <p>
 * Description: 评奖评优_苏州工业园区_社会实践_Model类
 * </p>
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * <p>
 * Company: zfsoft
 * </p>
 * 
 * @author 伟大的骆
 * @version 1.0
 */

public class ShsjModel {

	private String id;// '主键';

	private String xh;// '学号';

	private String xn;// '学年';

	private String xq;// '学期';

	private String[] hdnr;// '活动内容';

	private String[] hddd;// '活动地点';

	private String[] hdsj;// '活动时间（小时）';

	private String[] hdrq;// '活动日期';

	private String[] shfz;// '所获分值';
	
	private String[] jjf;// '加减分';

	private String[] lrrq;// '录入日期';

	private String[] sqf;// '申请分';

	private String[] bzrshf;// '班主任审核分';

	private String[] bzrsh;// '班主任审核';

	private String[] bzrshsj;// '班主任审核时间';

	private String[] bzrshr;// '班主任审核人';

	private String[] xyshf;// '学院审核分';

	private String[] xysh;// '学院审核';

	private String[] xyshsj;// '学院审核时间';

	private String[] xyshr;// '学院审核人';

	private String[] xxshf;// '学校审核分';

	private String[] xxsh;// '学校审核';

	private String[] xxshsj;// '学校审核时间';

	private String[] xxshr;// '学校审核人';

	public String[] getBzrsh() {
		return bzrsh;
	}

	public void setBzrsh(String[] bzrsh) {
		this.bzrsh = bzrsh;
	}

	public String[] getBzrshf() {
		return bzrshf;
	}

	public void setBzrshf(String[] bzrshf) {
		this.bzrshf = bzrshf;
	}

	public String[] getBzrshr() {
		return bzrshr;
	}

	public void setBzrshr(String[] bzrshr) {
		this.bzrshr = bzrshr;
	}

	public String[] getBzrshsj() {
		return bzrshsj;
	}

	public void setBzrshsj(String[] bzrshsj) {
		this.bzrshsj = bzrshsj;
	}

	public String[] getHddd() {
		return hddd;
	}

	public void setHddd(String[] hddd) {
		this.hddd = hddd;
	}

	public String[] getHdnr() {
		return hdnr;
	}

	public void setHdnr(String[] hdnr) {
		this.hdnr = hdnr;
	}

	public String[] getHdrq() {
		return hdrq;
	}

	public void setHdrq(String[] hdrq) {
		this.hdrq = hdrq;
	}

	public String[] getHdsj() {
		return hdsj;
	}

	public void setHdsj(String[] hdsj) {
		this.hdsj = hdsj;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String[] getJjf() {
		return jjf;
	}

	public void setJjf(String[] jjf) {
		this.jjf = jjf;
	}

	public String[] getLrrq() {
		return lrrq;
	}

	public void setLrrq(String[] lrrq) {
		this.lrrq = lrrq;
	}

	public String[] getShfz() {
		return shfz;
	}

	public void setShfz(String[] shfz) {
		this.shfz = shfz;
	}

	public String[] getSqf() {
		return sqf;
	}

	public void setSqf(String[] sqf) {
		this.sqf = sqf;
	}

	public String getXh() {
		return xh;
	}

	public void setXh(String xh) {
		this.xh = xh;
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

	public String[] getXxsh() {
		return xxsh;
	}

	public void setXxsh(String[] xxsh) {
		this.xxsh = xxsh;
	}

	public String[] getXxshf() {
		return xxshf;
	}

	public void setXxshf(String[] xxshf) {
		this.xxshf = xxshf;
	}

	public String[] getXxshr() {
		return xxshr;
	}

	public void setXxshr(String[] xxshr) {
		this.xxshr = xxshr;
	}

	public String[] getXxshsj() {
		return xxshsj;
	}

	public void setXxshsj(String[] xxshsj) {
		this.xxshsj = xxshsj;
	}

	public String[] getXysh() {
		return xysh;
	}

	public void setXysh(String[] xysh) {
		this.xysh = xysh;
	}

	public String[] getXyshf() {
		return xyshf;
	}

	public void setXyshf(String[] xyshf) {
		this.xyshf = xyshf;
	}

	public String[] getXyshr() {
		return xyshr;
	}

	public void setXyshr(String[] xyshr) {
		this.xyshr = xyshr;
	}

	public String[] getXyshsj() {
		return xyshsj;
	}

	public void setXyshsj(String[] xyshsj) {
		this.xyshsj = xyshsj;
	}
	
}
