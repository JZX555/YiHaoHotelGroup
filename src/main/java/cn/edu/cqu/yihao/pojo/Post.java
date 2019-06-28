package cn.edu.cqu.yihao.pojo;

public class Post {
    private String indentId;

    private Float socre;

    private String comment;

    public String getIndentId() {
        return indentId;
    }

    public void setIndentId(String indentId) {
        this.indentId = indentId == null ? null : indentId.trim();
    }

    public Float getSocre() {
        return socre;
    }

    public void setSocre(Float socre) {
        this.socre = socre;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }
}