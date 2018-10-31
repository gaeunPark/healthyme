package com.healthyme.dao;

import java.util.List;

import com.healthyme.domain.Criteria;
import com.healthyme.domain.ReplyVO;

public interface ReplyDAO {
	
	public void insertReply(ReplyVO replyVO);
	
	public List<ReplyVO> replyList(int boardIdx, Criteria cri);
	
	public void updateReply(ReplyVO replyVO);
	
	public void deleteReply(int replyIdx);
	
	public int countReply(int boardIdx);
}
