package kh.finalproj.hollosekki.recipe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecipeController {

	
	@RequestMapping("recipeList.rc")
	public String recipeList() {
		return "recipeList";
	}
	
	@RequestMapping("recipeDetail.rc")
	public String recipeDetail() {
		return "recipeDetail";
	}
	
	@RequestMapping("recipeDetailWriter.rc")
	public String recipeDetailWriter() {
		return "recipeDetailWriter";
	}
