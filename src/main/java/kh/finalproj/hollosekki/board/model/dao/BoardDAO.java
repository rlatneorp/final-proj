package kh.finalproj.hollosekki.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonObject;

import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.market.model.vo.Review;

@Repository
public class BoardDAO {

	public ArrayList<Board> freeBoardView(SqlSessionTemplate sqlSession, Board b, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1 ) * pi.getBoardLimit(), pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.freeBoardView", b, rowBounds);
	}

	public int getFreeBoardListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("boardMapper.getFreeBoardListCount", i);
	}

	public int addCount(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("boardMapper.addCount", bId);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.selectBoard", bId);
	}

	public void insertReply(SqlSessionTemplate sqlSession, Board b) {
		sqlSession.insert("boardMapper.insertReply", b);
	}

	public ArrayList<Board> selectReply(SqlSessionTemplate sqlSession, int bId) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReply",bId);
	}

	public int replyDelete(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.replyDelete", b);
	}

	public int reReply(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("boardMapper.reReply", map);
	}

	public int insertImage(SqlSessionTemplate sqlSession, Image image) {
		return sqlSession.insert("boardMapper.insertImage", image);
	}

	public int freeBoardWriting(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("boardMapper.freeBoardWriting", map);
	}

	public Board firstSelectBoard(SqlSessionTemplate sqlSession, String login) {
		return sqlSession.selectOne("boardMapper.firstSelecteBoard", login);
	}

	public int getCategoryFreeCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("boardMapper.getCategoryFreeCount", map);
	}

	public ArrayList<Board> freeBList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1 ) * pi.getBoardLimit(), pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.freeBList", map, rowBounds);
	}

	
}
