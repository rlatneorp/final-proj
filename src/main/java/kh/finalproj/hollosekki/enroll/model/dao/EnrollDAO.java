package kh.finalproj.hollosekki.enroll.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.enroll.model.vo.SocialLogin;
import kh.finalproj.hollosekki.enroll.model.vo.Users;

@Repository
public class EnrollDAO {

	public int insertUser(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.insert("enrollMapper.insertUser", u);
	}

	public Users login(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.selectOne("enrollMapper.login", u);
	}

	public int checkId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("enrollMapper.checkId", id);
	}

	public int checkNickName(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("enrollMapper.checkNickName", nickName);
	}

	public Users findIdResult(SqlSessionTemplate sqlSession, String name, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("email", email);
		return sqlSession.selectOne("enrollMapper.findIdResult", map);
	}

	public int findPwdCheck(SqlSessionTemplate sqlSession, String id, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("email", email);
		return sqlSession.selectOne("enrollMapper.findPwdCheck", map);
	}

	public int updatePwdResult(SqlSessionTemplate sqlSession, String id, String usersPwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("usersPwd", usersPwd);
		return sqlSession.update("enrollMapper.updatePwdResult", map);
	}
	
	

	public int checkEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("enrollMapper.checkEmail", email);
	}

	public SocialLogin socialLogin(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("enrollMapper.socialLogin", id);
	}

	public int socialInsertUser(SqlSessionTemplate sqlSession, SocialLogin sl2) {
		return sqlSession.insert("enrollMapper.socialInsertUser", sl2);
	}

	public Users socialLoginUpdate(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("enrollMapper.socialLoginUpdate", id);
	}

}
