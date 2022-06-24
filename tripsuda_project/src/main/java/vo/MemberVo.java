package vo;

import java.sql.Date;

/**
 * @author 주현
 * 회원 VO
 */
public class MemberVo
{
	private long mnum;			// 회원 번호
	private String id;			// ID
	private String pwd;			// 비번
	private String name;		// 이름
	private String nick;		// 닉네임
	private String phone;		// 전번
	private String birth;			// 생일
	private String withdraw;		// 탈퇴여부(Y/N)
	private String favorite;	// 관심지역
	private String grade;		// 권한(일반/전문가/관리자)
	private Date stop;			// 정지기한
	
	public MemberVo()
	{
		
	}
	
	
	








	public MemberVo(long mnum, String id, String pwd, String name, String nick, String phone, String favorite) {
		super();
		this.mnum = mnum;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nick = nick;
		this.phone = phone;
		this.favorite = favorite;
	}
	
	





	public MemberVo(String id, String pwd, String name, String nick, String phone, String favorite, String grade) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nick = nick;
		this.phone = phone;
		this.favorite = favorite;
		this.grade = grade;
	}





	public MemberVo(long mnum, String id, String pwd, String name, String nick, String phone, String birth,
			String favorite, String grade) {
		super();
		this.mnum = mnum;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nick = nick;
		this.phone = phone;
		this.birth = birth;
		this.favorite = favorite;
		this.grade = grade;
	}


	public MemberVo(long mnum, String id, String pwd, String name, String nick, String phone, String birth, String withdraw,
			String favorite, String grade, Date stop) {
		super();
		this.mnum = mnum;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nick = nick;
		this.phone = phone;
		this.birth = birth;
		this.withdraw = withdraw;
		this.favorite = favorite;
		this.grade = grade;
		this.stop = stop;
	}
	






   
 




	public MemberVo(long mnum, String id, String pwd, String name, String nick, String phone, String birth,
			String favorite) {
		super();
		this.mnum = mnum;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nick = nick;
		this.phone = phone;
		this.birth = birth;
		this.favorite = favorite;
	}


   








	public long getMnum() {
		return mnum;
	}
	public void setMnum(long mnum) {
		this.mnum = mnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getWithdraw() {
		return withdraw;
	}
	public void setWithdraw(String withdraw) {
		this.withdraw = withdraw;
	}
	public String getFavorite() {
		return favorite;
	}
	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public Date getStop() {
		return stop;
	}
	public void setStop(Date stop) {
		this.stop = stop;
	}




	
	
}
