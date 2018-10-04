package com.healthyme.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.healthyme.domain.UserVO;

/*
 * ...135, 374, 468p.
 * @Repository는 DAO를 스프링에 인식시키기 위해서 주로 사용함.
 * 스프링빈으로 인식시키기 위해 root-context.xml::component-scan base-package 속성을 이용해서 
 * 등록해야함.
 * root-context.xml에서 context:component-scan base-package의 속성값이 정확해야
 * root-context.xml의 BeansGraph에 BoardDaoImpl이 나타남. 
 * http://www.mybatis.org/mybatis-3/ko/java-api.html
 * SqlSessions 참조.
    <T> T selectOne(String statement, Object parameter)
	<E> List<E> selectList(String statement, Object parameter)
	<K,V> Map<K,V> selectMap(String statement, Object parameter, String mapKey)
	int insert(String statement, Object parameter)
	int update(String statement, Object parameter)
	int delete(String statement, Object parameter)
 */
@Repository
public class UserDAOImpl implements UserDAO {

	//...root-context.xml의 org.mybatis.spring.SqlSessionTemplate을 주입받아 사용함.
	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.healthyme.mapper.UserMapper";
	
	@Override
	public String getTime() {
		return sqlSession.selectOne(namespace+".getTime");
	}

	@Override
	public void insertUser(UserVO userVO) {
		sqlSession.insert(namespace+".insertUser", userVO);
	}
	
//	@Override
//	public MemberVO selectMember(String user_id) throws Exception {
//		return (MemberVO) sqlSession.selectOne(namespace+".selectMember", user_id);
//	}
//
//	@Override
//	public MemberVO selectWithPw(String user_id, String user_pw) throws Exception {
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//		
//		paramMap.put("user_id", user_id);
//		paramMap.put("user_pw", user_pw);
//		
//		return sqlSession.selectOne(namespace+".selectWithPw", paramMap);
//	}

}