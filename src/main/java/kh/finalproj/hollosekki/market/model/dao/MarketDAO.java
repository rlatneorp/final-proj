package kh.finalproj.hollosekki.market.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class MarketDAO {

	public int attendanceCheck(SqlSessionTemplate sqlSession, String attendanceDate) {
		return sqlSession.update("marketMapper.attendanceCheck", attendanceDate);
	}

	public int checkDay(SqlSessionTemplate sqlSession, int checkDay) {
		return sqlSession.update("marketMapper.checkDay", checkDay);
	}

	public int aDateCheck(SqlSessionTemplate sqlSession, String attendanceDate) {
		return sqlSession.selectOne("marketMapper.aDateCheck", attendanceDate);
	}

	public int attendanceDay(SqlSessionTemplate sqlSession, String ddattendanceDay) {
		return sqlSession.update("marketMapper.attendanceDay", ddattendanceDay);
	}


}
