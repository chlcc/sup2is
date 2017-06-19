package org.sup2.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.sup2.domain.BoardVO;
import org.sup2.domain.Criteria;
import org.sup2.domain.PageMaker;
import org.sup2.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDAOTest {

	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
	
	
	@Inject
	private BoardDAO dao;
	
	
	@Test
	public void create() {
		BoardVO vo = new BoardVO();
		vo.setTitle("연습");
		vo.setContent("연습");
		vo.setWriter("연습");
		logger.info(vo.toString());
		dao.create(vo);
		
	}
	@Test
	public void update() {
		BoardVO vo = new BoardVO();
		vo.setBno(11);
		vo.setContent("수정");
		vo.setTitle("수정");
		vo.setWriter("수정");
		dao.update(vo);
	}
	@Test
	public void listAll() {
		logger.info(dao.listAll().toString());
	}
	
	@Test
	public void read() {
		logger.info(dao.read(3).toString());
	}
	
	@Test
	public void delete() {
		dao.delete(15);
	}
	
	@Test
	public void listCri() {
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		logger.info(dao.listCri(cri).toString());
	}
	
	@Test
	public void listPage() {
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(10);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(50);

		logger.info(dao.listCri(cri).toString());
		
	}
	@Test
	public void listCtount() {
		logger.info(dao.listCount() +"");
	}
	
	@Test
	public void pageTest() {
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.listCount());
		
		logger.info(pageMaker.getStartPage() + ": startPage");
		logger.info(pageMaker.getEndPage() + ": getEndPage");
		logger.info(pageMaker.isNext() + ": isNext");
		logger.info(pageMaker.isPrev() + ": isPrev");
		logger.info(pageMaker.getTotalCount() + ": getTotalCount");
		
	}
	
	@Test
	public void listSearch(){
		Criteria cri = new Criteria();
		cri.setKeyword("수정");
		cri.setSearchType("t");
		cri.setPage(1);
		cri.setPerPageNum(10);
		logger.info(dao.listSearch(cri) + "");
		logger.info(dao.listSearchCount(cri) + "");
	}
	
	
}
