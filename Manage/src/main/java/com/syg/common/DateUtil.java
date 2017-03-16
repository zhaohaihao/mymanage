package com.syg.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

public class DateUtil {
	/**
	 * 比较是否同一天
	 * @param dateA
	 * @param dateB
	 * @return
	 */
	public static boolean areSameDay(Date dateA,Date dateB) {
	    Calendar calDateA = Calendar.getInstance();
	    calDateA.setTime(dateA);

	    Calendar calDateB = Calendar.getInstance();
	    calDateB.setTime(dateB);

	    return calDateA.get(Calendar.YEAR) == calDateB.get(Calendar.YEAR)
	            && calDateA.get(Calendar.MONTH) == calDateB.get(Calendar.MONTH)
	            &&  calDateA.get(Calendar.DAY_OF_MONTH) == calDateB.get(Calendar.DAY_OF_MONTH);
	}
	
	public static Date todayTimeZero(){
		return timeZeroDate(0);
	}
	public static Date yestodayTimeZero(){
		return timeZeroDate(-1);
	}
	public static Date tomorrowTimeZero(){
		return timeZeroDate(1);
	}
	
	private static Date timeZeroDate(int day){
		Calendar ca = Calendar.getInstance();
		ca.set(Calendar.HOUR, -12);
		ca.set(Calendar.MINUTE, 0);
		ca.set(Calendar.SECOND, 0);
		ca.set(Calendar.MILLISECOND, 0);
		ca.add(Calendar.DATE, day);
		return ca.getTime();
	}
	
	
	public static int daySub(Date dateA,Date dateB){
		Calendar caA = Calendar.getInstance();
		caA.setTime(dateA);
		caA.set(Calendar.HOUR, -12);
		caA.set(Calendar.MINUTE, 0);
		caA.set(Calendar.SECOND, 0);
		caA.set(Calendar.MILLISECOND, 0);
		
		
		Calendar caB = Calendar.getInstance();
		caB.setTime(dateB);
		caB.set(Calendar.HOUR, -12);
		caB.set(Calendar.MINUTE, 0);
		caB.set(Calendar.SECOND, 0);
		caB.set(Calendar.MILLISECOND, 0);
		
		int day = Long.valueOf((caA.getTimeInMillis()-caB.getTimeInMillis())/86400000L).intValue(); 
		return day;
	}
	
	/**
	 * 获取周开始结束
	 * @param week
	 * @param day
	 * @param date
	 * @return 周几的日期
	 */
	public static Date getWeek(int week,int day,Date date){
		 Calendar cal = Calendar.getInstance();
		 if(date != null){
			 cal.setTime(date);
		 }
		  //n为推迟的周数，1本周，-1向前推迟一周，2下周，依次类推
		 cal.add(Calendar.DATE, week*7-1);
		  //想周几，这里就传几Calendar.MONDAY（TUESDAY...）
		 cal.set(Calendar.DAY_OF_WEEK,day);
		 cal.set(Calendar.HOUR, 0);
		 cal.set(Calendar.MINUTE, 0);
		 cal.set(Calendar.SECOND, 0);
		 cal.set(Calendar.MILLISECOND, 0);
		 return cal.getTime();		
	}
	
