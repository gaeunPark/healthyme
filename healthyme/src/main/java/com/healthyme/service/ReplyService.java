package com.healthyme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.healthyme.dao.BoardDAO;
import com.healthyme.dao.ReplyDAO;
import com.healthyme.domain.Criteria;
import com.healthyme.domain.ReplyVO;

@Service
public class ReplyService {

	@Inject
	private ReplyDAO replyDao;
	@Inject
	private BoardDAO boardDao;
	
	@Transactional
	public void insertReply(ReplyVO replyVO) throws Exception{
		replyDao.insertReply(replyVO);
		boardDao.updateReplyCnt(replyVO.getBoardIdx(), 1);
	}

	public List<ReplyVO> replyList(int boardIdx, Criteria cri) throws Exception{
		return replyDao.replyList(boardIdx, cri);
	}
	public int countReply(int boardIdx) throws Exception{
		return replyDao.countReply(boardIdx);
	}

	public void updateReply(ReplyVO replyVO) throws Exception{
		replyDao.updateReply(replyVO);
	}
	@Transactional
	public void deleteReply(int replyIdx) throws Exception{
		replyDao.deleteReply(replyIdx);
		int boardIdx = replyDao.getBoardIdx(replyIdx);
		boardDao.updateReplyCnt(boardIdx, -1);
	}
	
	
}
