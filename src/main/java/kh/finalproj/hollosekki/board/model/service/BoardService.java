package kh.finalproj.hollosekki.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.board.model.dao.BoardDAO;
import kh.finalproj.hollosekki.board.model.vo.Board;
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

}
