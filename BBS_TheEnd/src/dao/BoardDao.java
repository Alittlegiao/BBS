package dao;

import java.util.Map;

import entity.Board;

public interface BoardDao {
	public Map findBoard();

		//查找板块map,key是父板块号，value是子鸡板块对象集合

	
	public Board findBoard(int boardId);
	//根据板块ID查找主题

}
