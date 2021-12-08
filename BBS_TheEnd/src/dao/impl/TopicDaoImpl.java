package dao.impl;

import dao.TopicDao;
import entity.Topic;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TopicDaoImpl extends BaseDao implements TopicDao {
    public final static String dbName = "wxl_bbs"; // 数据库用户名
    public final static String dbPass = "wxl_bbs"; // 数据库密码
    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    @Override
    public Topic findTopic(int topicId) {
        //select * from TBL_TOPIC where topicId=?
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://81.70.194.69:3306/wxl_bbs?useSSL=true&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",dbName,dbPass);

            String sql = "select * from TBL_TOPIC where topicId=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,topicId);
            rs = ps.executeQuery();

            while (rs.next()) {
                Topic topic = new Topic();
                topic.setTopicId(rs.getInt("topicId"));
                topic.setTitle(rs.getString("title"));
                topic.setContent(rs.getString("content"));
                topic.setPublishTime(rs.getDate("publishTime"));
                topic.setModifyTime(rs.getDate("modifyTime"));
                topic.setUserId(rs.getInt("uId"));
                topic.setBoardId(rs.getInt("boardId"));
                return topic;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    @Override
    public int addTopic(Topic topic) {
        // insert into TBL_USER VALUES(?,?,?,?,?,?)
        String sql = "insert into TBL_TOPIC (title,content,publishTime,ModifyTime,uId,boardId) VALUES(?,?,?,?,?,?)";
        int topicId = topic.getTopicId();
        int userId = topic.getUserId();
        int boardId = topic.getBoardId();
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); //取得发布日期时间
        String[] param = {topic.getTitle(), topic.getContent(),
                time,time,Integer.toString(userId), Integer.toString(boardId)};
        return this.executeSQL(sql, param);

    }

    @Override
    public int deleteTopic(int topicId) {
        //delete from TBL_TOPIC where topicId = ?
        String sql = "delete from TBL_TOPIC where topicId = ?";
        String[] param = {Integer.toString(topicId)};
        return this.executeSQL(sql, param);
    }

    @Override
    public int updateTopic(Topic topic) {
        //update TBL_TOPIC set title=? content = ? where topic = ?;
        String sql = "update TBL_TOPIC set title=? content =? where topic =?";
        int topicId = topic.getTopicId();
        String time = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss").format(new Date());
        String[] param = {Integer.toString(topicId), topic.getTitle(), topic.getContent(), time};

        return this.executeSQL(sql, param);
    }

    @Override
    public int findCountTopic(int boardId) {
        int num = 0;
        //select count(topicId) from TBL_TOPIC where boardId = ?
        try {
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection("jdbc:mysql://81.70.194.69:3306/wxl_bbs?useSSL=true&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",dbName,dbPass);
            String sql = "select count(*) as num from TBL_TOPIC where boardId = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, boardId);
            rs = ps.executeQuery();
            while (rs.next()) {
                num = Integer.valueOf(rs.getString("num"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }


        return num;
    }

    public List findListTopic(int page, int boardId) {
        List list = new ArrayList();          //用来保存主题对象列表
        int rowBegin = 0;               //开始行数,表示每页第一条记录在数据库中的行数
        if (page >= 1) {
            rowBegin = 10 * (page - 1); //按页数取得开始行数，设每页可以显示10条回复
        }


        String sql = "select * from TBL_TOPIC where boardId=" + boardId + " limit " + rowBegin + "," + 10;

        try {
            conn = this.getConn();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Topic topic = new Topic();
                topic.setTopicId(rs.getInt("topicId"));
                topic.setTitle(rs.getString("title"));

                topic.setPublishTime(rs.getDate("publishTime"));
                topic.setUserId(rs.getInt("uId"));
                list.add(topic);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            this.closeAll(conn, ps, rs);
        }
        return list;
    }

}
