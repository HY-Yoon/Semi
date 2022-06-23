package vo.reviewboard;

public class ReviewRecoVo {
	private int rnum;
	private int anum;
	private int mnum;
	
	public ReviewRecoVo() {}

	public ReviewRecoVo(int rnum, int anum, int mnum) {
		super();
		this.rnum = rnum;
		this.anum = anum;
		this.mnum = mnum;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getAnum() {
		return anum;
	}

	public void setAnum(int anum) {
		this.anum = anum;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	
	
}
