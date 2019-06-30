package cn.edu.cqu.yihao.pojo;

public class Post {
    private String indentId;

    private Double score;

    private String comment;

    public String getIndentId() {
        return indentId;
    }

    public void setIndentId(String indentId) {
        this.indentId = indentId == null ? null : indentId.trim();
    }

    public Double getSocre() {
        return score;
    }

    public void setSocre(Double score) {
        this.score = score;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }
}