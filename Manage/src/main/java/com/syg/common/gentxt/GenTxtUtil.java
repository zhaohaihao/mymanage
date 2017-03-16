package com.syg.common.gentxt;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.util.HashMap;
import java.util.Map;

import com.syg.common.FileUtil;

import freemarker.cache.FileTemplateLoader;
import freemarker.ext.beans.BeansWrapper;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateModel;

/**
 * 模板生成文件辅助工具
 * @author meehu
 */
public class GenTxtUtil {
	
	
	/**项目根目录绝对路径*/
	private static String ROOT_PATH = "";
    
    static{
    	ROOT_PATH = System.getProperty("webapp.root");
    	System.out.println(ROOT_PATH);
    }
    private static Map<String, TemplateModel> tmMap=new HashMap<>();
    public static void initTempModel(String name,TemplateModel tm){
    	tmMap.put(name, tm);
    }
    
    /**
     * 生成静态文件
     * @param dataMap  传入的各种变量集合
     * @param template 模板对象
     * 
     */
	public static void genTemplateJrxml(String key,Object object, TemplateDef template) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put(key, object);
		genTemplateJrxml(map, template);
	}
    
    /**
     * 生成静态文件
     * @param dataMap  传入的各种变量集合
     * @param template 模板对象
     * 
     */
	public static void genTemplateJrxml(Map<Object,Object> dataMap, TemplateDef template) {
		Configuration config = new Configuration(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS);
		Template temp = null;
		OutputStreamWriter out = null;
		
		config.setDefaultEncoding("utf-8");
		config.setNumberFormat("#");
		config.setDateFormat("yyyy-MM-dd");
		config.setDateTimeFormat("yyyy-MM-dd HH:mm:ss");
		config.setTimeFormat("HH:mm:ss");
		config.setObjectWrapper(new BeansWrapper(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS));
		config.setWhitespaceStripping(true);
		config.setTemplateUpdateDelay(0);
		for (String key : tmMap.keySet()) {
			config.setSharedVariable(key, tmMap.get(key));
		}
		try {
			config.setTemplateLoader(new FileTemplateLoader(new File(ROOT_PATH)));
			generateTxtFile(dataMap, config, temp, template, out);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 简单生成文件
	 * @param fileName
	 * @param fileDir
	 * @param tempName
	 * @param tempDir
	 * @param dataMap
	 */
	public static void genSimple(String fileName,String fileDir,String tempName,String tempDir,Map<Object, Object> dataMap){
		TemplateDef	def = new TemplateDef();
		def.setGenerateFileName(fileName);
		def.setGenerateFilePath(fileDir);
		def.setTemplateName(tempName);
		def.setTemplatePath(tempDir);
		GenTxtUtil.genTemplateJrxml(dataMap, def);
	}
	/**
	 * 简单生成文件
	 * @param fileName
	 * @param fileDir
	 * @param tempName
	 * @param tempDir
	 */
	public static void genSimple(String fileName,String fileDir,String tempName,String tempDir){
		GenTxtUtil.genSimple(fileName, fileDir, tempName, tempDir, null);
	}

	private synchronized static void generateTxtFile(Map<Object,Object> context, Configuration config,
			Template temp, TemplateDef templateUtils, OutputStreamWriter out)
			throws Exception {
		temp = config.getTemplate(templateUtils.getTemplatePath()+templateUtils.getTemplateName());
		FileUtil.checkAndMkdir(ROOT_PATH+templateUtils.getGenerateFilePath());
		out = new OutputStreamWriter(new FileOutputStream(ROOT_PATH+templateUtils.getGenerateFilePath()
				+ templateUtils.getGenerateFileName()), "UTF-8");
		
		temp.process(context, out);
		out.flush();
		out.close();
	}
}
