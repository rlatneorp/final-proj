package kh.finalproj.hollosekki.users.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.enroll.model.vo.Users;

@Repository
public class UsersDAO {

	public int updatePwd(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("usersMapper.updatePwd", map);
	}

	public int updateInfo(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.update("usersMapper.updateInfo", u);
	}

	public int insertImage(SqlSessionTemplate sqlSession, Image image) {
		return sqlSession.insert("usersMapper.insertImage", image);
	}

	public int updateProfile(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.update("usersMapper.updateProfile", u);
	}

	public Image selectImage(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.selectImage", usersNo);
	}

	public int deleteImage(SqlSessionTemplate sqlSession, Image existingImage) {
		return sqlSession.delete("usersMapper.deleteImage", existingImage);
	}

	public int deleteImage(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.delete("usersMapper.deleteImagebase", usersNo);
	}

	public Users selectInfo(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.selectOne("usersMapper.selectInfo", u);
	}

}
