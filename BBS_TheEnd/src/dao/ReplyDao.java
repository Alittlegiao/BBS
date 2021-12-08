package dao;

import java.util.List;

import entity.Reply;

public interface ReplyDao {
	
	public Reply findReply(int replyId);

		//根据回复ID查找回复

	
	public int addReply(Reply reply);

		//添加回复

	
	public int deleteReply(int replyed);

		//删除回复

	
	public int updateReply(Reply reply);

		//更新回复

	
	public List findListReply(int page,int topicId);

		//返回某主题的第page页回复列表

	
	public int findCountReply(int topicId);

		//返回某主题的回复数

}
