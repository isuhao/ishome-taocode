package com.zx.court.common;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class Util {
	private static Log log = LogFactory.getLog(Util.class);
	private static final String FILE_NAME="application.properties";
	private static Properties pp=null;
	
	public static void init() {
		InputStream in = Util.class.getClassLoader().getResourceAsStream(FILE_NAME);
		pp = new Properties();
		try{
			pp.load(in);	
		}catch(IOException e){
			log.info("read the datasource property file error");
			e.printStackTrace();
		}		
	}
	
	public static Properties getProperties() {
		if(pp==null){
			init();
		}
		return pp;
	}
	
	public String subStringLen(){
		Properties p = this.getProperties();
		String len= p.getProperty("SUBSTRUNGLEN");
		return len;	
	}
	
	public String reCompanyCode(){
		Properties p = this.getProperties();
		String cityCode= p.getProperty("CITYCODE");
		String companyCode= p.getProperty("COMPANY");
		String code =cityCode+companyCode;
		return code;	
	}
	
	public String imagePath(){
		Properties p = this.getProperties();
		String path=p.getProperty("IMAGEPATH");
		return path;
	}
	
	public String cabinetPath(){
		Properties p = this.getProperties();
		String path=p.getProperty("CABINETPATH");
		return path;
	}
	
	public static String zeroAddzdy(String string,int data){
		String orderId = "";
		String zero = "";
		int strlength = string.length();
		if(strlength >= data){
			orderId = string.substring(0,data);  
		}else{
			int i = data - strlength;
			for (int j = 0; j < i; j++) {
				zero = zero + "0";
			}
			orderId = zero + string;
		}
		return orderId;
	}
	
	public String covertDouble (String strPrice){
		DecimalFormat df = new DecimalFormat("0.00");
		String price =df.format(Double.parseDouble(strPrice));
		return price;
	}
	
	public String strReplace(String strOld,String strNew,String type,String synbol){
		int num1= strOld.indexOf(type);
		int num2= strOld.indexOf(synbol);
		String tempStr=strOld.substring(num1, num2);
		strOld.replace(tempStr, strNew);
		return strOld.replace(tempStr, strNew);
	}
	
	public Boolean deleteImage(String imagePath){
		Boolean flag=false;
		File theFile = new File(imagePath);
	    if (theFile.exists()){
	    	flag= theFile.delete();
	    }
		return flag;
		
	}
	
	public String geRundomPassWord(){
		String strPw="0";
		strPw=String.valueOf(Math.random());
		return strPw.substring(3,9);
		
	}

	

	public JSONArray jsonConvert(List list){
		JSONArray jsonArray=JSONArray.fromObject(list);
		
		return jsonArray;		
	}
	
	public JSONArray getjsonArray(String jsonString,String type){
		
		JSONObject jsonObj = JSONObject.fromObject(jsonString); 
		
		JSONArray jsonarr = jsonObj.getJSONArray(type);
		return jsonarr;  

	}
	
	public JSONObject getjsonObj(String jsonString){
		
		JSONObject jsonObj = JSONObject.fromObject(jsonString);
		return jsonObj; 
	}
	
	
	public String getjsonArrayForCredit(String jsonString){
		
		JSONObject jsonObj = JSONObject.fromObject(jsonString); 
		
		String str = jsonObj.getString("信誉度提示");
		return str;  

	}
	
	public String  getjsonDate(String jsonString,String type){
		
		JSONObject jsonObj = JSONObject.fromObject(jsonString); 
		
		String dataCount = String.valueOf(jsonObj.get(type));

		return dataCount; 

	}
	



	/**
	 * 格式化时间
	 * @author 001334
	 * @param  String
	 * @return返回短时间格式 yyyy-MM-dd
	 */
	public String translationData(String strDate){
		Date date = null;                    
		String dateString="";
		DateFormat format1 = new SimpleDateFormat("yyyy年MM月dd日");    
		DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			date = format1.parse(strDate);
			dateString = format2.format(date);
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return dateString; 
	}
	
	public int getSystemDate(String  strFlag){
		Calendar c = Calendar.getInstance();
		if ("1".equals(strFlag)) {
			int year = c.get(Calendar.YEAR);
			return year;
		}else if("2".equals(strFlag)){
			int month = c.get(Calendar.MONTH); 
			return month;
		}else if ("3".equals(strFlag)){
			int date = c.get(Calendar.DATE); 
			return date;
		}else if ("4".equals(strFlag)){
			int hour = c.get(Calendar.HOUR_OF_DAY); 
			return hour;
		}else if ("5".equals(strFlag)){
			int minute = c.get(Calendar.MINUTE); 
			return minute;
		}else if ("6".equals(strFlag)){
			int second = c.get(Calendar.SECOND); 
			return second;
		}else{
			return 0;
		}

	}
	
    /**
     * Decode锟�
     *
     * @param 
     */
    public static String paraFormatDecoder(String str) {

        String convertString =str;
        try {
                if (!str.isEmpty()){
                    convertString=URLDecoder.decode(str,"UTF-8");
                }
        } catch (UnsupportedEncodingException e) {
            // TODO 鑷嫊鐢熸垚銇曘倢锟�catch 銉栥儹銉冦偗
            e.printStackTrace();
        }
        return convertString;
    }
    
    public static String paraFormatEncode(String str) {

        String convertString =str;
        try {
                if (!str.isEmpty()){
                    convertString=URLEncoder.encode(str,"UTF-8");
                }
        } catch (UnsupportedEncodingException e) {
            // TODO 鑷嫊鐢熸垚銇曘倢锟�catch 銉栥儹銉冦偗
            e.printStackTrace();
        }
        return convertString;
    }
	
	public static void main(String[] args) throws IOException {
		
		//http://shixin.court.gov.cn/image.jsp?date=Wed%20Dec%2002%202015%2011:51:28%20GMT+0800%20(%E4%B8%AD%E5%9B%BD%E6%A0%87%E5%87%86%E6%97%B6%E9%97%B4)
		String aa =paraFormatEncode("案件类型:民事案件");
		System.out.println(aa);
		//%E6%B5%B7%E5%8D%97%E6%B6%A6%E7%94%B0%E5%AE%9E%E4%B8%9A%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8
		//%E6%B5%B7%E5%8D%97%E6%B6%A6%E7%94%B0%E5%AE%9E%E4%B8%9A%E6%9C%89%E9%99%90%E5%85%AC%E5%8F%B8
		
		
	}

} 
	

