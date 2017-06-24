package org.sup2.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sup2.domain.Criteria;
import org.sup2.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{


	@Inject
	private SqlSession session;
	
	private String namespace = "org.sup2.mapper.ReplyMapper";
	
	
	@Override
	public List<ReplyVO> list(int bno) {
		return session.selectList(namespace + ".list" , bno);
	}

	@Override
	public void create(ReplyVO vo) {
		session.insert(namespace + ".create" , vo);
	}

	@Override
	public void update(ReplyVO vo) {
		session.update(namespace + ".update" , vo);
	}

	@Override
	public void delete(int rno) {
		session.delete(namespace + ".delete" , rno);
	}

	@Override
	public List<ReplyVO> listPage(int bno, Criteria cri) {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("cri", cri);
		return session.selectList(namespace + ".listPage" , map);
	}
	
	@Override
	public int replyCount(int bno) {
		return session.selectOne(namespace + ".replyCount" , bno);
	}



	

}
