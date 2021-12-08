package entity;

import java.util.Date;

public class Topic {
    private int topicId;      //主题ID
    private String title;     //标题
    private String content;   //内容
    private Date publishTime; //发布时间
    private Date modifyTime;  //修改时间
    private int uId;          //用户ID
    private int boardId;      //板块ID

    public int getTopicId() {
        return topicId;
    }
    public void setTopicId(int topicId) {
        this.topicId = topicId;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Date getPublishTime() {
        return publishTime;
    }
    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }
    public Date getModifyTime() {
        return modifyTime;
    }
    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }
    public int getUserId() {
        return uId;
    }
    public void setUserId(int uId) {
        this.uId = uId;
    }
    public int getBoardId() {
        return boardId;
    }
    public void setBoardId(int boardId) {
        this.boardId = boardId;
    }

}
