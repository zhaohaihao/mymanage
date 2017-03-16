package com.syg.manage.dao.manage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.syg.common.pagination.Pagination;
import com.syg.manage.model.manage.ManageRole;


public interface ManageRoleMpr {
	public void saveItem(ManageRole item);
	public ManageRole queryByMrId(Integer mrId);
	public List<ManageRole> queryAll();
	public List<ManageRole> queryListPageSearch(Pagination page,@Param("example")ManageRole example);
	public ManageRole queryByRoleName(String roleName);
	public int updateItem(ManageRole example);
}
