package org.sup2.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.sup2.domain.BoardVO;
import org.sup2.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession session;
	
	private String namespace = "org.sup2.mapper.BoardMapper";
	
	@Override
	public void create(BoardVO vo) {
		session.insert(namespace + ".create" , vo);
	}

	@Override
	public void update(BoardVO vo) {
		session.update(namespace + ".update" , vo);
	}

	@Override
	public void delete(int bno) {
		session.delete(namespace + ".delete" ,bno);
	}

	@Override
	public List<BoardVO> listAll() {
		return session.selectList(namespace + ".listAll");
	}

	@Override
	public BoardVO read(int bno) {
		return session.selectOne(namespace + ".read" , bno);
		
	}

	@Override
	public List<BoardVO> listCri(Criteria cri) {
		return session.selectList(namespace + ".listCri" , cri);
	}

	@Override
	public int listCount() {
		return session.selectOne(namespace + ".listCount");
	}

	@Override
	public List<BoardVO> listSearch(Criteria cri) {

		return session.selectList(namespace + ".listSearch" , cri);
	}

	@Override
	public int listSearchCount(Criteria cri) {
		return session.selectOne(namespace + ".listSearchCount" , cri);
	}

	@Override
	public void increment(int bno) {
		session.update(namespace + ".increment" , bno);
	}

	
	
}
