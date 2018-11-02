package com.healthyme.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.healthyme.domain.Criteria;
import com.healthyme.domain.ReplyVO;


@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sqlsession;
	private static final String namespace = "com.healthyme.mapper.replyMapper";
	
	@Override
	public void insertReply(ReplyVO replyVO) {
		sqlsession.insert(namespace + ".insertReply", replyVO);
	}
	@Override
	public List<ReplyVO> replyList(int boardIdx, Criteria cri){
		Map<String, Object> param = new HashMap<>();
		param.put("boardIdx", boardIdx);
		param.put("cri", cri);
		return sqlsession.selectList(namespace + ".replyList", param);
	}
	@Override
	public int countReply(int boardIdx) {
		return sqlsession.selectOne(namespace + ".countReply", boardIdx);
	}
	@Override
	public void updateReply(ReplyVO replyVO) {
		sqlsession.update(namespace + ".deleteReply", replyVO);
	}
	@Override
	public void deleteReply(int replyIdx) {
		sqlsession.delete(namespace + ".updateReply", replyIdx);
	}
	@Override
	public int getBoardIdx(int replyIdx) {
		return sqlsession.selectOne(namespace + ".getBoardIdx", replyIdx);
	}

}
