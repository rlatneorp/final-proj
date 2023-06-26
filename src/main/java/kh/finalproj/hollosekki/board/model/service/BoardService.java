package kh.finalproj.hollosekki.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.board.model.dao.BoardDAO;
import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;

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

}
