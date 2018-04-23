package com.tz.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

/**
 * @ClassName: DownImgUtil
 * @Description:
 * @author: Administrator
 * @date 2018年4月22日
 */
public class DownImgUtil {
	
	/**
	 * @Title: downloading
	 * @Description: 图片下载核心类
	 * @param netImg
	 * @param targetPath
	 * @return
	 */
	public static boolean downloading(String netImg,String targetPath) {
		try {
			//建立连接
			URL url = new URL(netImg);
			//打开连接
			java.net.URLConnection urlConnection=url.openConnection();
			
			InputStream inputStream=urlConnection.getInputStream();
			//创建文件 
			File file=new File(targetPath);
			
			FileOutputStream out=new FileOutputStream(file);
			int i=0;
			while((i=inputStream.read())!=-1){
				out.write(i);
			}
			out.close();
			inputStream.close();
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	//第一步获取网页的源代码
	/**
	 * @Title: htmlSource
	 * @Description: 
	 * @param link
	 * @param encoding
	 * @return
	 */
	public static String htmlSource(String link,String encoding){
		
		InputStreamReader in=null;
		StringBuffer sb=new StringBuffer();
		try {
			//建立网络连接 异常机制
			URL url=new URL(link);
			//打开网络连接
			URLConnection uc = url.openConnection();
			//伪装
			uc.setRequestProperty("User-Agent", "java");
			//文件的传输  IO流 -->Javase
			InputStream inputStream =uc.getInputStream();
			in=new InputStreamReader(inputStream,encoding);
			//缓冲
			BufferedReader reader=new BufferedReader(in);
			//创建临时文件 
			String line = null;
			while ((line=reader.readLine())!=null) {
				sb.append(line+"\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
				try {
					
					if(null!=in)in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		
		return sb.toString();
	}
	
	public static void main(String[] args){
		htmlSource("http://www.qq.com", "gbk");
	}
}
