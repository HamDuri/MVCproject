package kr.co.iotb.model.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.iotb.model.board.dto.BoardVO;

@Mapper
public interface BoardDAO {

	int getNewNum();

	List<BoardVO> getArticles(BoardVO vo);

	int writePro(BoardVO vo);

	int getAllCount();

	BoardVO getArticle(BoardVO vo);

	int updateReadCount(BoardVO vo);

	int deletePro(BoardVO vo);

	int updatePro(BoardVO vo);

}
