package dao;

import java.util.List;

import entity.Topic;

public interface TopicDao {
	
	//��������ID��������
	public Topic findTopic(int topicId);
	
	//����ĳģ���ڵ�pageҳ�������б�
	public List findListTopic(int page,int boardId);
	
	//�������
	public int addTopic(Topic topic);
	 
	//ɾ������
	public int deleteTopic(int topicId);
	
	
	//��������
	public int updateTopic(Topic topic);
	
	//����ĳ����������
	public int findCountTopic(int boardId);
}
