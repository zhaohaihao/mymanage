package com.syg.manage.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.biff.DisplayFormat;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.write.DateFormats;
import jxl.write.DateTime;
import jxl.write.Label;
import jxl.write.NumberFormats;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jxls.reader.ReaderBuilder;
import org.jxls.reader.XLSReadStatus;
import org.jxls.reader.XLSReader;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.xml.sax.SAXException;

public class ExcelUtil {
	//private final static String xmlConfig="student.xml";
	@SuppressWarnings("rawtypes")
	public static List read(String xmlConfig, Class clazz, MultipartFile excelFile){
		InputStream inputXML = new BufferedInputStream(ExcelUtil.class.getResourceAsStream(xmlConfig));
        XLSReader mainReader;
//        String path=ExcelUtil.class.getResource("/").getPath();
//        path=path.substring(1,path.indexOf("/WebRoot")+1)+"WebRoot/Excel/stu.xls";
       
		//String newFileName = getExtention(excelFile.getOriginalFilename());
		try {
		    CommonsMultipartFile cf= (CommonsMultipartFile)excelFile;
	        DiskFileItem fi = (DiskFileItem)cf.getFileItem();
	        File targetFile = fi.getStoreLocation();
	        FileInputStream inputXLS = new FileInputStream(targetFile);
		    
			mainReader = ReaderBuilder.buildFromXML(inputXML);
			//InputStream inputXLS = new BufferedInputStream(new FileInputStream(path));
		    //Student stu=new Student();
			//List students = new ArrayList();
		 	Object obj = clazz.newInstance();
	        List list = new ArrayList();
	        Map beans = new HashMap();
//		    beans.put("stu", stu);
//		    beans.put("students", students);
	        beans.put("obj", obj);
	        beans.put("list", list);
	        XLSReadStatus readStatus = mainReader.read(inputXLS, beans);
	        return list;
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		}
		return null;
	}
	
//	public static void main(String[] args) {
//		ExcelUtil re=new ExcelUtil();
//		List<Student> list=re.read();
//		System.out.println("ID\t  name\t  subject\t  score");
//		for(Student stu:list){
//			System.out.println(stu.getIdname()+"\t  "+stu.getName()+"\t  "+stu.getSubject()+"\t  "+stu.getScorename());
//		}
//	}
	
