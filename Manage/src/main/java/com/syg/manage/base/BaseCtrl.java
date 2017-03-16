package com.syg.manage.base;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import com.syg.common.ShDateEditer;
import com.syg.common.pagination.Pagination;
import com.syg.manage.exception.BaseException;
import com.syg.manage.exception.ParamException;

/**
 * 控制器基础类 <br>
 * 包含一些常用方法
 * @author hulinyun
 */
public class BaseCtrl{
	private final static Logger logger = LoggerFactory.getLogger(BaseCtrl.class);
	
	public final static String SUC="S";
	public final static String ERR="E";
	
	public final static String JSON_COM="json/common";
	public final static String JUMP_URL="jumpUrl";
	public final static String JUMP_PAGE_DEF="index.html";
	public final static String JUMP_VIEW="error/autoJump";
	
	/** 统一处理成功结果*/
	protected void handleSuc(ModelMap mm) {
		mm.put("code", SUC);
		mm.put("msg", "操作成功");
	}
	
	
	protected void handleError(ModelMap mm,String msg) {
		mm.put("code", ERR);
		mm.put("msg", msg);
	}
	
	
	/** 统一处理失败结果*/
	protected void handleErr(ModelMap mm,Exception ex) {
		if (ex!=null && mm!=null) {
			if (ex instanceof BaseException) {
				mm.put("code", ((BaseException) ex).getCode());
				mm.put("msg", ((BaseException) ex).getMsg());
				//logger.error(ex.getMessage(), ex);
			}else if (ex instanceof ParamException) {
				mm.put("code", ((ParamException) ex).getCode());
				mm.put("msg", ((ParamException) ex).getMsg());
				//logger.error(ex.getMessage(), ex);
			}else{
				mm.put("code", ERR);
				mm.put("msg", "网络异常，请稍后再试");
				logger.error(ex.getMessage(), ex);
			}
		}
	}
	
//	/** 获取SESSION中的UserId */
//	protected int getUserId(HttpSession ses) {
//		//return SessionHelper.getSimUser(ses).getUserInfo().getUserId();
//	}
	
	
	/**
	 * 获取request中的String型数据  <br>
	 * 优先使用getAttribute方式,再使用getParameter方式 <br>
	 * @return 如果不存在则返回null
	 */
	protected String reqStr(String paramKey,HttpServletRequest request) {
		String val = (String)request.getAttribute(paramKey);
		if (val==null) {
			val=(String)request.getParameter(paramKey);
		}
		if (val==null) {
			return "";
		}
		return val;
	}
	
	
	/**
	 * 获取request中的String型数据  <br>
	 * 优先使用getAttribute方式,再使用getParameter方式<br>
	 * @return 如果不存在返回"",不返回null
	 */
	protected String reqStrDef(String paramKey,HttpServletRequest request) {
		String res = reqStr(paramKey, request);
		if (res==null) {
			return "";
		}
		return res;
	}
	
	/**
	 * 获取request中的Integer型数据  <br>
	 * 优先使用getAttribute方式,再使用getParameter方式<br>
	 * @return 如果不存在会抛出异常
	 */
	protected int reqInt(String paramKey,HttpServletRequest request) {
		int val = 0;
		String valStr = reqStr(paramKey,request);
		val = Integer.valueOf(valStr);
		return val;
	}
	
	/**
	 * 获取request中的Integer型数据  <br>
	 * 优先使用getAttribute方式,再使用getParameter方式<br>
	 * @return 如果不存在则返回0
	 */
	protected int reqIntDef(String paramKey,HttpServletRequest request) {
		try {
			return reqInt(paramKey, request);
		} catch (Exception e) {
			return 0;
		}
	}
	
	/**
	 * 获取request中的Boolean型数据  <br>
	 * 优先使用getAttribute方式,再使用getParameter方式<br>
	 * @return 如果不存在则返回false
	 */
	protected boolean reqBool(String paramKey,HttpServletRequest request) {
		String valStr = reqStrDef(paramKey,request);
		if (valStr.trim().toLowerCase().equals("on")||valStr.trim().toLowerCase().equals("yes")||valStr.trim().toLowerCase().equals("true")) {
			return true;
		}
		return false;
	}
	
	/**
	 * 生成分页对象,并直接放入ModelMap中,key为"page"
	 * @param maxItem 每页最大显示值
	 */
	protected Pagination pageList(int maxItem,HttpServletRequest req,ModelMap mm){
		Pagination page = new Pagination();
		
		int currentPage = reqIntDef("currentPage", req);
		int seqType=reqIntDef("seqType", req);
		String seqName=reqStrDef("seqName", req);
		page.setCurrentPage(currentPage);
		page.setSeqType(seqType);
		page.setSeqName(seqName);
		page.setShowCount(maxItem);
		page.getItems().clear();
		mm.put("page", page);
		return page;
	}
	
	/**
	 * 生成分页对象,并直接放入ModelMap中,key为"page"
	 * @param maxItem 每页最大显示值
	 */
	protected Pagination pageList(HttpServletRequest req,ModelMap mm){
		return pageList(60, req, mm);
	}
	
	/**
	 * 页面先提示消息,再n秒后自动跳转
	 * @param page 自动跳转的页面
	 */
	protected String jumpPage(String page,ModelMap mm) {
		mm.put(JUMP_URL, page);
		return JUMP_VIEW;
	}
	/**
	 * 页面先提示消息,再n秒后自动跳转默认页面
	 */
	protected String jumpPage(ModelMap mm) {
		return jumpPage(JUMP_PAGE_DEF, mm);
	}
	
	
//	protected void initShDates(Object obj) throws Exception{
////		Class c = obj.getClass();
////		Field[] fields=c.getDeclaredFields();
////		for (int i = 0; i < fields.length; i++) {
////			if (fields[i].getType().equals(ShDate.class)) {
////				Object value = ReflectHelper.getValueByFieldName(obj, fields[i].getName());
////				if (value==null) {
////					ReflectHelper.setValueByFieldName(obj, fields[i].getName(), new ShDate());
////				}
//////			}else if (fields[i].getType().equals(Date.class)) {
//////					Object value = ReflectHelper.getValueByFieldName(obj, fields[i].getName());
//////					if (value!=null && !(value instanceof ShDate)) {
//////						ReflectHelper.setValueByFieldName(obj, fields[i].getName(), new ShDate((Date)value));
//////					}else if (value==null) {
//////						ReflectHelper.setValueByFieldName(obj, fields[i].getName(), new ShDate());
//////					}
////			}else if (fields[i].getType().equals(Integer.class)) {
////				Object value = ReflectHelper.getValueByFieldName(obj, fields[i].getName());
////				if (value==null) {
////					ReflectHelper.setValueByFieldName(obj, fields[i].getName(), new Integer(0));
////				}
////			}
////		}
//	}
	
    @InitBinder
    protected void initBinder(WebDataBinder binder) throws ServletException {
        binder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
        
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new ShDateEditer(dateFormat,dateFormat2, false));
        
        
        
    }
}
