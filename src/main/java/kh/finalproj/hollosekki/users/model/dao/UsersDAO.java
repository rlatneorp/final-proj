package kh.finalproj.hollosekki.users.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.Follow;
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

	public int deleteInfo(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.update("usersMapper.deleteInfo", usersNo);
	}

//	public ArrayList<Follow> selectFollowing(SqlSessionTemplate sqlSession, int usersNo) {
//		return (ArrayList)sqlSession.selectList("usersMapper.selectFollowing", usersNo);
//	}
//
//	public ArrayList<Follow> selectFollower(SqlSessionTemplate sqlSession, int usersNo) {
//		return (ArrayList)sqlSession.selectList("usersMapper.selectFollower", usersNo);
//	}
//
//	public Users selectFollowInfo(SqlSessionTemplate sqlSession, int followNo) {
//		return sqlSession.selectOne("usersMapper.selectFollowInfo", followNo);
//	}
//
//	public Image selectFollowImage(SqlSessionTemplate sqlSession, int followNo) {
//		return sqlSession.selectOne("usersMapper.selectFollowImage", followNo);
//	}

	public ArrayList<HashMap<String, Object>> selectFollowing(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("usersMapper.selectFollowing", usersNo);
	}

	public ArrayList<HashMap<String, Object>> selectFollower(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("usersMapper.selectFollower", usersNo);
	}

//	public ArrayList<Follow> selectMutualFollow(SqlSessionTemplate sqlSession, int followingNo) {
//		return (ArrayList)sqlSession.selectList("usersMapper.selectMutualFollow", followingNo);
//	}

//	public boolean checkMutualFollow(SqlSessionTemplate sqlSession, int usersNo, String[] followerNos) {
//		Map<String, Object> map = new HashMap<>();
//	    map.put("usersNo", usersNo);
//	    map.put("followerNos", followerNos);
//		return sqlSession.selectOne("usersMapper.checkMutualFollow", map);
//	}

}
