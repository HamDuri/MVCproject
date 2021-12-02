package kr.co.iotb.service.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.iotb.model.board.dao.BoardDAO;
import kr.co.iotb.model.board.dto.BoardVO;
import kr.co.iotb.model.board.dto.PageInfo;
import kr.co.iotb.model.board.dto.PageVO;
import kr.co.iotb.service.board.BoardService;

@Service(value="boardService")
public class BoardServiceImpl implements BoardService {
	//의존성 주입 dao
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public int getNewNum() {
		return boardDAO.getNewNum();
	}

	@Override
	public List<BoardVO> getArticles(BoardVO vo, PageVO pvo) {
		int startRow = (pvo.getCurrentPage()-1)*PageInfo.ROW_PER_PAGE+1;
		int endRow = startRow+PageInfo.ROW_PER_PAGE-1;
		vo.setStartRow(startRow);
		vo.setEndRow(endRow);
		return boardDAO.getArticles(vo);
	}

	@Override
	public int writePro(BoardVO vo) {
		return boardDAO.writePro(vo);
	}

	@Override
	public int getAllCount() {
		return boardDAO.getAllCount();
	}

	@Override
	public BoardVO getArticle(BoardVO vo) {
		BoardVO svo = new BoardVO();
		//조회수
		int r = boardDAO.updateReadCount(vo);
		if(r>0) {
			svo = boardDAO.getArticle(vo);
		}
		return svo;
	}

	@Override
	public int deletePro(BoardVO vo) {	//글삭제
		return boardDAO.deletePro(vo);
	}

	@Override
	public int updatePro(BoardVO vo) {	//글수정
		return  boardDAO.updatePro(vo);
	}

}
