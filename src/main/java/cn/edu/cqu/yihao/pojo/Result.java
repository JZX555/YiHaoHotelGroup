package cn.edu.cqu.yihao.pojo;

public class Result
{
	public int flag = 1;
	public String currentIndentId;// 订单号
	public String checkInDate;// 入住时间
	public String checkOutDate;// 退房时间
	public int dateCount;// //天数
	public String roomType;// 房间类型
	public String breakfastType;//早餐类型
	public String customerName;// 住户姓名
	public String customerId;// 身份证号
	public int price;// 原价
	public int vipLevel;// VIP等级
	public float discount;// 折扣
	public double cost;// 折后价
	public int getFlag()
	{
		return flag;
	}
	public void setFlag(int flag)
	{
		this.flag = flag;
	}
	public String getCurrentIndentId()
	{
		return currentIndentId;
	}
	public void setCurrentIndentId(String currentIndentId)
	{
		this.currentIndentId = currentIndentId;
	}
	public String getCheckInDate()
	{
		return checkInDate;
	}
	public void setCheckInDate(String checkInDate)
	{
		this.checkInDate = checkInDate;
	}
	public String getCheckOutDate()
	{
		return checkOutDate;
	}
	public void setCheckOutDate(String checkOutDate)
	{
		this.checkOutDate = checkOutDate;
	}
	public int getDateCount()
	{
		return dateCount;
	}
	public void setDateCount(int dateCount)
	{
		this.dateCount = dateCount;
	}
	public String getRoomType()
	{
		return roomType;
	}
	public void setRoomType(String roomType)
	{
		this.roomType = roomType;
	}
	public String getBreakfastType()
	{
		return breakfastType;
	}
	public void setBreakfastType(String breakfastType)
	{
		this.breakfastType = breakfastType;
	}
	public String getCustomerName()
	{
		return customerName;
	}
	public void setCustomerName(String customerName)
	{
		this.customerName = customerName;
	}
	public String getCustomerId()
	{
		return customerId;
	}
	public void setCustomerId(String customerId)
	{
		this.customerId = customerId;
	}
	public int getPrice()
	{
		return price;
	}
	public void setPrice(int price)
	{
		this.price = price;
	}
	public int getVipLevel()
	{
		return vipLevel;
	}
	public void setVipLevel(int vipLevel)
	{
		this.vipLevel = vipLevel;
	}
	public float getDiscount()
	{
		return discount;
	}
	public void setDiscount(float discount)
	{
		this.discount = discount;
	}
	public double getCost()
	{
		return cost;
	}
	public void setCost(double cost)
	{
		this.cost = cost;
	}
}
