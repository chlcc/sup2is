package org.sup2.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.sup2.domain.Criteria;
import org.sup2.domain.ReplyVO;
import org.sup2.persistence.ReplyDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ReplyDAOTest {

	private Logger logger = LoggerFactory.getLogger(ReplyDAOTest.class);
	
	@Inject
	private ReplyDAO dao;
	
	
	@Test
	public void create() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(2);
		vo.setReplyer("연습댓글");
		vo.setReplytext("연습댓글");
		dao.create(vo);
	}
	@Test
	public void list() {
//		logger.info(dao.list(2).toString());
		
	}
	
	@Test
	public void update() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(2);
		vo.setReplytext("댓글 수정");
		dao.update(vo);
	}
	
	@Test
	public void replyCount() {
		logger.info(dao.replyCount(3) + "");
	}
	@Test
	public void listPage() {
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(1);
		logger.info(dao.listPage(2, cri).toString());
		
	}
	
}
