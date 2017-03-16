package com.syg.manage.util;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

public class TaskUtil {
	
	private final static ScheduledExecutorService pool = Executors.newSingleThreadScheduledExecutor();
	
	public static void  submitTask(Runnable task){
		pool.submit(task);
	}
	
	public static ScheduledExecutorService getScheduledExecutorService(){
		return pool;
	}
	
	public static void main(String[] args) {
		System.out.println("efe09d10-0caa-34c0-98d0-9213b62861bf".length());
	}

}
