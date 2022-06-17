package vo;

import java.util.Date;

public class Qa_ReportVo {
	private int rnum;			// 신고번호
	private int defendant;		// 신고당한 회원번호
	private int plaintiff;		// 신고한 회원번호
	private String reason;		// 신고 사유(100자)
	private String repo;		// 신고 내용(댓글/게시글내용 250자);
	private Date rdate;			// 신고일자
	public Qa_ReportVo() {}
	public Qa_ReportVo(int rnum, int defendant, int plaintiff, String reason, String repo, Date rdate) {
		super();
		this.rnum = rnum;
		this.defendant = defendant;
		this.plaintiff = plaintiff;
		this.reason = reason;
		this.repo = repo;
		this.rdate = rdate;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getDefendant() {
		return defendant;
	}
	public void setDefendant(int defendant) {
		this.defendant = defendant;
	}
	public int getPlaintiff() {
		return plaintiff;
	}
	public void setPlaintiff(int plaintiff) {
		this.plaintiff = plaintiff;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getRepo() {
		return repo;
	}
	public void setRepo(String repo) {
		this.repo = repo;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	

}
