package com.syg.manage.ctrl;


import java.io.File;
import java.util.Date;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.mchange.v1.util.ArrayUtils;
import com.syg.common.RemoteFileUtil;
import com.syg.manage.base.BaseCtrl;
import com.syg.manage.exception.BaseException;
import com.syg.manage.util.SesHelper;

@Controller
@RequestMapping("file")
public class FileUploadCtrl extends BaseCtrl {

	private String msg;
	
	private String code;

	/** 部分视频拓展名（缺少请自行补充） **/
	public static final String[] flashExtentions = new String[]{"mpg", "mlv", "mpe", "mpeg", "dat", "m2v", "vob", "tp", "ts", "avi", "rm", "ra", "ram", "swf", "flv", "asf", "3gp", "wmv", "wmp", "rmvb", "rpm", "rt", "rp"};
	
	/** 部分图片拓展名（缺少请自行补充） **/
	public static final String[] imageExtentions = new String[]{"tiff", "psd", "eps", "raw", "pdf", "png", "pxr", "mac", "jpg", "bmp", "tga", "vst", "pcd", "pct", "gif", "ai", "fpx", "img", "cal", "wi", "png", "eps", "ai", "sct", "pdf", "pdp", "dxf"};

	public static Properties properties = new Properties();
	
	public static final String proFileName = "global.properties";
	
	public static String imgServerName;
	
	public static String imgServerFolder;
	
	static{
		try {
			Resource res = new ClassPathResource(proFileName);
			properties.load(res.getInputStream());
			RemoteFileUtil.init(properties.getProperty("imgServerIp"), properties.getProperty("imgServerPort"));
			imgServerName = properties.getProperty("imgServerName");
			imgServerFolder = properties.getProperty("imgServerFolder");
		} catch (Exception e) {

		}		
	}
	
	@RequestMapping(value="uploadFile.do",method={RequestMethod.GET,RequestMethod.POST})
	public String ajaxUpload(ModelMap mm,HttpSession ses,HttpServletRequest req
//			,@RequestParam("upload") MultipartFile upload
			) throws Exception {
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;     
			
//			MultipartResolver resolver = new CommonsMultipartResolver(req.getSession().getServletContext());
//			MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(req);
			// 获得文件：
	        MultipartFile upload = multipartRequest.getFile("upload");  
			String newFileName = new Date().getTime() + "_" + SesHelper.getSimUser(ses).getManageUser().getMuId()
					+ getExtention(upload.getOriginalFilename());
			//String path = req.getSession().getServletContext().getRealPath("upload");
			
			CommonsMultipartFile cf= (CommonsMultipartFile)upload;
	        DiskFileItem fi = (DiskFileItem)cf.getFileItem();
	        File targetFile = fi.getStoreLocation();
	        
			if(ArrayUtils.indexOf(imageExtentions, getExtention(upload.getOriginalFilename()).substring(1))!=-1){
				RemoteFileUtil.copyImage(targetFile, imgServerFolder+newFileName);
			}else{
				throw new BaseException("请确定是图片文件");
			}
			mm.put("newFileResult", newFileName);//用这个不管用，页面中根本取不到
			handleSuc(mm);
			mm.put("msg", imgServerName+newFileName);//只能用msg来存，不知在哪调
		} catch (Exception e) {
			handleErr(mm , e);
		}
		return JSON_COM;
	}
	
	
	/*@RequestMapping(value="uploadFileExcel.do",method={RequestMethod.GET,RequestMethod.POST})
	public String uploadFileExcel(ModelMap mm,HttpSession ses,HttpServletRequest req
//			,@RequestParam("upload") MultipartFile upload
			) throws Exception {
		FileInputStream f=null;
		FileOutputStream fw=null;
		try {
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;     
			// 获得文件：
	        MultipartFile upload = multipartRequest.getFile("upload");  
	        if(upload==null){
	        	handleError(mm, "upload_file_is_null");
	        	return JSON_COM;
	        }
	        String extName = getExtention(upload.getOriginalFilename());
			final String newFileName = "FishRateConfig"+ extName;//rename;
			System.out.println(extName);
			if(".xlsx".equals(extName)){				
				final String path = req.getSession().getServletContext().getRealPath(".");
				System.out.println(newFileName);
				System.out.println(path);				
				CommonsMultipartFile cf= (CommonsMultipartFile)upload;
				DiskFileItem fi = (DiskFileItem)cf.getFileItem();
				File targetFile = fi.getStoreLocation();
				System.out.println(targetFile.getName());				
				f = new FileInputStream(targetFile);
				byte[] data = new byte[f.available()];
				f.read(data);
				final String fileName =IConfigSvs.FishRateConfig;
						//path+"/WEB-INF/classes/"+newFileName;
				fw= new FileOutputStream(fileName);
				fw.write(data);
				fw.close();
				f.close();
				handleSuc(mm);
				mm.put("msg", newFileName);//只能用msg来存，不知在哪调
				//submit task;				
				TaskUtil.submitTask(new Runnable() {					
					@Override
					public void run() {
						try {
							configSvs.deleteFishIdNotEqZeroRecored();
							List list = ExcelUtil.readExcelFile(fileName, GameThreshold.class);
							configSvs.saveOrUpdateList(list);
							configSvs.loadFishTypeList(list);
							System.out.println("list.size="+list.size());
							list.clear();
							list=null;
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				});
				
			}else{
				handleError(mm, "不是.xlsx版本的excel文件");
			}
		} catch (Exception e) {
			handleErr(mm , e);
		}finally{
			if(fw!=null)
				fw.close();
			if(f!=null)
				f.close();
		}
		return JSON_COM;
	}
	
	@RequestMapping(value="uploadFruitResult.do",method={RequestMethod.GET,RequestMethod.POST})
	public String uploadFruitResult(ModelMap mm,HttpSession ses,HttpServletRequest req
			,@RequestParam("upload") MultipartFile upload) throws Exception {
		try {
	        if(upload==null){
	        	handleError(mm, "文件上传失败");
	        	return JSON_COM;
	        }
			String fileName = upload.getOriginalFilename();
			String uploadStr = new String(upload.getBytes());
			int serverId = reqInt("serverId", req);
			
			// 水果机文件
			if(serverId == 107 || serverId == 108 || serverId == 109 || serverId == 101){
				if("fruit1.csv".equals(fileName)){
					configSvs.updateResultList("FRUIT_RESULT_HIGH",uploadStr,serverId);
				}else if("fruit2.csv".equals(fileName)){
					configSvs.updateResultList("FRUIT_RESULT_LOW",uploadStr,serverId);
				}
			
			// 飞禽走兽文件
			}else if(serverId == 110 || serverId == 111 || serverId == 112){
				if("animal1.csv".equals(fileName)){
					configSvs.updateResultList("ANIMAL_RESULT_HIGH",uploadStr,serverId);
				}else if("animal2.csv".equals(fileName)){
					configSvs.updateResultList("ANIMAL_RESULT_LOW",uploadStr,serverId);
				}else if("animalWeight.csv".equals(fileName)){
					configSvs.updateResultList("ANIMAL_WEIGHT",uploadStr,serverId);
				}
			}else{
				throw new IllegalAccessException("文件名错误");
			}
			handleSuc(mm);
		}catch(com.microsoft.sqlserver.jdbc.SQLServerException e){
			handleError(mm, "文件过长");
		}catch (Exception e) {
			handleErr(mm , e);
		}
		return JSON_COM;
	}
	
	@RequestMapping(value="uploadSkillFish.do",method={RequestMethod.GET,RequestMethod.POST})
	public String uploadSkillFish(ModelMap mm,HttpSession ses,HttpServletRequest req
			,@RequestParam("upload") MultipartFile upload) throws Exception {
		try {
	        if(upload==null){
	        	handleError(mm, "文件上传失败");
	        	return JSON_COM;
	        }
			String fileName = upload.getOriginalFilename();
			String[] name = fileName.split("\\.");
			if(!"csv".equals(name[1])){
				handleError(mm, "请使用CSV格式文件");
	        	return JSON_COM;
			}
			String uploadStr = new String(upload.getBytes(),"UTF-8");
			configSvs.updateSkillFish(uploadStr);
			handleSuc(mm);
		}catch (Exception e) {
			handleErr(mm , e);
		}
		return JSON_COM;
	}*/

