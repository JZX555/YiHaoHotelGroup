package cn.edu.cqu.yihao.pojo;

public class RoomWithIndent {
	private Room room = null;
	private String date = null;
	private Indent indent = null;
	private int haveIndent = 0;
	
	public Room getRoom() {
		return room;
	}
	
	public void setRoom(Room room) {
		this.room = room;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public Indent getIndent() {
		return indent;
	}
	
	public void setIndent(Indent indent) {
		this.indent = indent;
	}
	
	public int getHaveIndent() {
		return haveIndent;
	}
	
	public void setHaveIndent(int haveIndent) {
		this.haveIndent = haveIndent;
	}
	
	
}
