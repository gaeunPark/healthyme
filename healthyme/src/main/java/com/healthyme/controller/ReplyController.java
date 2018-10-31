package com.healthyme.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.healthyme.domain.Criteria;
import com.healthyme.domain.PageMaker;
import com.healthyme.domain.ReplyVO;
import com.healthyme.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);

	@Inject
	private ReplyService service;
	
	@RequestMapping(value="", method = RequestMethod.POST)
	public ResponseEntity<String> insertReply(@RequestBody ReplyVO replyVO){
		logger.info("insert reply Post");
		replyVO.setBoardIdx(189);
		replyVO.setReplyer("admin");
		replyVO.setReplyText("aaa");
		ResponseEntity<String> entity = null;
		try {
			service.insertReply(replyVO);
			logger.info("insert OK");
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/all/{boardIdx}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("boardIdx") Integer boardIdx){
		
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>( HttpStatus.OK);
		} catch(Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{replyIdx}", method = RequestMethod.PUT)
	public ResponseEntity<String> updateReply(@PathVariable("replyIdx") Integer replyIdx, @RequestBody ReplyVO replyVO){
		
		ResponseEntity<String> entity = null;
		try {
			replyVO.setReplyIdx(replyIdx);
			service.updateReply(replyVO);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{replyIdx}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("replyIdx") Integer replyIdx){
		
		ResponseEntity<String> entity = null;
		try {
			service.deleteReply(replyIdx);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{boardIdx}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> replyPage(@PathVariable("boardIdx") Integer boardIdx,
			@PathVariable("page") Integer page){
		
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<ReplyVO> list = service.replyList(boardIdx, cri);
			
			map.put("list", list);
			
			int replyCount = service.countReply(boardIdx);
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch(Exception e) {
			logger.info("Error ...........");
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