	/**
	 * 获取几天前或几天后
	 * @param day
	 * @param date
	 * @return 日期
	 */
	public static Date getDay(int day, Date date){
		Calendar cal = Calendar.getInstance();
		if(date != null){
			 cal.setTime(date);
		 }
		 cal.add(Calendar.DATE, day);
		 cal.set(Calendar.HOUR, 0);
		 cal.set(Calendar.MINUTE, 0);
		 cal.set(Calendar.SECOND, 0);
		 cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}
	public static SimpleDateFormat getSDFYMD() {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		return format;
	}
	public static SimpleDateFormat getSFYMDHMS() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format;
	}
	public static Date getYMDHMS(String ymdhms){
		Date date=null;
		try {
			date=getSFYMDHMS().parse(ymdhms);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	public static String getYMD() {
		String format = getSDFYMD().format(new Date());
		return format;
	}

	public static String getYMD(Date date) {
		String format = getSDFYMD().format(date);
		return format;
	}
	public static Date getDate(String ymd){
		Date date=null;
		try {
			date=getSDFYMD().parse(ymd);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	
	//type 0开始 1结束
	public static Calendar getWeekDate(Date time,int type){
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 设置时间格式  
        Calendar cal = Calendar.getInstance();  
        cal.setTime(time);  
        // 判断要计算的日期是否是周日，如果是则减一天计算周六的，否则会出问题，计算到下一周去了  
        int dayWeek = cal.get(Calendar.DAY_OF_WEEK);// 获得当前日期是一个星期的第几天  
        if (1 == dayWeek) {  
            cal.add(Calendar.DAY_OF_MONTH, -1);  
        }  
        cal.setFirstDayOfWeek(Calendar.MONDAY);// 设置一个星期的第一天，按中国的习惯一个星期的第一天是星期一  
        int day = cal.get(Calendar.DAY_OF_WEEK);// 获得当前日期是一个星期的第几天  
        cal.add(Calendar.DATE, cal.getFirstDayOfWeek() - day);// 根据日历的规则，给当前日期减去星期几与一个星期第一天的差值  
        if(type==0){
        	return cal;
        }
        cal.add(Calendar.DATE, 6);  
        return cal;
	}
	
	  public static Map<String, String> getFirstday_Lastday_Month(Date date) {
	        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(date);
//	        calendar.add(Calendar.MONTH, -1);
	        Date theDate = calendar.getTime();
	        
	        //上个月第一天
	        GregorianCalendar gcLast = (GregorianCalendar) Calendar.getInstance();
	        gcLast.setTime(theDate);
	        gcLast.set(Calendar.DAY_OF_MONTH, 1);
	        String day_first = df.format(gcLast.getTime());
	        StringBuffer str = new StringBuffer().append(day_first).append(" 00:00:00");
	        day_first = str.toString();

	        //上个月最后一天
	        calendar.add(Calendar.MONTH, 1);    //加一个月
	        calendar.set(Calendar.DATE, 1);        //设置为该月第一天
	        calendar.add(Calendar.DATE, -1);    //再减一天即为上个月最后一天
	        String day_last = df.format(calendar.getTime());
	        StringBuffer endStr = new StringBuffer().append(day_last).append(" 23:59:59");
	        day_last = endStr.toString();
	        Map<String, String> map = new HashMap<String, String>();
	        
	        int maxDay = calendar.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	        map.put("first", day_first);
	        map.put("last", day_last);
	        map.put("totalDay", maxDay+"");
	        return map;
	    }
	  public static String getMonthNum(int month){
		  String result="";
		  switch (month) {
		case 0:
			result="一月";
			break;
		case 1:
			result="二月";
			break;
		case 2:
			result="三月";
			break;
		case 3:
			result="四月";
			break;
		case 4:
			result="五月";
			break;
		case 5:
			result="六月";
			break;
		case 6:
			result="七月";
			break;
		case 7:
			result="八月";
			break;
		case 8:
			result="九月";
			break;
		case 9:
			result="十月";
			break;
		case 10:
			result="十一月";
			break;
		case 11:
			result="十二月";
			break;

		default:
			break;
		}
		  return result;
	  }
	  
	  public static void main(String[] args) {
		
		  Map<String, String> firstday_Lastday_Month = getFirstday_Lastday_Month(new Date());
		  for(Entry<String, String> t:firstday_Lastday_Month.entrySet()){
			  System.out.println(t.getKey()+"==="+t.getValue());
		  }
//		  int daySub = daySub(new Date(System.currentTimeMillis()-8*86400000), new Date());
//		  
//		  System.out.println(daySub);
		  
	}
}
