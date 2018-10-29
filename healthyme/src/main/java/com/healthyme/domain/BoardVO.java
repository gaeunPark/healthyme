package com.healthyme.domain;

import java.util.Date;

public class BoardVO {
	private Integer boardIdx;
	private Integer categoryIdx;
	private String title;
	private String content;
	private String writer;
	private Integer viewCnt;
	private Integer replyCnt;
	private Date regDate;
	private Date updateDate;
	private String fileName;
	private Integer fileSize;
	private String boardIp;
	private String boardPass;
	
	public Integer getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(Integer boardIdx) {
		this.boardIdx = boardIdx;
	}
	public Integer getCategoryIdx() {
		return categoryIdx;
	}
	public void setCategoryIdx(Integer categoryIdx) {
		this.categoryIdx = categoryIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Integer getFileSize() {
		return fileSize;
	}
	public void setFileSize(Integer fileSize) {
		this.fileSize = fileSize;
	}
	public String getBoardIp() {
		return boardIp;
	}
	public void setBoardIp(String boardIp) {
		this.boardIp = boardIp;
	}
	public String getBoardPass() {
		return boardPass;
	}
	public void setBoardPass(String boardPass) {
		this.boardPass = boardPass;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	@Override
	public String toString() {
		return "BoardVO [boardIdx=" + boardIdx + ", categoryIdx=" + categoryIdx + ", title=" + title + ", content="
				+ content + ", writer=" + writer + ", viewCnt=" + viewCnt + ", replyCnt=" + replyCnt + ", regDate="
				+ regDate + ", fileName=" + fileName + ", fileSize=" + fileSize + ", boardIp=" + boardIp
				+ ", boardPass=" + boardPass + "]";
	}

	
	
	
}
