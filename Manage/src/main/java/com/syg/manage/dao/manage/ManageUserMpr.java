package com.syg.manage.dao.manage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.syg.common.pagination.Pagination;
import com.syg.manage.model.manage.ManageUser;


public interface ManageUserMpr {
	public void saveItem(ManageUser item);
	public ManageUser queryByMuId(Integer muId);
	public ManageUser queryByUserName(String userName);
	
	public List<ManageUser> queryListPageSearch(Pagination page,@Param("example")ManageUser example);
	public List<ManageUser> queryAll();
	public int updateItem(ManageUser item);
	public int updateImg(ManageUser item);
	public int updateLastLogin(ManageUser item);
	public int deleteUser(@Param("example")ManageUser example);
	
}
