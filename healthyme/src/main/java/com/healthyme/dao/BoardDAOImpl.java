package com.healthyme.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.healthyme.domain.NutritionVO;
import com.healthyme.domain.UserDietVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession sqlsession;
	private static final String namespace = "com.healthyme.mapper.boardMapper";
	
	
}
