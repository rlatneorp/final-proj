package kh.finalproj.hollosekki.admin.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.Ingredient;

@Repository
public class AdminDAO {

	public int insertIngredient(SqlSessionTemplate sqlSession, Ingredient igd) {
		return sqlSession.insert("adminMapper.insertIngredient", igd);
	}

}
