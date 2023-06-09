package kh.finalproj.hollosekki.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.AdminBasic;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Product;

@Repository
public class AdminDAO {
	
	public int getIngredientCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getIngredientCount", ab);
	}

	public ArrayList<Ingredient> selectIngredientList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectIngredientList", ab, rowBounds);
	}

	public Product selectProduct(SqlSessionTemplate sqlSession, int pNo) {
		return sqlSession.selectOne("adminMapper.selectProduct", pNo);
	}
	public Ingredient selectIngredient(SqlSessionTemplate sqlSession, int igdNo) {
		return sqlSession.selectOne("adminMapper.selectIngredient", igdNo);
	}

	public int updateIngredient(SqlSessionTemplate sqlSession, Ingredient igd) {
		return sqlSession.update("adminMapper.updateIngredient", igd);
	}

	public int updateProduct(SqlSessionTemplate sqlSession, Product pd) {
		return sqlSession.update("adminMapper.updateProduct", pd);
	}

	public int insertProduct(SqlSessionTemplate sqlSession, Product pd) {
		return sqlSession.insert("adminMapper.insertProduct", pd);
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

	public Image selectImage(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("adminMapper.selectImage", map);
	}

	public int deleteImage(SqlSessionTemplate sqlSession, Image img) {
		return sqlSession.delete("adminMapper.deleteImage", img);
	}

	public int getNowProductNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getNowProductNo");
	}

	public int ingredientUpdateIsAccept(SqlSessionTemplate sqlSession, Ingredient igd) {
		return sqlSession.update("adminMapper.ingredientUpdateIsAccept", igd);
	}

	public int updateStatus(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("adminMapper.updateStatus", map);
	}





	
}
