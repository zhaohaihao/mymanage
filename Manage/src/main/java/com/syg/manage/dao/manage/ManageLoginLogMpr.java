package com.syg.manage.dao.manage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.syg.common.pagination.Pagination;
import com.syg.manage.model.manage.ManageLoginLog;


public interface ManageLoginLogMpr {
	public void saveItem(ManageLoginLog example);
	public List<ManageLoginLog> queryListPageSearch(Pagination page,@Param("example")ManageLoginLog example);
}
