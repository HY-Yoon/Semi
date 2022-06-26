package vo;

public class Qa_BoardOrderVo {
	private Qa_BoardVo vo;
	private String ltag;
	private int ccnt;
	public Qa_BoardOrderVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Qa_BoardOrderVo(Qa_BoardVo vo, String ltag, int ccnt) {
		super();
		this.vo = vo;
		this.ltag = ltag;
		this.ccnt = ccnt;
	}
	public Qa_BoardVo getVo() {
		return vo;
	}
	public void setVo(Qa_BoardVo vo) {
		this.vo = vo;
	}
	public String getLtag() {
		return ltag;
	}
	public void setLtag(String ltag) {
		this.ltag = ltag;
	}
	public int getCcnt() {
		return ccnt;
	}
	public void setCcnt(int ccnt) {
		this.ccnt = ccnt;
	}
	
}
