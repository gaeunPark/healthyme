package com.healthyme.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.healthyme.domain.BoardVO;
import com.healthyme.domain.Criteria;
import com.healthyme.domain.PageMaker;
import com.healthyme.service.BoardService;

@Controller
@RequestMapping("/community/*")
public class CommunityController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);
	@Inject
	private BoardService boardService;
	
	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public void community(@ModelAttribute Criteria cri, Model model) throws Exception {
		logger.info("community.....");
		
		model.addAttribute("boardVOs", boardService.listCriteria(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardService.countPaging(cri));
		model.addAttribute("pageMaker", pageMaker);	
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void createGet(@RequestParam("categoryIdx") int categoryIdx) throws Exception {
		logger.info("createGet.....");
	}
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPost(@ModelAttribute BoardVO boardVO, RedirectAttributes rttr) throws Exception {
		logger.info("createPost.....");
		boardService.insert(boardVO);
		rttr.addAttribute("categoryIdx", boardVO.getCategoryIdx());
		return "redirect:/community/community";
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam int boardIdx, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("read");
		model.addAttribute("boardVO", boardService.select(boardIdx));
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@ModelAttribute("cri") Criteria cri, @RequestParam int boardIdx, RedirectAttributes rttr) throws Exception {
		logger.info("remove");
		boardService.delete(boardIdx);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("categoryIdx", cri.getCategoryIdx());
		
		return "redirect:/community/community";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGet(@RequestParam int boardIdx, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("modifyGet");
		model.addAttribute("boardVO", boardService.select(boardIdx));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPost(@ModelAttribute BoardVO boardVO, RedirectAttributes rttr, Criteria cri) throws Exception {
		logger.info("modifyPost");
		boardService.update(boardVO);
		
		System.out.println(cri);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("categoryIdx", cri.getCategoryIdx());	
		return "redirect:/community/community";
	}
	
	


}
