package org.sup2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.sup2.domain.Criteria;
import org.sup2.domain.ReplyVO;
import org.sup2.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> list(int bno) {
		return dao.list(bno);
	}

	@Override
	public void addReply(ReplyVO vo) {
		dao.create(vo);
	}

	@Override
	public void modifyReply(ReplyVO vo) {
		dao.update(vo);
	}

	@Override
	public void removeRelpy(int rno) {
		dao.delete(rno);
	}

	@Override
	public List<ReplyVO> list(int bno, Criteria cri) {
		return dao.listPage(bno, cri);
	}

	@Override
	public int replyCount(int bno) {
		return dao.replyCount(bno);
	}

	
}
