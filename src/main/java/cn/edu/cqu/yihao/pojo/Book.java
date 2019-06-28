package cn.edu.cqu.yihao.pojo;

import java.util.Date;

public class Book extends BookKey {
    private Date bookdate;

    private Integer isBooked;

    public Date getBookdate() {
        return bookdate;
    }

    public void setBookdate(Date bookdate) {
        this.bookdate = bookdate;
    }

    public Integer getIsBooked() {
        return isBooked;
    }

    public void setIsBooked(Integer isBooked) {
        this.isBooked = isBooked;
    }
}