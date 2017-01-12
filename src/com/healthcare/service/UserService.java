package com.healthcare.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.healthcare.dao.UserDao;
import com.healthcare.model.User;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public User getUser(User user) {
		String filter = String.format(" UserId='%s' AND Password='%s' ", user.getUserId(), user.getPassword()); 
		List<User> userList = userDao.list(filter);
		
		if (null == userList || userList.isEmpty())
			return null;
		else
			return userList.get(0);
	}
	
	/**
	 * 按条件查询用户数量
	 * @param userId  用户ID
	 * @param userName  用户姓名
	 * @param roleId  角色类型, 0 表示无效
	 * @return
	 */
	public int getUserNumbers(String userId, String userName, int roleId) {
		int count = 0;
		String filter = "";
		
		if (!"".equals(userId) && !"".equals(userName)) {
			filter = String.format(" UserId='%s' AND UserName='%s' ", userId, userName);
		} else if (!"".equals(userId)) {
			filter = String.format(" UserId='%s' ", userId);
		} else if (!"".equals(userName)) {
			filter = String.format(" UserName='%s' ", userName);
		}

		if (!"".equals(filter) && 0 != roleId) {
			filter += String.format(" AND RoleId=%d ", roleId);
		} else if (-1 != roleId) {
			filter = String.format(" RoleId=%d ", roleId);
		}

		if ("".equals(filter))
			count = userDao.count();
		else 
			count = userDao.count(filter);
		
		return count;
	}
	
	
	/**
	 * 新建用户时，验证用户名的合法性
	 * @param userId
	 * @return
	 */
	public Boolean isUserIdAvailable(String userId) {
		String filter = String.format(" UserId='%s' ", userId);
		List<User> users = userDao.list(filter);
		if (users.isEmpty()) {
			return true;
		} else {
			return false;
		}
	}
	
	
	/**
	 * 新建用户
	 * @param user
	 * @return
	 */
	public Boolean insertUser(User user) {
		long result = 0;
		if (0 == user.getId()) {
			result = userDao.save(user);
		}
		
		if (0 < result) {
			return true;
		} else {
			return false;
		}
	}
	
	
	/**
	 * 修改用户信息 - 密码，姓名
	 * @param userinfo
	 * @return
	 */
	public Boolean editUser(User user) {
		long result = 0;
		if (0 < user.getId()) {
			result = userDao.update(user);
		}
		
		if (0 < result) {
			return true;
		} else {
			return false;
		}
	}
	
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public Boolean deleteUser(int id) {
		int result = 0;
		
		if (0 < id) {
			result = userDao.delete(id);
		}
		
		if (0 < result) {
			return true;
		} else {
			return false;
		}
	}
	
}
