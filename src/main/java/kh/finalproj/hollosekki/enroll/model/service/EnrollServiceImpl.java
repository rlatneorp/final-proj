package kh.finalproj.hollosekki.enroll.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.enroll.model.dao.EnrollDAO;
import kh.finalproj.hollosekki.enroll.model.vo.SocialLogin;
import kh.finalproj.hollosekki.enroll.model.vo.Users;

@Service
public class EnrollServiceImpl implements EnrollService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EnrollDAO eDAO;

	@Override
	public int insertUser(Users u) {
		return eDAO.insertUser(sqlSession, u);
	}

	@Override
	public Users login(Users u) {
		return eDAO.login(sqlSession, u);
	}

	@Override
	public int checkId(String id) {
		return eDAO.checkId(sqlSession, id);
	}

	@Override
	public int checkNickName(String nickName) {
		return eDAO.checkNickName(sqlSession, nickName);
	}

	@Override
	public int checkEmail(String email) {
		return eDAO.checkEmail(sqlSession, email);
	}
	
	@Override
	public Users findIdResult(String name, String email) {
		return eDAO.findIdResult(sqlSession, name, email);
	}

	@Override
	public int findPwdCheck(String id, String email) {
		return eDAO.findPwdCheck(sqlSession, id, email);
	}

	@Override
	public int updatePwdResult(String id, String usersPwd) {
		return eDAO.updatePwdResult(sqlSession, id, usersPwd);
	}

	@Override
	public SocialLogin SocialLogin(String id) {
		return eDAO.socialLogin(sqlSession, id);
	}

	@Override
	public int socialInsertUser(SocialLogin sl2) {
		return eDAO.socialInsertUser(sqlSession, sl2);
	}

	@Override
	public Users socialLoginUpdate(String id) {
		return eDAO.socialLoginUpdate(sqlSession, id);
	}

	@Override
	public void socialInfoUpdate(String id, String profileImg) {
		eDAO.socialInfoUpdate(sqlSession, id, profileImg);
	}

	@Override
	public void socialInfoUpdate2(String id, String name) {
		eDAO.socialInfoUpdate2(sqlSession, id, name);
	}

	
}
