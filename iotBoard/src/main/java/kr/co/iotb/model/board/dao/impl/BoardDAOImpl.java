package kr.co.iotb.model.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.iotb.model.board.dao.BoardDAO;
import kr.co.iotb.model.board.dto.BoardVO;

@Repository(value="boardDAO")
public class BoardDAOImpl implements BoardDAO {
	
	//의존성 주입 -- mybatis를 위한 의존성 객체 주입
	@Autowired
	private SqlSession sqlSession;
	
	String namespace = "kr.co.iotb.model.board.dao.BoardDAO.";
			
	@Override
	public int getNewNum() {
		return sqlSession.selectOne(namespace + "getNewNum");
	}

	@Override
	public List<BoardVO> getArticles(BoardVO vo) {
		return sqlSession.selectList(namespace + "getArticles", vo);
	}

	@Override
	public int writePro(BoardVO vo) {
		return sqlSession.update(namespace + "writePro", vo);
	}

	@Override
	public int getAllCount() {
		return sqlSession.selectOne(namespace + "getAllCount");
	}

	@Override
	public BoardVO getArticle(BoardVO vo) {
		return sqlSession.selectOne(namespace + "getArticle", vo);
	}

	@Override
	public int updateReadCount(BoardVO vo) {	//조회수
		return sqlSession.update(namespace + "updateReadCount", vo);
	}

	@Override
	public int deletePro(BoardVO vo) {
		return sqlSession.delete(namespace + "deletePro", vo);
	}

	@Override
	public int updatePro(BoardVO vo) {
		return sqlSession.update(namespace + "updatePro", vo);
	}
}
