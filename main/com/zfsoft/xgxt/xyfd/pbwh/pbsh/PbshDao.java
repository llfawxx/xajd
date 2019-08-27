package com.zfsoft.xgxt.xyfd.pbwh.pbsh;

import com.zfsoft.xgxt.base.dao.impl.SuperDAOImpl;
import xgxt.comm.search.SearchService;
import xgxt.form.User;

import java.util.HashMap;
import java.util.List;

/**
 * ��־Ը�����
 * Created by llf on 2019/7/31.
 */
public class PbshDao extends SuperDAOImpl<PbshForm>{
    @Override
    protected void setTableInfo() {
        super.setClass(PbshForm.class);
        super.setKey("sqid");
        super.setTableName("xg_xyfd_pbsqb");
    }

    @Override
    public List<HashMap<String, String>> getPageList(PbshForm pbshForm) throws Exception {
        return null;
    }

    @Override
    public List<HashMap<String, String>> getPageList(PbshForm t, User user) throws Exception {
        String searchTj = SearchService.getSearchTj(t.getSearchModel());
        String[] inputV = SearchService.getTjInput(t.getSearchModel());
        String searchTjByUser = SearchService.getSearchTjByUser(user, "t", "xydm", "bjdm");
        StringBuffer sql = new StringBuffer();
        sql.append("select t.* from (");
        sql.append("select t1.*,t3.fdsmc,t3.fdsdd,t2.xm,t2.xydm,t2.xymc,t2.zydm,t2.zymc,t2.bjdm,t2.bjmc,");
        sql.append("t2.nj,t2.xb,t2.zybj,t2.zybjmc,t2.mz,t2.mzdm,t2.zzmm,t2.zzmmmc,t2.sydm1 sydm,t2.symc1 symc, ");
        sql.append("t4.guid shid,t4.gwid,t4.shr,t4.shyj,t6.mc || '[' ||");
        sql.append("decode(t4.shzt, '0', 'δ���', '1', 'ͨ��', '2', '��ͨ��', '3',  '�˻�', '4', '������', '5', '�����') || ']' shztmc,t6.gwz, ");
        sql.append(" row_number() over(partition by t1.sqid order by t4.shsj desc) rn ");
        sql.append("from xg_xyfd_pbsqb t1 left join view_xsjbxx t2 on t1.xh = t2.xh ");
        sql.append(" left join xg_xyfd_fdsxxb t3 on t1.fds = t3.id ");
        sql.append(" left join xg_xtwh_shztb t4 on t1.sqid = t4.ywid");
        sql.append(" left join xg_xtwh_spgwyh t5 on  t4.gwid = t5.spgw left join xg_xtwh_spgw t6 on t4.gwid = t6.id ");
        sql.append(" where t5.spyh ='"+ user.getUserName() + "' ");
        String shlx = t.getShzt();
        if (!shlx.equals("dsh")) {
            sql.append(" and (t4.shzt<>0 and  t4.shzt<>4)");
        } else {
            sql.append(" and (t4.shzt=0  or t4.shzt = 4 )");
        }
        sql.append(" ) t where 1=1 ");
        sql.append(" and  rn = 1 ");
        sql.append(searchTj);
        sql.append(searchTjByUser);
        return getPageList(t, sql.toString(), inputV);
    }
}