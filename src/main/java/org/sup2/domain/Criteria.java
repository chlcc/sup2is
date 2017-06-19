package org.sup2.domain;

public class Criteria {

	private int perPageNum = 10;
	private int page = 1;
	private String searchType;
	private String keyword;
	
	
	@Override
	public String toString() {
		return "Criteria [perPageNum=" + perPageNum + ", page=" + page + ", searchType=" + searchType + ", keyword="
				+ keyword + "]";
	}
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPerPageNum() {
		return this.perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 30){
			this.perPageNum = 10;
		}
		this.perPageNum = perPageNum;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getPageStart() {
		return(this.page - 1) * perPageNum;
		
	}
	
	
	
	
}
