package com.healthyme.domain;

import java.util.Date;

public class BoardVO {
	private Integer postIdx;
	private Integer categoryIdx;
	private String postTitle;
	private String postContent;
	private String postWriter;
	private Integer viewCnt;
	private Integer replyCnt;
	private Date regDate;
	
	public Integer getcCategoryIdx() {
		return categoryIdx;
	}
	public void setCategoryIdx(Integer categoryIdx) {
		this.categoryIdx = categoryIdx;
	}
	public Integer getPostIdx() {
		return postIdx;
	}
	public void setPostIdx(Integer postIdx) {
		this.postIdx = postIdx;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostWriter() {
		return postWriter;
	}
	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}
	public Integer getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(Integer viewCnt) {
		this.viewCnt = viewCnt;
	}
	public Integer getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(Integer replyCnt) {
		this.replyCnt = replyCnt;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
