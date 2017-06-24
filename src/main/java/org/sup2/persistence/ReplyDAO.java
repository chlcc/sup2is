package org.sup2.persistence;

import java.util.List;

import org.sup2.domain.Criteria;
import org.sup2.domain.ReplyVO;

public interface ReplyDAO {

	public List<ReplyVO> list(int bno);
	public void create(ReplyVO vo);
	public void update(ReplyVO vo);
	public void delete(int rno);
	
	public List<ReplyVO> listPage(int bno, Criteria cri);
	public int replyCount(int bno);
	
	
}
