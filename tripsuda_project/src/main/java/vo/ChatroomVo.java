package vo;

import java.sql.Array;

public class ChatroomVo {
	private long rNum;
	private long aNum;
	private long[] members;
	
	public ChatroomVo()
	{ }
	
	public ChatroomVo(long rNum, long aNum, long[] members) {
		super();
		this.rNum = rNum;
		this.aNum = aNum;
		this.members = members;
	}
	public long getrNum() {
		return rNum;
	}
	public void setrNum(long rNum) {
		this.rNum = rNum;
	}
	public long getaNum() {
		return aNum;
	}
	public void setaNum(long aNum) {
		this.aNum = aNum;
	}
	public long[] getMembers() {
		return members;
	}
	public void setMembers(long[] members) {
		this.members = members;
	}
	
	
}
