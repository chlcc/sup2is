package org.sup2.service;

import java.util.List;

import org.sup2.domain.Criteria;
import org.sup2.domain.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> list(int bno);
	public void addReply(ReplyVO vo);
	public void modifyReply(ReplyVO vo);
	public void removeRelpy(int rno);
	
	public List<ReplyVO> list (int bno , Criteria cri);
	public int replyCount(int bno);
	
	
}
