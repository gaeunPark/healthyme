package com.healthyme.domain;

import java.util.Date;

public class ReplyVO {
	private Integer replyIdx;
	private Integer boardIdx;
	private String replyText;
	private String replyer;
	private Date regDate;
	private Date updateDate;
	
	public Integer getReplyIdx() {
		return replyIdx;
	}
	public void setReplyIdx(Integer replyIdx) {
		this.replyIdx = replyIdx;
	}
	public Integer getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(Integer boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [replyIdx=" + replyIdx + ", boardIdx=" + boardIdx + ", replyText=" + replyText + ", replyer="
				+ replyer + ", regDate=" + regDate + ", updateDate=" + updateDate + "]";
	}
	
	
}
