package com.syg.manage.cfg;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public enum Per {
	NULL("无权限","0","",null),  
	ROOT("电玩城后台",PerStr.ROOT_MP_VALUE,"",null),
	//================================系统管理开始==============================
	PER_SYS					("系统管理",		PerStr.PER_SYS,	"",		ROOT),
	
	/**用户管理*/
	PER_SYS_USER			("用户管理",		PerStr.PER_SYS+"01",		"",	PER_SYS),
	// 用户信息
	PER_SYS_USER_PAGE		("用户列表",		PerStr.PER_SYS+"01"+"01",	    "manage/userListPage",	PER_SYS_USER),
	PER_SYS_USER_ADD		("添加用户",		PerStr.PER_SYS+"01"+"01"+"01",	"",	PER_SYS_USER_PAGE),
	PER_SYS_USER_EDIT		("修改用户信息",	PerStr.PER_SYS+"01"+"01"+"02",	"",	PER_SYS_USER_PAGE),
	PER_SYS_USER_DELET		("删除用户",	PerStr.PER_SYS+"01"+"01"+"03",	"",	PER_SYS_USER_PAGE),
	// 角色信息
	PER_SYS_ROLE_PAGE		("角色列表",		PerStr.PER_SYS+"01"+"02",	"manage/roleListPage",	PER_SYS_USER),
	PER_SYS_ROLE_ADD		("添加角色",		PerStr.PER_SYS+"01"+"02"+"01",	"",	PER_SYS_ROLE_PAGE),
	PER_SYS_ROLE_EDIT		("修改角色",		PerStr.PER_SYS+"01"+"02"+"02",	"",	PER_SYS_ROLE_PAGE),
	// 权限管理
	PER_SYS_PER_PAGE		("权限列表",		PerStr.PER_SYS+"01"+"03",	"manage/perListPage",	PER_SYS_USER),
	PER_SYS_PER_ADD			("添加权限",		PerStr.PER_SYS+"01"+"03"+"01",	"",	PER_SYS_PER_PAGE),
	PER_SYS_PER_EDIT		("修改权限",		PerStr.PER_SYS+"01"+"03"+"02",	"",	PER_SYS_PER_PAGE),
	
	/**日志记录*/
	PER_SYS_LOG				("日志记录",		PerStr.PER_SYS+"03",		"",	PER_SYS),
	// 登录日志
	PER_SYS_LOGINLOG_PAGE	("登录日志",		PerStr.PER_SYS+"03"+"01",	"manage/loginLogListPage",	PER_SYS_LOG),
	// 操作日志
	PER_SYS_OPERATELOG_PAGE	("操作记录",		PerStr.PER_SYS+"03"+"02",	"manage/operateLogListPage",	PER_SYS_LOG),
	//================================系统管理结束==============================
	;
    private String code;
    private String name;
    private String pageUrl;
    private Per father;

    /**
     * 构造函数
     * @param name	权限名称
     * @param code	权限值
     * @param pageUrl 页面地址
     * @param father 父节点
     */
    private Per(String name,String code,String pageUrl,Per father) {
        this.name = name;
        this.code = code;
        this.pageUrl = pageUrl;
        this.father= father;
    }
    
    public String getCode() {
		return code;
	}
    public String getName() {
		return name;
	}
    public String getPageUrl() {
		return pageUrl;
	}
    public Per getFather() {
		return father;
	}
    
    public static void main(String[] args) {
    	//设置角色编号
    	int roleId=1;
    	
    	System.out.println("DELETE FROM manage_per;");
    	System.out.println("DELETE FROM manage_role_per;");
		
        Class<?> class1 = Per.class;
        Field[] fields = class1.getFields();
        for (int i = 0; i < fields.length; i++) {
        	if (Per.values()[i].getCode().equals("0")) {
				continue;
			}
        	System.out.println("INSERT INTO `manage_per` VALUES ('"+Per.values()[i].getName()+"', '"
        			+Per.values()[i].getCode()+"', '"
        			+(Per.values()[i].getFather()==null?"1":Per.values()[i].getFather().getCode())+"', '"
        			+Per.values()[i].getPageUrl()+"', '');");
		}
        
        for (int i = 0; i < fields.length; i++) {
        	if (Per.values()[i].getCode().equals("0")) {
				continue;
			}
			System.out.println("INSERT INTO `manage_role_per` VALUES ('"+i+"', '"+roleId+"', '"+Per.values()[i].getCode()+"');");
		}
	}
    
    public static List<Per> getAllPer(){
    	Class<?> class1 = Per.class;
        Field[] fields = class1.getFields();
        List<Per> perList = new ArrayList<>();
        for (int i = 0; i < fields.length; i++) {
        	if (Per.values()[i].getCode().equals("0")) {
				continue;
			}
        	perList.add(Per.values()[i]);
        }
        return perList;
    }
    
    private static Map<Integer, Per> perMap = new HashMap<Integer, Per>();
	static {
		Class<?> pidClass = Per.class;
		Field[] fields = pidClass.getFields();
		for (int i = 0; i < fields.length; i++) {
			Integer key = Integer.valueOf(Per.values()[i].getCode());
			if (perMap.containsKey(key)) {
				throw new RuntimeException("Exist Enum Per!!!!!");
			}
			perMap.put(key, Per.values()[i]);
		}
		
	}

	public static Per find(Integer code) {
		return perMap.get(code);
	}
    public static Map<Integer, Per> getPerMap(){
    	return perMap;
    }
}





