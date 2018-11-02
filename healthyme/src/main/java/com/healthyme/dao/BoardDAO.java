package com.healthyme.dao;

import java.util.List;

import com.healthyme.domain.BoardVO;
import com.healthyme.domain.Criteria;

public interface BoardDAO {
	public void insert(BoardVO boardVO);
	
	public List<BoardVO> selectList(int categoryIdx);
	
	public BoardVO select(int boardIdx);
	
	public void update(BoardVO boardVO);
	
	public void delete(int boardIdx);
	
	public List<BoardVO> listCriteria(Criteria cri);
	
	public int countPaging(Criteria cri);
	
	public void updateReplyCnt(int boardIdx, int amount);
	
	public void updateViewCnt(int boardIdx);
}
