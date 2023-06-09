package kh.finalproj.hollosekki.users.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.enroll.model.vo.Users;

@Repository
public class UsersDAO {

	public int updatePwd(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("usersMapper.updatePwd", map);
	}

	public int updateInfo(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.update("usersMapper.updateInfo", u);
	}

}
