package com.healthyme.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.healthyme.dao.BoardDAO;
import com.healthyme.domain.BoardVO;
import com.healthyme.domain.Criteria;

@Service
public class BoardService {
	
	@Inject
	private BoardDAO dao;
	
	public void insert(BoardVO boardVO) throws Exception{
		dao.insert(boardVO);
	}
	public List<BoardVO> selectList(int categoryIdx) throws Exception{
		return dao.selectList(categoryIdx);
	}
	public BoardVO select(int boardIdx) throws Exception{
		return dao.select(boardIdx);
	}
	public void update(BoardVO boardVO) throws Exception{
		dao.update(boardVO);
	}
	public void delete(int boardIdx) throws Exception{
		dao.delete(boardIdx);
	}
	public List<BoardVO> listCriteria(Criteria cri) throws Exception{
		return dao.listCriteria(cri);
	}
	public int countPaging(Criteria cri) throws Exception{
		return dao.countPaging(cri);
	}
}
