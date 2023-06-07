package kh.finalproj.hollosekki.enroll.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.enroll.model.vo.Users;

@Repository
public class EnrollDAO {

	public int insertUser(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.insert("enrollMapper.insertUser", u);
	}

	public Users login(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.selectOne("enrollMapper.login", u);
	}

}