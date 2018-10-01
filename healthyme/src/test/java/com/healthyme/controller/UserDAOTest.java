package com.healthyme.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.healthyme.domain.UserVO;
import com.healthyme.persistence.UserDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})

public class UserDAOTest {
	
	@Inject
	private UserDAO dao;
	
	@Test
	public void testTime()throws Exception{		
		System.out.println("getTime() = " + dao.getTime());
		
	}
	
    @Test
    public void testInsertUser() throws Exception {
        
    	UserVO userVO = new UserVO();
    	userVO.setUserid("user_id05");
    	userVO.setUserpw("user_pw02");
    	userVO.setUsername("USER02");
    	userVO.setEmail("user02@joy.org");
		
    	dao.insertUser(userVO);
    	

    }

}
