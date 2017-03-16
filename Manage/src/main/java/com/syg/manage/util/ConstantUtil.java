package com.syg.manage.util;

import java.util.Calendar;
import java.util.Date;

public class ConstantUtil {
	
	//下注统计类型列表
	/*public static final List<ItemType> statisticsTypeBetList = new ArrayList<ItemType>(){{
		for(EnumUtil.StatisticsTypeBet l:EnumUtil.StatisticsTypeBet.values()){
			add(new ItemType(l.type,l.name));
		}
	}};*/
	
	public static void main(String[] args) {
		System.out.println(getPointDate(2016, 0, 21));
	}
	
	public static Date getPointDate(int year,int month,int day){
		Calendar ca =Calendar.getInstance();
		ca.set(Calendar.YEAR, year);
		ca.set(Calendar.MONTH, month-1);
		ca.set(Calendar.DAY_OF_MONTH, day);
		return ca.getTime();
	}
	
	public static Date getPointDate(int month,int day){
		Calendar ca =Calendar.getInstance();
		ca.set(Calendar.MONTH, month-1);
		ca.set(Calendar.DAY_OF_MONTH, day);
		return ca.getTime();
	}
	

}
