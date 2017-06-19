package org.sup2.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.sup2.domain.BoardVO;
import org.sup2.domain.Criteria;
import org.sup2.domain.PageMaker;
import org.sup2.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject BoardService service;
/*	
	@RequestMapping(value = "listAll" , method = RequestMethod.GET)
	public void board(Model model) {
		logger.info("listAll...");
		
		model.addAttribute("list", service.listAll());
	}*/
	
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void registGET() {
		logger.info("regist GET...");
		
	}
	@RequestMapping(value ="regist" , method =RequestMethod.POST)
	public String registPOST(BoardVO vo , Model model) {
		logger.info("regist POST...");
		service.regist(vo);
		logger.info("insert VO...");
		return "redirect:list";
	}
	@RequestMapping(value ="read" , method = RequestMethod.GET)
	public void read(@RequestParam("bno") int bno , Model model , @ModelAttribute("cri") Criteria cri) {
		logger.info("read ...");
		service.increment(bno);
		model.addAttribute("vo" , service.read(bno));
		
		
	}
	@RequestMapping(value = "modify" , method = RequestMethod.GET)
	public void modifyGET (Model model , @RequestParam("bno")int bno , @ModelAttribute("cri") Criteria cri) {
		
		logger.info("modify GET...");
		model.addAttribute("vo" , service.read(bno));
		
	}
	@RequestMapping(value = "modify" , method = RequestMethod.POST)
	public String modifyPOST (Model model , BoardVO vo , Criteria cri) {
		
		logger.info("modify POST...");
		System.out.println(vo.toString());
		model.addAttribute("page" , cri.getPage());
		model.addAttribute("perPageNum" , cri.getPerPageNum());
		model.addAttribute("keyword" , cri.getKeyword());
		model.addAttribute("searchType" , cri.getSearchType());
		
		service.modify(vo);
		return "redirect:list";
	}
	@RequestMapping(value = "delete" , method = RequestMethod.POST)
	public String delete(@RequestParam("bno") int bno , Criteria cri , Model model) {

		logger.info("delete ...");

		model.addAttribute("page" , cri.getPage());
		model.addAttribute("perPageNum" , cri.getPerPageNum());
		model.addAttribute("keyword" , cri.getKeyword());
		model.addAttribute("searchType" , cri.getSearchType());
		
		service.remove(bno);
		return "redirect:list";
		
	}
	
	@RequestMapping(value = "listCri" , method = RequestMethod.GET)
	public void listCri(Model model , Criteria cri) {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(service.listCount());
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("cri", cri);
//		model.addAttribute("list", service.listCri(cri));
		model.addAttribute("list", service.listSearch(cri));
		
		model.addAttribute("pageMaker" , pageMaker);
		
	}
	@RequestMapping(value = "list" , method = RequestMethod.GET)
	public void list(Model model , Criteria cri) {
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("list", service.listSearch(cri));
		
		model.addAttribute("pageMaker" , pageMaker);
		
	}
	
	
}
