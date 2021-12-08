package dao.impl;

import dao.ReplyDao;
import entity.Reply;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ReplyDaoImpl extends BaseDao implements ReplyDao {
    public final static String dbName = "wxl_bbs"; // 数据库用户名
    public final static String dbPass = "wxl_bbs"; // 数据库密码
    private Connection conn = null;     //保存数据库连接
    private PreparedStatement pstmt = null; //用于执行SQL语句
    private ResultSet rs = null;          //用户保存查询结果集


    @Override
    public Reply findReply(int replyId) {
        //select * from TBL_REPLY where replyId=?

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://81.70.194.69:3306/wxl_bbs?useSSL=true&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",dbName,dbPass);

            String sql = "select * from TBL_REPLY where replyId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,replyId);
            rs = pstmt.executeQuery();

            while(rs.next()){
                Reply reply = new Reply();
                reply.setReplyId(rs.getInt("replyId"));
                reply.setTitle(rs.getString("title"));
                reply.setContent(rs.getString("content"));
                reply.setPublishTime(rs.getDate("publishTime"));
                reply.setModifyTime(rs.getDate("modifyTime"));
                reply.setUserId(rs.getInt("uid"));
                reply.setTopicId(rs.getInt("topicId"));
                return reply;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    @Override
    public int addReply(Reply reply) {
        //insert into TBL_REPLY values(?,?,?,?,?)
        String sql = "insert into TBL_REPLY (title,content,publishTime,modifyTime,uid,topicId) values(?,?,?,?,?,?)";
        int userid = reply.getUserId();
        int topicid = reply.getTopicId();
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        String[] param = {reply.getTitle() ,reply.getContent(),time,time,
                Integer.toString(userid),Integer.toString(topicid)};


        return this.executeSQL(sql,param);
    }

    @Override
    public int deleteReply(int replyId) {
        //delete from TBL_REPLY where replyId = ?
        String sql = "delete from TBL_REPLY where replyId = ?";
        String[] param = {Integer.toString(replyId)};
        return this.executeSQL(sql,param);
    }

    @Override
    public int updateReply(Reply reply) {
        //update TBL_REPLY set title=?,content=? where userId=?;
        String sql = "update TBL_REPLY set title=?,content=? where userId=?;";
        String time = new SimpleDateFormat("yy-MM-dd HH:mm:ss").format(new Date());
        String[] param = {reply.getTitle(),reply.getContent(),time};
        return this.executeSQL(sql,param);
    }

    @Override
    public List findListReply(int page, int topicId) {
        List list = new ArrayList();

        int rowBegin = 0;
        if (page > 1) {
            rowBegin = 10 * (page - 1) + 1;

        }
        String sql = "select * from TBL_REPLY where topicId = " + topicId + " limit " + rowBegin + "," + 10;
        try {
            conn = this.getConn();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                Reply reply = new Reply();
                reply.setReplyId(rs.getInt("replyId"));
                reply.setTitle(rs.getString("title"));
                reply.setContent(rs.getString("content"));
                reply.setPublishTime(rs.getDate("publishTime"));
                reply.setPublishTime(rs.getDate("modifyTime"));
                reply.setUserId(rs.getInt("uId"));
                reply.setTopicId(rs.getInt("topicId"));
                list.add(reply);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }  finally {
            this.closeAll(conn,pstmt,rs);
        }
        return list;
    }


    @Override
    public int findCountReply(int topicId) {
        int num = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://81.70.194.69:3306/wxl_bbs?useSSL=true&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",dbName,dbPass);
            String sql = "select count(replyId) as num from TBL_REPLY where topicId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,topicId);
            rs = pstmt.executeQuery();

            while(rs.next()){
                num = Integer.valueOf(rs.getString("num"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return num;
    }
}
