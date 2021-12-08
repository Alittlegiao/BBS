package dao.impl;

import dao.BoardDao;
import entity.Board;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardDaoImpl extends BaseDao implements BoardDao {
    public final static String dbName = "wxl_bbs"; // 数据库用户名
    public final static String dbPass = "wxl_bbs"; // 数据库密码
    private  Connection conn = null;           //保存数据库连接
    private  PreparedStatement ps = null;      //用于执行SQL语句
    private  ResultSet rs = null;              //用户保存查询结果集
    private HashMap map = new HashMap();       //保存板块信息的Map
    private int parentId = 0;                  //父板块id初始值为0，parentNo将作为map的Key
    private List sonList = null;               //保存属于同一个父版块的一组子版块,将作为map的value



    public Map findBoard() {
        String sql = "select * from TBL_BOARD order by parentId,boardId";
        try {
            conn = this.getConn();        //得到数据库连接
            ps = conn.prepareStatement(sql);      //得到Pre对象
            rs = ps.executeQuery();           //执行sql取得结果集
            sonList = new ArrayList();        //实例化

            while(rs.next()){
                if(parentId != rs.getInt("parentId")){
                    map.put(parentId,sonList);       //将上一组子版块保存到map中

                    sonList = new ArrayList();   //重新产生一个ArrayList对象,用于存放下一组子版块

                    parentId = rs.getInt("parentId");  //为parentNo重新设值,用于map的新KEY值
                }
                Board board = new Board();       //板块对象
                board.setBoardId(rs.getInt("boardId"));
                board.setBoardName(rs.getString("boardName"));
                sonList.add(board);   //保存属于同一父板块的子版块
            }
            map.put(parentId,sonList);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeAll(conn,ps,rs);
        }
        return map;
    }

    public Board findBoard(int boardId) {
        //select * from TBL_BOARD where boardId=?

        try {
            //2.建立与数据库的连接
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://81.70.194.69:3306/wxl_bbs?useSSL=true&useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",dbName,dbPass);
            //3.执行Sql语句
            String sql = "select * from TBL_BOARD where boardId=?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,boardId);
            rs = ps.executeQuery();
            //4.处理结果集
            while(rs.next()){
                Board board = new Board();
                board.setBoardId(rs.getInt("boardId"));
                board.setBoardName(rs.getString("boardName"));
                board.setParentId(rs.getInt("parentId"));
                return board;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
}
