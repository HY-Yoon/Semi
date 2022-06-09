package vo;

public class TagListVo {
	private int tnum;
	private int anum;
	private String tag;
	public TagListVo() {}
	public TagListVo(int tnum, int anum, String tag) {
		super();
		this.tnum = tnum;
		this.anum = anum;
		this.tag = tag;
	}
	public int getTnum() {
		return tnum;
	}
	public void setTnum(int tnum) {
		this.tnum = tnum;
	}
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
}
