package kh.finalproj.hollosekki.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;

import kh.finalproj.hollosekki.board.model.dao.BoardDAO;
import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.market.model.vo.Review;

@Service
public class BoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BoardDAO bDAO;
	
	public ArrayList<Board> freeBoardView(Board b, PageInfo pi) {
		return bDAO.freeBoardView(sqlSession, b, pi);
	}

	public int getFreeBoardListCount(int i) {
		return bDAO.getFreeBoardListCount(sqlSession, i);
	}

	public Board selectBoard(int bId, boolean yn) {
		int result = 0;
		if(yn) {
			result = bDAO.addCount(sqlSession, bId);
		}
		Board b = bDAO.selectBoard(sqlSession, bId);
		return b;
	}

	
	public void insertReply(Board b) {
		bDAO.insertReply(sqlSession, b);
	}

	public ArrayList<Board> selectReply(int bId) {
		return bDAO.selectReply(sqlSession, bId);
	}

	public int replyDelete(Board b) {
		return bDAO.replyDelete(sqlSession, b);
	}

	public int reReply(HashMap<String, Object> map) {
		return bDAO.reReply(sqlSession, map);
	}

	public int insertImage(Image image) {
		return bDAO.insertImage(sqlSession, image);
	}

	public int freeBoardWriting(HashMap<String, Object> map) {
		return bDAO.freeBoardWriting(sqlSession, map);
	}

	public Board firstSelectBoard(String login) {
		return bDAO.firstSelectBoard(sqlSession, login);
		
	}

	public int getCategoryFreeCount(HashMap<String, Object> map) {
		return bDAO.getCategoryFreeCount(sqlSession, map);
	}

	public ArrayList<Board> freeBList(PageInfo pi, HashMap<String, Object> map) {
		return bDAO.freeBList(sqlSession, pi, map);
	}

	public int reWriteBoard(HashMap<String, Object> map) {
		return bDAO.reWriteBoard(sqlSession, map);
	}



	public Board reWrieteBoardInfo(HashMap<String, Object> map) {
		return bDAO.reWrieteBoardInfo(sqlSession, map);
	}

	public int deleteBoard(HashMap<String, Object> map) {
		return bDAO.deleteBoard(sqlSession, map);
	}

	public int deleteReply(HashMap<String, Object> map) {
		return bDAO.deleteReply(sqlSession, map);
	}


}
