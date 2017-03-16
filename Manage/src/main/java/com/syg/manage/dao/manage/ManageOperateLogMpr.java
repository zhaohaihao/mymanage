package com.syg.manage.dao.manage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.syg.common.pagination.Pagination;
import com.syg.manage.model.manage.ManageOperateLog;


public interface ManageOperateLogMpr {
	public void saveItem(ManageOperateLog item);
	public List<ManageOperateLog> queryListPageSearch(Pagination page,@Param("example")ManageOperateLog example);
}
