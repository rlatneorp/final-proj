package kh.finalproj.hollosekki.common.model.vo;

public class AdminBasic {
	private Integer page;
	private Integer pageCount;
	private String searchType;
	private String searchText;
	
	public AdminBasic() {}

	public AdminBasic(Integer page, Integer pageCount, String searchType, String searchText) {
		super();
		this.page = page;
		this.pageCount = pageCount;
		this.searchType = searchType;
		this.searchText = searchText;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	@Override
	public String toString() {
		return "AdminBasic [page=" + page + ", pageCount=" + pageCount + ", searchType=" + searchType + ", searchText="
				+ searchText + "]";
	}
	
}