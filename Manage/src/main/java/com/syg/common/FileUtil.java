package com.syg.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

public class FileUtil {
	 /**保存文件  
     * @param stream  
     * @param path  
     * @param filename  
     * @throws IOException  
     */  
    public static void saveFile(InputStream stream,String path,String filename) throws IOException   
    {         
        FileOutputStream fs=new FileOutputStream( path + "/"+ filename);   
        byte[] buffer =new byte[1024*1024*10];
        int byteread = 0;
        while ((byteread=stream.read(buffer))!=-1)   
        {
           fs.write(buffer,0,byteread);   
           fs.flush();   
        }
        fs.close();   
        stream.close(); 
    }
    
    public static void delFile(String path,String filename)
    {
    	File file = new File(path+"/"+filename);
    	if(file.exists())
    	{
    		if(!file.delete())
    		{
    			throw new RuntimeException("del file error");
    		}
    	}
    }
    
    public static void checkAndMkdir(String path) throws IOException {
    	File directory=new File(path); 
        if (!directory.exists() || !directory.isDirectory()) {
        	if (!directory.mkdirs()) {
        		throw new RuntimeException("mkdirs error :["+path+"]");
            }
        }   	
    }
    
    
}
