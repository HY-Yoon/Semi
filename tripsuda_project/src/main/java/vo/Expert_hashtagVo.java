package vo;

public class Expert_hashtagVo {
	private int hashnum,anum;
	String tag ;
	public Expert_hashtagVo(int hashnum, int anum, String tag) {
		super();
		this.hashnum = hashnum;
		this.anum = anum;
		this.tag = tag;
	}
	public int getHashnum() {
		return hashnum;
	}
	public void setHashnum(int hashnum) {
		this.hashnum = hashnum;
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
