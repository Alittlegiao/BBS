package dao.impl;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import entity.User;
import dao.UserDao;

public class UserDaoImpl extends BaseDao implements UserDao {
    public final static String dbName = "wxl_bbs"; // 数据库用户名
    public final static String dbPass = "wxl_bbs"; // 数据库密码
    private Connection conn = null;     //保存数据库连接
    private PreparedStatement pstmt = null; //用于执行SQL语句
    private ResultSet rs = null;          //用户保存查询结果集


    @Override
    public User findUser(String userName) {
        //select * from TBL_USER where userName=?

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://81.70.194.69:3306/wxl_bbs?useSSL=true&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",dbName,dbPass);

            String sql = "select * from TBL_USER where uName=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userName);
            rs = pstmt.executeQuery();


            while(rs.next()){
                User user = new User();
                user.setUserId(rs.getInt("uId"));
                user.setUserName(rs.getString("uName"));
                user.setUserPass(rs.getString("uPass"));
                user.setHead(rs.getString("head"));
                user.setGender(rs.getInt("gender"));
                user.setRegTime(rs.getDate("regTime"));

                return user;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public User findUser(int userId) {
        //select * from TBL_USER where userId=?
        //1.声明对象
        Connection conn = null;       //保存数据库连接
        PreparedStatement ps = null;  //用于执行SQL语句
        ResultSet rs = null;          //用户保存查询结果集

        try {
            //2.建立与数据库的连接
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://81.70.194.69:3306/wxl_bbs?useSSL=true&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",dbName,dbPass);

            //3.执行Sql语句
            String sql = "select * from TBL_USER where uId=?";
            //System.out.println(sql);

            ps = conn.prepareStatement(sql);
            ps.setInt(1,userId);
            rs = ps.executeQuery();
            //4.处理结果集
            while(rs.next()){
                User user = new User();
                user.setUserId(rs.getInt("uId"));
                user.setUserName(rs.getString("uName"));
                user.setUserPass(rs.getString("uPass"));
                user.setHead(rs.getString("head"));
                user.setGender(rs.getInt("gender"));
                user.setRegTime(rs.getDate("regTime"));
                return user;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int addUser(User user) {
        // insert into TBL_USER VALUES(?,?,?,?,?,?)
        String sql = "insert into TBL_USER (uName,uPass,head,regTime,gender) VALUES(?,?,?,?,?);";
        String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); //取得日期时间

        String[] param = {user.getUserName(),user.getUserPass(),user.getHead(),time,Integer.toString(user.getGender())};
        return this.executeSQL(sql,param);
    }

    @Override
    public int updateUser(User user) {
        // update TBL_USER set userPass=? where userName=?;
        String sql = "update TBL_USER set userPass = ? where userName = ?;";
        String[] param = {user.getUserPass(),user.getUserName()};

        return this.executeSQL(sql,param);
    }

}
