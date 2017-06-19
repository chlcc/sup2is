package org.sup2.service;

import java.util.List;

import org.sup2.domain.BoardVO;
import org.sup2.domain.Criteria;

public interface BoardService {

	
	public void regist(BoardVO vo);
	public void modify(BoardVO vo);
	public void remove(int bno);
	public List<BoardVO> listAll();
	public BoardVO read(int bno);
	public List<BoardVO> listCri(Criteria cri);
	public int listCount();
	public List<BoardVO> listSearch(Criteria cri);
	public int listSearchCount(Criteria cri);
	public void increment(int bno);
}
