package com.healthyme.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.healthyme.domain.BoardVO;
import com.healthyme.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlsession;
	private static final String namespace = "com.healthyme.mapper.boardMapper";

	@Override
	public void insert(BoardVO boardVO) {
		sqlsession.insert(namespace + ".insert", boardVO);
	}

	@Override
	public List<BoardVO> selectList(int categoryIdx) {
		return sqlsession.selectList(namespace + ".selectList", categoryIdx);
	}

	@Override
	public BoardVO select(int boardIdx) {
		return sqlsession.selectOne(namespace + ".select", boardIdx);
	}

	@Override
	public void update(BoardVO boardVO) {
		sqlsession.delete(namespace + ".update", boardVO);
	}

	@Override
	public void delete(int boardIdx) {
		sqlsession.update(namespace + ".delete", boardIdx);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) {
		return sqlsession.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) {
		return sqlsession.selectOne(namespace + ".countPaging", cri);
	}
	@Override
	public void updateReplyCnt(int boardIdx, int amount) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
	    paramMap.put("boardIdx", boardIdx);
	    paramMap.put("amount", amount);
	    
		sqlsession.update(namespace + ".updateReplyCnt", boardIdx);
	}
	@Override
	public void updateViewCnt(int boardIdx) {
		sqlsession.update(namespace + ".updateViewCnt", boardIdx);
	}
}
