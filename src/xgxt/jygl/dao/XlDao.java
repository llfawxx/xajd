package xgxt.jygl.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import xgxt.DAO.DAO;
import xgxt.jygl.form.Dmk;

public class XlDao {
	public ArrayList getList(String dm,String mc) throws Exception {
		DAO dao = DAO.getInstance();
		StringBuffer sb = new StringBuffer();
		
		sb.append("select * from dmk_Xl where 1=1 ");
		
		if(!"".equals(dm) && dm != null){
			sb.append("and xldm like '"+dm+"%' ");
		}
		if(!"".equals(mc) && mc != null){
			sb.append("and xl like '%"+mc+"%'");
		}
		ResultSet rs = dao.getRS(sb.toString());
		ArrayList<Dmk> l = new ArrayList<Dmk>();
		while (rs.next()) {
			Dmk dmk = new Dmk();

			dmk.setDmkdm(rs.getString(1));
			dmk.setDmkmc(rs.getString(2));
			l.add(dmk);
		}
		dao.closeFromResultSet(rs);
		return l;
	}
	
	public ArrayList getListJ(String dm,String mc) throws Exception {
		DAO dao = DAO.getInstance();
		StringBuffer sb = new StringBuffer();
		
		sb.append("select * from dmk_Xl where 1=1 ");
		
		if(!"".equals(dm) && dm != null){
			sb.append("and xldm = '"+dm+"' ");
		}
		if(!"".equals(mc) && mc != null){
			sb.append("and xl = '"+mc+"'");
		}
		ResultSet rs = dao.getRS(sb.toString());
		ArrayList<Dmk> l = new ArrayList<Dmk>();
		while (rs.next()) {
			Dmk dmk = new Dmk();
			dmk.setDmkdm(rs.getString(1));
			dmk.setDmkmc(rs.getString(2));
			l.add(dmk);
		}
		dao.closeFromResultSet(rs);
		return l;
	}
}
