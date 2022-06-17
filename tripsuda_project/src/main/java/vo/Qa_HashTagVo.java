package vo;

public class Qa_HashTagVo {
	private int hnum;
	private int anum;
	private String htag;
	public Qa_HashTagVo() {}
	public Qa_HashTagVo(int hnum, int anum, String htag) {
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
