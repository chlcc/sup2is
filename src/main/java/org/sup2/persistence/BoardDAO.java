package org.sup2.persistence;

import java.util.List;

import org.sup2.domain.BoardVO;
import org.sup2.domain.Criteria;

public interface BoardDAO {

	
	public void create(BoardVO vo);
	public void update(BoardVO vo);
	public void delete(int bno);
	public List<BoardVO> listAll();
	public BoardVO read(int bno);
	public List<BoardVO> listCri(Criteria cri);
	public int listCount();
	public List<BoardVO> listSearch(Criteria cri);
	public int listSearchCount(Criteria cri);
	public void increment(int bno);
}
