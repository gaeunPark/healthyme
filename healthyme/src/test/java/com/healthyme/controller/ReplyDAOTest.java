package com.healthyme.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.healthyme.dao.ReplyDAO;
import com.healthyme.domain.Criteria;
import com.healthyme.domain.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })

public class ReplyDAOTest {

	@Inject
	private ReplyDAO dao;

//    @Test
	public void testInsertReply() throws Exception {
		ReplyVO replyVO = new ReplyVO();
		replyVO.setBoardIdx(189);
		replyVO.setReplyer("admin");
		replyVO.setReplyText("aaa");

		dao.insertReply(replyVO);
	}
    
    @Test
   	public void testListReply() throws Exception {
    	Criteria cri = new Criteria();
    	cri.setPage(1);
    	List<ReplyVO> list = dao.replyList(189, cri);
   		System.out.println(list);
   	}
	

}
