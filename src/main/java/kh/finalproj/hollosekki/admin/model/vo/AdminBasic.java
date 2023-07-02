package kh.finalproj.hollosekki.admin.model.vo;

public class AdminBasic {
	private Integer page;
	private Integer pageCount;
	private String searchType;
	private String searchText;
	private int type;
	private Integer kind;
	private String duplication;
	private Integer number;
//	           	  type		kind
//  <리뷰>
//	레시피후기 	:			0    
//	게시판댓글		: 			-1   
//	상품후기		: 1~4		1	
	
	public AdminBasic() {}

	public AdminBasic(Integer page, Integer pageCount, String searchType, String searchText, int type, Integer kind,
			String duplication, Integer number) {
		super();
		this.page = page;
		this.pageCount = pageCount;
		this.searchType = searchType;
		this.searchText = searchText;
		this.type = type;
		this.kind = kind;
		this.duplication = duplication;
		this.number = number;
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

	public Integer getKind() {
		return kind;
	}

	public void setKind(Integer kind) {
		this.kind = kind;
	}

	public String getDuplication() {
		return duplication;
	}

	public void setDuplication(String duplication) {
		this.duplication = duplication;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	@Override
	public String toString() {
		return "AdminBasic [page=" + page + ", pageCount=" + pageCount + ", searchType=" + searchType + ", searchText="
				+ searchText + ", type=" + type + ", kind=" + kind + ", duplication=" + duplication + ", number="
				+ number + "]";
	}
		
}