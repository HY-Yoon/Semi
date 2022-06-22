package vo.reviewboard;

import java.sql.Date;

/**
* Create : 윤혜인
* Create Date : 2022-06-17
* Last Update : 2022-06-17
* Modify : 윤혜인
* 여행후기 게시판 Vo
*/
public class ReviewBoardVo {
	private int anum;//글번호	
	private int mnum;//회원번호
	private String title; //제목
	private String content; //글내용
	private Date regdate;//등록일
	private int views; //조회수
	private String notice; //공지사항여부
	private String thum;//썸네일 이미지
	
	private String location; //지역태그
	
	public ReviewBoardVo() {}

	public ReviewBoardVo(int anum, int mnum, String title, String content, Date regdate, int views, String notice,
			String thum, String location) {
		super();
		this.anum = anum;
		this.mnum = mnum;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.views = views;
		this.notice = notice;
		this.thum = thum;
		this.location = location;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getThum() {
		return thum;
	}

	public void setThum(String thum) {
		this.thum = thum;
	}

	
	
	
	
}
