package com.syg.common.gentxt;

/**
 * Freemarker在生成文件时,临时存放生成文件信息对象
 * @author meehu
 */
public class TemplateDef {
    private String templatePath;
    private String templateName;
    private String generateFilePath;
    private String generateFileName;
    
    
    
	public String getTemplatePath() {
		if(!templatePath.endsWith("/")&&!templatePath.endsWith("\\")){
			templatePath+="/";
		}
		return templatePath;
	}
	/**
	 *设置模板文件所在路径
	 *@param templatePath
	 *从项目根目录向下的路径，比如“WEB-INF/pages/ebank/”
	 **/
	public void setTemplatePath(String templatePath) {
		this.templatePath = templatePath;
	}
	
	
	
	
	public String getTemplateName() {
		return templateName;
	}
	/**
	 *设置模板文件名称
	 *@param templateName 比如“index.ftl”
	 **/
	public void setTemplateName(String templateName) {
		this.templateName = templateName;
	}
	
	
	
	public String getGenerateFilePath() {
		if(!generateFilePath.endsWith("/")&&!generateFilePath.endsWith("\\")){
			generateFilePath+="/";
		}
		return generateFilePath;
	}
	/**
	 * 设置文件生成后的存放路径
	 *@param generateFilePath
	 *从项目根目录向下的路径，比如“help/mobile/”</br>
	 *如果写“”默认为根目录
	 **/
	public void setGenerateFilePath(String generateFilePath) {
		this.generateFilePath = generateFilePath;
	}
	
	
	
	public String getGenerateFileName() {
		return generateFileName;
	}
	/**
	 * 设置生成之后的文件名
	 *@param generateFileName  比如“mobileIndex.html”
	 **/
	public void setGenerateFileName(String generateFileName) {
		this.generateFileName = generateFileName;
	}
	
	
	
//	/**
//	 * 简易方式同时设置模版名称和生成文件名称
//	 * @param templateName 模板简易名称/模版名称</br>
//	 * 如：模板简易名称"mobileIndex"  →  "mobileIndex.ftl" 和  "mobileIndex.html";</br>
//	 * 如：模版名称 "xxIndex.ftl"  →  "xxIndex.ftl" 和  "xxIndex.html";
//	 */
//	public void setTemplateNameEasyWay(String templateName) {
//		if (templateName.contains(".")) {
//			this.templateName = templateName;
//			this.generateFileName = templateName.replace(".ftl", ".html");
//		} else {
//			this.templateName = templateName.concat(".ftl");
//			this.generateFileName = templateName.concat(".html");
//		}
//	}
}
