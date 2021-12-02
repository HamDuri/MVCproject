package kr.co.iotb.service.board;

import java.util.List;

import kr.co.iotb.model.board.dto.BoardVO;
import kr.co.iotb.model.board.dto.PageVO;

public interface BoardService {
	int getNewNum();

	List<BoardVO> getArticles(BoardVO vo, PageVO pvo);

	int writePro(BoardVO vo);

	int getAllCount();

	BoardVO getArticle(BoardVO vo);

	int deletePro(BoardVO vo);

	int updatePro(BoardVO vo);

}
