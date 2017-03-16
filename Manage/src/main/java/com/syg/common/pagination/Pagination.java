package com.syg.common.pagination;

import java.util.ArrayList;
import java.util.List;

public class Pagination {
	private String seqName="";
	private int seqType=0;
	private int showCount = 30; //每页显示记录数
	private int totalPage;		//总页数
	private int totalResult;	//总记录数
	private int currentPage;	//当前页
	private int currentResult;	//当前记录起始索引
	private List<Object> items = new ArrayList<>();
	public int getTotalPage() {
		if(totalResult%showCount==0)
			totalPage = totalResult/showCount;
		else
			totalPage = totalResult/showCount+1;
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalResult() {
		return totalResult;
	}
	public void setTotalResult(int totalResult) {
		this.totalResult = totalResult;
	}
	public int getCurrentPage() {
		if(currentPage>getTotalPage()-1){
			currentPage = getTotalPage()-1;
		}
		if(currentPage<0){
			currentPage = 0;
		}
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getShowCount() {
		return showCount;
	}
	public void setShowCount(int showCount) {
		this.showCount = showCount;
	}
	public int getCurrentResult() {
		currentResult = getCurrentPage()*getShowCount();
		if(currentResult<0) currentResult = 0;
		return currentResult;
	}
	public void setCurrentResult(int currentResult) {
		this.currentResult = currentResult;
	}
	
	public List<Object> getItems() {
		return items;
	}
	public void setItems(List<Object> items) {
		this.items = items;
	}
	public void setSeqName(String seqName) {
		this.seqName = seqName;
	}
	public String getSeqName() {
		return seqName;
	}
	public void setSeqType(int seqType) {
		this.seqType = seqType;
	}
	public int getSeqType() {
		return seqType;
	}
	
	public void resetByList(List<?> allItems){
		this.getItems().clear();
		setTotalResult(allItems.size());
		getTotalPage();
		getCurrentPage();
		getCurrentResult();
		for (int i = getCurrentResult(); i < getCurrentResult()+getShowCount(); i++) {
			Object ni = allItems.get(i);
			if (ni!=null) {
				this.getItems().add(ni);
			}
		}
	}
	
}
