package vo.reviewboard;

/**
* Create : 윤혜인
* Create Date : 2022-06-17
* Last Update : 2022-06-17
* Modify : 윤혜인
* 여행후기 게시판 해시태그 Vo
*/
public class ReviewTagVo {
	private int hnum; //해시태그 번호
	private int anum; //글 번호
	private String htag; //태그
	
	public ReviewTagVo() {}

	public ReviewTagVo(int hnum, int anum, String htag) {
		super();
		this.hnum = hnum;
		this.anum = anum;
		this.htag = htag;
	}

	public int getHnum() {
		return hnum;
	}

	public void setHnum(int hnum) {
		this.hnum = hnum;
	}

	public int getAnum() {
		return anum;
	}

	public void setAnum(int anum) {
		this.anum = anum;
	}

	public String getHtag() {
		return htag;
	}

	public void setHtag(String htag) {
		this.htag = htag;
	}
	
	
	
	
	
}
