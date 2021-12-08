package dao;

import entity.User;

public interface UserDao {
	public static final int FEMALE = 1;  //Ů��
	public static final int MALE = 2;    //����


	//�����û���������̳�û�
	public User findUser(String userName);

	//�����û�ID������̳�û�
	public User findUser(int userId);

	//�����̳�û���������Ӹ���
	public int addUser(User user);

	//�޸���̳�û�����Ϣ�������޸ĸ���
	public int updateUser(User user);

}