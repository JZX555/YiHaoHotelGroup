package cn.edu.cqu.yihao.pojo;

import java.util.Date;

public class BookKey {
    private String tel;

    private String roomId;
    
    private Date bookdate;

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getRoomId()
	{
		return roomId;
	}

	public void setRoomId(String roomId)
	{
		this.roomId = roomId;
	}

	public Date getBookdate()
	{
		return bookdate;
	}

	public void setBookdate(Date bookdate)
	{
		this.bookdate = bookdate;
	}
}