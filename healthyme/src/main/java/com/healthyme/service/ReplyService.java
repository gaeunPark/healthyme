package com.healthyme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.healthyme.dao.ReplyDAO;
import com.healthyme.domain.Criteria;
import com.healthyme.domain.ReplyVO;

@Service
public class ReplyService {

	@Inject
	private ReplyDAO dao;

	public void insertReply(ReplyVO replyVO) throws Exception{
		dao.insertReply(replyVO);
	}

	public List<ReplyVO> replyList(int boardIdx, Criteria cri) throws Exception{
		return dao.replyList(boardIdx, cri);
	}
	public int countReply(int boardIdx) throws Exception{
		return dao.countReply(boardIdx);
	}

	public void updateReply(ReplyVO replyVO) throws Exception{
		dao.updateReply(replyVO);
	}

	public void deleteReply(int replyIdx) throws Exception{
		dao.deleteReply(replyIdx);
	}
}
