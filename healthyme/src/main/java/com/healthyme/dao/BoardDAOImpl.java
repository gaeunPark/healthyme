package com.healthyme.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.healthyme.domain.BoardVO;
import com.healthyme.domain.Criteria;
import com.healthyme.domain.NutritionVO;
import com.healthyme.domain.UserDietVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlsession;
	private static final String namespace = "com.healthyme.mapper.boardMapper";

	public void insert(BoardVO boardVO) {
		sqlsession.insert(namespace + ".insert", boardVO);
	}
	public List<BoardVO> selectList(int categoryIdx) {
		return sqlsession.selectList(namespace + ".selectList", categoryIdx);
	}
	public BoardVO select(int boardIdx) {
		return sqlsession.selectOne(namespace + ".select", boardIdx);
	}
	public void update(BoardVO boardVO) {
		sqlsession.delete(namespace + ".update", boardVO);
	}
	public void delete(int boardIdx) {
		sqlsession.update(namespace + ".delete", boardIdx);
	}
	public List<BoardVO> listCriteria(Criteria cri){
		return sqlsession.selectList(namespace + ".listCriteria", cri);
	}
	public int countPaging(Criteria cri) {
		return sqlsession.selectOne(namespace + ".countPaging", cri);
	}
}
