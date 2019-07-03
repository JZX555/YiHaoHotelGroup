package cn.edu.cqu.yihao.pojo;

import java.util.Date;

public class Book extends BookKey {
    private Integer isBooked;

	public Integer getIsBooked()
	{
		return isBooked;
	}

	public void setIsBooked(Integer isBooked)
	{
		this.isBooked = isBooked;
	}
}