	public static void createExcel(Excel[] excels , List objects , Class clazz, String fileName, HttpServletResponse response){
		OutputStream os = null;
		WritableWorkbook wwb = null;
		Object obj2 = null;
		try {
			response.reset();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			response.setHeader("Content-disposition", "attachment; filename="
					+ java.net.URLEncoder.encode(fileName + dateFormat.format(new Date()) +".xls", "UTF-8"));
			response.setContentType("application/msexcel");
			os = response.getOutputStream();
			wwb = Workbook.createWorkbook(os);
			WritableSheet ws = wwb.createSheet(fileName, 0);
			WritableFont[] fonts = setWritableFont();
			WritableCellFormat[] formats = setWritableCellFormat();

			WritableCellFormat titleFormat = setWritableCellFormat(
					fonts[1], NumberFormats.FORMAT1, Colour.LAVENDER);
			Excel[] excelArray = sortExcelByIndex(excels);
			for (int i = 0; i < excelArray.length; i++) {
				ws.setColumnView(i, excelArray[i].getWidth());
				ws.addCell(new Label(i, 0, excelArray[i].getTitle(), titleFormat));
			}
			obj2 = clazz.newInstance();
			for (int i = 0; i < objects.size(); i++) {
				Object obj = objects.get(i);
				for (int k = 0; k < excelArray.length; k++) {
					Object cellValue = null;
					if(excelArray[k].getMethodName() != null && excelArray[k].getMethodName().length() > 0){
						Method method = null;
						try {
							method = clazz.getDeclaredMethod(getMethodName(excelArray[k].getMethodName()), getMethodArgTypes(obj ,excelArray[k].getMethodName()));
							method.setAccessible(true);
							cellValue = method.invoke(obj2, getMethodArgFieldValues(obj, excelArray[k].getMethodName()));
						} catch (Exception e) {
							e.printStackTrace();
							throw new RuntimeException(e.getMessage());
						}						
					}else if(excelArray[k].getField().split("\\.").length > 1){
						cellValue = getFieldValue(getFieldValue(obj , excelArray[k].getField().split("\\.")[0]) , excelArray[k].getField().split("\\.")[1]);
					}else{
						cellValue = getFieldValue(obj , excelArray[k].getField());
					}
					if (cellValue==null) {
						cellValue="-";
					}
					if(cellValue instanceof Integer){
						ws.addCell(new jxl.write.Number(k, i + 1, (Integer)cellValue, formats[i%2]));
					}else if(cellValue instanceof Long){
						ws.addCell(new jxl.write.Number(k, i + 1, (Long)cellValue, formats[i%2]));
					}else if(cellValue instanceof Double){
						ws.addCell(new jxl.write.Number(k, i + 1, (Double)cellValue, formats[i%2]));
					}else if(cellValue instanceof Float){
						ws.addCell(new jxl.write.Number(k, i + 1, (Float)cellValue, formats[i%2]));
					}else if(cellValue instanceof String){
						ws.addCell(new Label(k, i + 1, (String)cellValue, formats[i%2]));
					}else if(cellValue instanceof Date){
						try {
							ws.addCell(new DateTime(k, i + 1, (Date)cellValue, formats[i%2+2]));
						} catch (Exception e) {
							ws.addCell(new Label(k, i + 1, "", formats[i%2]));
						}
					}else{
						ws.addCell(new Label(k, i + 1, (String)cellValue, formats[i%2]));
					}
				}
			}
			wwb.write();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				if (wwb != null) {
					try {
						wwb.close();
					} catch (WriteException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if (os != null) {
					try {
						os.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				wwb = null;
				os = null;
				excels = null;
				objects.clear();
				objects = null;
				obj2 = null;
		}
	}
	
	public static void createExcel2(Excel[] excels , List objects , Class clazz, String fileName, HttpServletResponse response){
		OutputStream os = null;
		WritableWorkbook wwb = null;
		Object obj2 = null;
		try {
			response.reset();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
			response.setHeader("Content-disposition", "attachment; filename="
					+ java.net.URLEncoder.encode(fileName + dateFormat.format(new Date()) +".xls", "UTF-8"));
			response.setContentType("application/msexcel");
			os = response.getOutputStream();
			wwb = Workbook.createWorkbook(os);
			WritableSheet ws = wwb.createSheet(fileName, 0);
			WritableCellFormat[] formats = setWritableCellFormat();

			WritableCellFormat[] titleFormat = new WritableCellFormat[2];
			WritableFont[] fonts = setWritableFont();
			titleFormat[0] = setWritableCellFormat(fonts[1] , NumberFormats.FORMAT1 , Colour.ICE_BLUE);
			titleFormat[1] = setWritableCellFormat(fonts[1] , NumberFormats.FORMAT1 , Colour.PALE_BLUE);
			Excel[] excelArray = sortExcelByIndex(excels);
			for (int i = 0; i < objects.size()+1; i++) {
				ws.setColumnView(i, excelArray[i].getWidth());
			}
			for (int i = 0; i < excelArray.length; i++) {
				ws.addCell(new Label(0, i, excelArray[i].getTitle(), titleFormat[i%2]));
			}
			obj2 = clazz.newInstance();
			for (int i = 0; i < objects.size(); i++) {
				Object obj = objects.get(i);
				for (int k = 0; k < excelArray.length; k++) {
					Object cellValue = null;
					if(excelArray[k].getMethodName() != null && excelArray[k].getMethodName().length() > 0){
						Method method = null;
						try {
							method = clazz.getDeclaredMethod(getMethodName(excelArray[k].getMethodName()), getMethodArgTypes(obj ,excelArray[k].getMethodName()));
							method.setAccessible(true);
							cellValue = method.invoke(obj2, getMethodArgFieldValues(obj, excelArray[k].getMethodName()));
						} catch (Exception e) {
							e.printStackTrace();
							throw new RuntimeException(e.getMessage());
						}						
					}else if(excelArray[k].getField().split("\\.").length > 1){
						cellValue = getFieldValue2(getFieldValue2(obj , excelArray[k].getField().split("\\.")[0]) , excelArray[k].getField().split("\\.")[1]);
					}else{
						cellValue = getFieldValue2(obj , excelArray[k].getField());
					}
					if(cellValue instanceof Integer){
						ws.addCell(new jxl.write.Number(i + 1, k, (Integer)cellValue, formats[k%2]));
					}else if(cellValue instanceof Long){
						ws.addCell(new jxl.write.Number(i + 1, k,(Long)cellValue, formats[k%2]));
					}else if(cellValue instanceof Double){
						ws.addCell(new jxl.write.Number(i + 1, k, (Double)cellValue, formats[k%2]));
					}else if(cellValue instanceof Float){
						ws.addCell(new jxl.write.Number(i + 1, k, (Float)cellValue, formats[k%2]));
					}else if(cellValue instanceof String){
						ws.addCell(new Label(i + 1, k, (String)cellValue, formats[k%2]));
					}else if(cellValue instanceof Date){
						try {
							ws.addCell(new DateTime(i + 1, k, (Date)cellValue, formats[k%2+2]));
						} catch (Exception e) {
							ws.addCell(new Label(i + 1, k, "", formats[k%2]));
						}
					}else{
						ws.addCell(new Label(i + 1, k, (String)cellValue, formats[k%2]));
					}
				}
			}
			wwb.write();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
				if (wwb != null) {
					try {
						wwb.close();
					} catch (WriteException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				if (os != null) {
					try {
						os.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				wwb = null;
				os = null;
				excels = null;
				objects.clear();
				objects = null;
				obj2 = null;
		}
	}
	
	public static void createExcel(Collection<Excel> excels , List objects , Class clazz, String fileName, HttpServletResponse response){
		createExcel(excels.toArray(new Excel[0]), objects, clazz, fileName, response);
	}
	
	public static Excel[] sortExcelByIndex(Excel[] excels){
		Excel[] excelArray = new Excel[excels.length];
		for (Excel e : excels) {
			if(e.getIndex() != 0){
				if(excelArray[e.getIndex()-1] != null){
					throw new RuntimeException("excel index " + e.getIndex() + " echo");
				}
				excelArray[e.getIndex()-1] = e;
			}
		}
		int t = 0;
		for (Excel e : excels) {
			if(e.getIndex() == 0){
				for (int i = t; i < excelArray.length; i++) {
					if(excelArray[i] == null){
						excelArray[i] = e;
						t = i + 1;
						break;
					}
				}
			}
		}
		excels = null;
		return excelArray;
	}

	public static Object getFieldValue(Object object , String field) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{
		Method method = object.getClass().getDeclaredMethod("get" +field.substring(0 ,1).toUpperCase()+field.substring(1));
		method.setAccessible(true);
		return method.invoke(object);
	}
	public static Object getFieldValue2(Object object , String field) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{
		Method method = object.getClass().getDeclaredMethod("get" +field);
		method.setAccessible(true);
		return method.invoke(object);
	}
	public static Class autoload(Class clazz){
		Class[] clazzs = new Class[]{int.class , long.class , double.class , float.class ,boolean.class, 
				Integer.class, Long.class ,Double.class , Float.class , Boolean.class };
		String[] classNames = new String[]{"Integer" , "Long" , "Double" , "Float" ,"Boolean", 
				"int", "long" ,"double" , "float" , "boolean"};
		String[] split = clazz.getName().split("\\.");
		for (int i = 0; i < clazzs.length; i++) {
			if(split[split.length-1].equals(classNames[i])){
				return clazzs[i];
			}
		}
		return clazz;
	}
	
	public static Class getClassByString(String clazzName){
		String[] classNames = new String[]{"int" , "long" , "double" , "float" ,"boolean", 
				"Integer", "Long" ,"Double" , "Float" , "Boolean" , "String" , "Date" , "List" ,
				"ArrayList" , "LinkedList" , "Set" , "HashSet" , "TreeSet", "Map" , "HashMap"};
		Class[] clazzs = new Class[]{int.class , long.class , double.class , float.class ,boolean.class, 
				Integer.class, Long.class ,Double.class , Float.class , Boolean.class ,String.class , Date.class , List.class ,ArrayList.class , LinkedList.class ,
				Set.class, HashSet.class , TreeSet.class , Map.class , HashMap.class};
		for (int i = 0; i < classNames.length; i++) {
			if(clazzName.equals(classNames[i])){
				return clazzs[i];
			}
		}
		return null;
	}
	
	public static String[] splitMethod(String method){
		return method.replaceAll("[ ]+", " ").split("\\(|,|\\)");
	}
	
	public static String getMethodName(String method){
		return splitMethod(method)[0];
	}
	
	public static Class[] getMethodArgTypes(Object obj , String method) throws SecurityException, NoSuchFieldException{
		String[] splitMethod = splitMethod(method);
		Class[] clazzNames = new Class[splitMethod.length - 1];
		for (int i = 1; i < splitMethod.length; i++) {
			clazzNames[i - 1] = getClassByString(splitMethod[i].trim().split(" ")[0]);
			if(clazzNames[i - 1] == null){
				clazzNames[i - 1] = getFieldType(obj , splitMethod[i].trim().split(" ")[1]);
			}
		}
		return clazzNames;
	}
	
	public static Object[] getMethodArgFieldValues(Object object , String method) throws SecurityException, IllegalArgumentException, NoSuchMethodException, IllegalAccessException, InvocationTargetException{
		String[] splitMethod = splitMethod(method);
		Object[] values = new Object[splitMethod.length - 1];
		for (int i = 1; i < splitMethod.length; i++) {
			values[i-1] = getFieldValue(object, splitMethod[i].trim().split(" ")[1]);
		}
		return values;
	}
	
	public static Class getFieldType(Object obj , String name) throws SecurityException, NoSuchFieldException{
		Field field = obj.getClass().getDeclaredField(name);
		return field.getType();
	}
	
//	public static void main(String[] args) throws Exception {
//		String method = "userName(int  a  , String  b , Long c , Double b)";
//		String aa[] = method.replaceAll("[ ]+", " ").split(" ");
//	}
	
	public static WritableFont[] setWritableFont(){
		WritableFont[] wf = new WritableFont[2];
		wf[0] = new WritableFont(WritableFont.ARIAL, 12, WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE, Colour.BLACK);
		wf[1] = new WritableFont(WritableFont.ARIAL, 12, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE, Colour.BLACK);
		return wf;
	}

	public static WritableCellFormat[] setWritableCellFormat(){
		WritableCellFormat[] format = new WritableCellFormat[4];
		WritableFont[] font = setWritableFont();
		format[0] = setWritableCellFormat(font[0] , NumberFormats.FORMAT1 , Colour.ICE_BLUE);
		format[1] = setWritableCellFormat(font[0] , NumberFormats.FORMAT1 , Colour.PALE_BLUE);
		format[2] = setWritableCellFormat(font[1] , DateFormats.FORMAT1 , Colour.ICE_BLUE);
		format[3] = setWritableCellFormat(font[1] , DateFormats.FORMAT1 , Colour.PALE_BLUE);
		return format;
	}
	
	public static WritableCellFormat setWritableCellFormat(WritableFont font , DisplayFormat format , Colour color){
		WritableCellFormat titleFormat = new WritableCellFormat(font, format);
		try {
			titleFormat.setAlignment(jxl.format.Alignment.CENTRE);
			titleFormat.setBackground(color);
		} catch (WriteException e) {
			e.printStackTrace();
		}
		return titleFormat;
	}
	
	public static WritableSheet setColumnViews(WritableSheet ws , int[] widths){
		for (int i = 0; i < widths.length; i++) {
			ws.setColumnView(i, widths[i]);
		}
		return ws;
	}
	
	public static WritableSheet setTitle(WritableSheet ws , WritableCellFormat format , String[] titles){
		for (int i = 0; i < titles.length; i++) {
			try {
				ws.addCell(new Label(i, 0, titles[i], format));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return ws;
	}
	
	
	public static List readExcelFile(String fileName,Class cl){
		//
		List list = new ArrayList();
		Map<String,Method> mMap = getMethodMap(cl);	
		XSSFWorkbook wb=null;
		try {
			wb = new XSSFWorkbook(new BufferedInputStream(new FileInputStream(fileName)));
			
			for (int i = 0; i < wb.getNumberOfSheets(); i++) {
				//
				Sheet sheet = wb.getSheetAt(i);
				if ("sheet1".equals(sheet.getSheetName().toLowerCase())
						||fileName.contains(sheet.getSheetName())) {
					Iterator<Row> it = sheet.rowIterator();
					it.next();
					Row keyRow = it.next();
					Row typeRow = it.next();
					//
					int getLastCellNum=-1;
					while (it.hasNext()) {	
						Row row = it.next();
						if (row.getCell(0) == null
								|| row.getCell(0).toString().length() == 0
								|| row.getCell(0).equals("")) {
							break;
						}						
						//
						if(getLastCellNum<0)
							getLastCellNum = row.getLastCellNum();		
						//System.out.println(getLastCellNum);
						Object o = cl.newInstance();
						for(int j=0;j<getLastCellNum;j++){
							String value=row.getCell(j).toString();
							String key = keyRow.getCell(j).getStringCellValue();
							String type = typeRow.getCell(j).getStringCellValue();
							setValue(mMap, o, type, key, value);
						}
						//System.out.println(o);
						list.add(o);
					}			
				} else if ("".equals(sheet.getSheetName())) {
				}
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();			
		}finally{
			if(wb!=null)
				try {
					wb.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return list;
	}
	
	private static void setValue(Map<String,Method> mMap, Object o, String type ,String key, String value){
		//
		String mKey= properties2SetMethodString(key);
		//System.out.println(key+" "+mKey+" "+type+" "+value);
		Method  m = mMap.get(mKey);
		if(m==null)
			return;
		try {
			if(type.contains("Int")||type.contains("int")){
				m.invoke(o, Double.valueOf(value).intValue());
			}else if(type.contains("double")||type.contains("Double")){
				m.invoke(o, Double.valueOf(value));
			}else if(type.contains("float")||type.contains("Float")){
				m.invoke(o, Float.valueOf(value));
			}else if(type.contains("string")||type.contains("String")){
				m.invoke(o, value);
			}else{
				System.out.println("----------------类型暂未实现="+type);
			}		
		} catch (Exception e) {	
			e.printStackTrace();
		}
	}
	
	private static Map<String,Method> getMethodMap(Class cl){
		Map<String,Method> mMap = new HashMap<String,Method>();
		Method[] ms = cl.getDeclaredMethods();
		for(Method m:ms){
			mMap.put(m.getName(), m);
		}		
		return mMap;
	}
	
	
	public static void main(String[] args){
		//GameThreshold
		String file = "D:/chenshanbao/client/kuzhibiao3.xlsx";
		//
		//GameThreshold gt = new GameThreshold();
		try {
//			Map<String,Method> mMap = getMethodMap(gt.getClass());				
//			Method m = mMap.get("setId");
//			m.invoke(o, 2);
//			setValue(mMap, o, "int", "id", "333");
			
//			List<GameThreshold> list = readExcelFile(file, GameThreshold.class);
//			System.out.println(list.size());
//			for(GameThreshold g:list)
//				System.out.println(g.getGameType()==0?g.getGameType():g);
//			
		} catch (Exception e) {		
			e.printStackTrace();
		}
//		System.out.println(o);				
	}
	
	private static String properties2SetMethodString(String s){
		return "set"+firstCharToUp(s);
	}
	
	private static String firstCharToUp(String s){
		return s.substring(0,1).toUpperCase()+s.substring(1);
	}
	
}
