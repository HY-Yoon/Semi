package vo;

public class Qa_LocalTagVo {
	private int tnum;
	private int anum;
	private String ltag;
	public Qa_LocalTagVo() {}
	public Qa_LocalTagVo(int tnum, int anum, String ltag) {
		super();
		this.tnum = tnum;
		this.anum = anum;
		this.ltag = ltag;
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
	public String getLtag() {
		return ltag;
	}
	public void setLtag(String ltag) {
		this.ltag = ltag;
	}

	
}
