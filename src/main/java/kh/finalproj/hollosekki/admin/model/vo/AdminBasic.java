package kh.finalproj.hollosekki.admin.model.vo;

public class AdminBasic {
	private Integer page;
	private Integer pageCount;
	private String searchType;
	private String searchText;
	private int type;
	private int kind;
	
	public AdminBasic() {}

	public AdminBasic(Integer page, Integer pageCount, String searchType, String searchText, int type, int kind) {
		super();
		this.page = page;
		this.pageCount = pageCount;
		this.searchType = searchType;
		this.searchText = searchText;
		this.type = type;
		this.kind = kind;
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	@Override
	public String toString() {
		return "AdminBasic [page=" + page + ", pageCount=" + pageCount + ", searchType=" + searchType + ", searchText="
				+ searchText + ", type=" + type + ", kind=" + kind + "]";
	}
	
}