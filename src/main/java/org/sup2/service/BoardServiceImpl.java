package org.sup2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.sup2.domain.BoardVO;
import org.sup2.domain.Criteria;
import org.sup2.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	BoardDAO dao;

	@Override
	public void regist(BoardVO vo) {
		dao.create(vo);
		
	}

	@Override
	public void modify(BoardVO vo) {
		dao.update(vo);
	}

	@Override
	public void remove(int bno) {
		dao.delete(bno);
		
	}

	@Override
	public List<BoardVO> listAll() {
		return dao.listAll();
	}
	
	@Override
	public BoardVO read(int bno) {
		return dao.read(bno);
	}

	@Override
	public List<BoardVO> listCri(Criteria cri) {
		return dao.listCri(cri);
	}

	@Override
	public int listCount() {
		return dao.listCount();
	}

	@Override
	public List<BoardVO> listSearch(Criteria cri) {
		return dao.listSearch(cri);
	}


	@Override
	public int listSearchCount(Criteria cri) {
		return dao.listSearchCount(cri);
	}

	@Override
	public void increment(int bno) {
		dao.increment(bno);
	}

}
