package com.syg.manage.util;

import java.util.ArrayList;
import java.util.List;


public class EnumUtil {
	
	//
	public enum StatisticsTypeBet{
		CONSUME(1,"玩家消耗"),
		WIN(2,"玩家赢分"),
		WIN_REAL(3,"玩家净输赢"),
		;
		private static List<StatisticsTypeBet> list = new ArrayList<StatisticsTypeBet>(){{
			for(EnumUtil.StatisticsTypeBet l:EnumUtil.StatisticsTypeBet.values()){
				add(l);
			}
		}};
		
		public static StatisticsTypeBet getByType(int type){
			if(type<=0||type>list.size())
				return null;
			return list.get(type-1);
		}
				
		public int type;
		public String name;
		private StatisticsTypeBet(int type, String name) {
			this.type = type;
			this.name = name;
		}
		public String toString() {
            return String.valueOf(this.type)+"-"+name;
		}		
	}
	
	//日志类型
	public enum LogType{
		
		LOGIN(1),//用户登陆行为；
		BET(2),//用户下注行为；
		
		USER_REGISTER(9001),//用户注册；
		USER_REMAINDATA(9002),//用户留存数据；
		USER_ONLINE(9003),//用户在线数据统计
		USER_ONLINE_REAL(9004),//用户实时在线数据统计；
		
		CORE_DATA(9005),//核心数据
		
				
		USERLOG_SEQ(9999)//用户日志分析序列数据的类型，一条特殊的数据，用来记录userlog已经分析完成的最后一条数据的id;
		;
		
		public int type;

		private LogType(int type) {
			this.type = type;
		}
		
		public String toString() {
	        return String.valueOf(this.type);
	    }
		
	}

}
