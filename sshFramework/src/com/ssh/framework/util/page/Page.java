package com.ssh.framework.util.page;

import java.io.Serializable;
import java.util.List;


/**   
 * 分页对象 
 */
public class Page implements Serializable{
	
	private static final long serialVersionUID = 384413940752138525L;
	/**   
	 * 总记录条数
	 */   
	private int recordNumber=0;
	/**   
	 * 每页显示的条数
	 */   
	private int pageSize=10;
	/**   
	 * 当前页面索引
	 */   
	private int pageIndex=1;
	/**   
	 * 总共页数
	 */   
	private int pageCount=1;
	/**   
	 * 每页包含的数据内容
	 */   
	private List<?> pageContent;
	
	public Page(int recordNumber, int pageSize, int pageIndex) {
		this.recordNumber = recordNumber;
		this.pageSize = pageSize;
		this.pageIndex = pageIndex;
		setPage(recordNumber, pageSize, pageIndex);
	}


	/**
	 * 设置分页信息
	 * @param recordNumber 总记录
	 * @param pageNumber 每页显示数量
	 * @param pageIndex	当前索引   
	 */
	private void setPage(int recordNumber,int pageSize,int pageIndex){
		if(recordNumber>=0){
			this.recordNumber=recordNumber;
		}
		if(pageSize>=1){
			this.pageSize=pageSize;
		}
		this.pageCount=this.recordNumber/this.pageSize;
		if(this.recordNumber%this.pageSize!=0){
			this.pageCount++;
		}
		if(this.pageCount==0){
			this.pageCount=1;
		}
		this.pageIndex=pageIndex;
		if(this.pageIndex<=0){
			this.pageIndex=1;
		}
		if(this.pageIndex>this.pageCount){
			this.pageIndex=this.pageCount;
		}
	}
	
	/**
	 * 设置分页信息
	 * @param recordNumber 总记录条数
	 */
	private void setPage(int recordNumber){
		if(recordNumber>=0){
			this.recordNumber=recordNumber;
		}
		this.pageCount=this.recordNumber/this.pageSize;
		if(this.recordNumber%this.pageSize!=0){
			this.pageCount++;
		}
		if(this.pageCount==0){
			this.pageCount=1;
		}
		if(this.pageIndex<=0){
			this.pageIndex=1;
		}
		if(this.pageIndex>this.pageCount){
			this.pageIndex=this.pageCount;
		}
	}
	
	/**   
	 * 设置总记录条数
	 * @param recordNumber    
	*/
	public void setRecordNumber(int recordNumber) {
		if(recordNumber >= 0){
			setPage(recordNumber);
		}
	}
	public int getPageIndex() {
		return pageIndex;
	}
	
	public int getPageCount() {
		return pageCount;
	}
	
	public List<?> getPageContent() {
		return pageContent;
	}

	/**   
	 * setPageContent方法概要说明
	 * 设置每页内容
	 * @param pageContent    
	*/
	public void setPageContent(List<?> pageContent) {
		this.pageContent = pageContent;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getRecordNumber() {
		return recordNumber;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
}