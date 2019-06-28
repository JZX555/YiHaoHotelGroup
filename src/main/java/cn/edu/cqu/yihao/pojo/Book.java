package cn.edu.cqu.yihao.pojo;

public class Book extends BookKey {
    private Integer bookdate;

    private Integer isBooked;

    public Integer getBookdate() {
        return bookdate;
    }

    public void setBookdate(Integer bookdate) {
        this.bookdate = bookdate;
    }

    public Integer getIsBooked() {
        return isBooked;
    }

    public void setIsBooked(Integer isBooked) {
        this.isBooked = isBooked;
    }
}