//	@RequestMapping(value="uploadFile.do",method={RequestMethod.GET,RequestMethod.POST})
//	public String ajaxUpload(ModelMap mm,HttpSession ses,HttpServletRequest req) throws Exception {
//		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;     
//        // 获得文件：     
//        MultipartFile upload = multipartRequest.getFile("upload"); 
//        
//		if (!upload.isEmpty()) {  
//            try {
//            	String newFileName = new Date().getTime() + "_" + SesHelper.getSimUser(ses).getManageUser().getMuId()
//    					+ getExtention(upload.getOriginalFilename());
//                // 文件保存路径  
//            	String filePath = req.getSession().getServletContext().getRealPath("/") + "upload/" + newFileName;  
//            	//String filePath = "D:/" + newFileName;
//            	//String filePath = "192.168.2.61:6666/"+ newFileName;
//            	//String filePath = "192.168.2.252:8080/" + req.getSession().getServletContext().getRealPath("/") + "upload/" + newFileName;
//            	//String filePath = "192.168.2.252:8080/" + "D:/" + newFileName;
//                // 转存文件  
//                if(ArrayUtils.indexOf(imageExtentions, getExtention(upload.getOriginalFilename()).substring(1))!=-1){
//                    upload.transferTo(new File(filePath));  
//    			}else{
//					throw new BaseException("请确定是图片文件");
//    			}
////                File targetFile = new File(filePath);
////                RemoteFileUtil.copyImage(targetFile, newFileName);
//              mm.put("newFileResult", newFileName);//用这个不管用，页面中根本取不到
//    			handleSuc(mm);
//    			mm.put("msg", newFileName);//只能用msg来存，不知在哪调
//            } catch (Exception e) {  
//            	handleErr(mm , e);
//            	mm.put("msg", e.getMessage());
//            }  
//        }
//		return JSON_COM;
//	}
	
	@RequestMapping(value="filePage",method={RequestMethod.GET,RequestMethod.POST})
	public String ajaxPerpareUpload(ModelMap mm,HttpSession ses,HttpServletRequest req) {
		try{	
			handleSuc(mm);
		} catch (Exception e) {  
	    	handleErr(mm , e);
	    } 
		return "common/upload";
	}
	
	@RequestMapping(value="testfilePage",method={RequestMethod.GET,RequestMethod.POST})
	public String ajaxPerpareUploadTest(ModelMap mm,HttpSession ses,HttpServletRequest req) {
		try{	
			handleSuc(mm);
		} catch (Exception e) {  
	    	handleErr(mm , e);
	    } 
		return "common/test";
	}

	/**
	 * 得到文件的扩展名
	 * 
	 * @param fileName
	 * @return
	 */
	private static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}

	

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
}
