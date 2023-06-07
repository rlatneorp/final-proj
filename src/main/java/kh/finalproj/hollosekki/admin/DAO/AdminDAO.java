package kh.finalproj.hollosekki.admin.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;

@Repository
public class AdminDAO {
	
	public int insertProduct(SqlSessionTemplate sqlSession, Ingredient igd) {
		return sqlSession.insert("adminMapper.insertProduct", igd);
	}
	
	public int insertIngredient(SqlSessionTemplate sqlSession, Ingredient igd) {
		return sqlSession.insert("adminMapper.insertIngredient", igd);
	}

	public int getNowIngredientNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getNowIngredientNo");
	}

	public int insertImage(SqlSessionTemplate sqlSession, Image image) {
		return sqlSession.insert("adminMapper.insertImage", image);
	}


	
}
