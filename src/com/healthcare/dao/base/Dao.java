package com.healthcare.dao.base;

import java.util.List;

import com.healthcare.model.base.JavaBean;

/**
 * 
 * @Title: Dao
 * @Description: Dao层接口
 *
 * @author: 114-FEI
 * @date: 2017年1月4日 下午4:14:01
 *
 * @param <T>
 */
public interface Dao<T> {
	/**
	 * 插入记录。通常情况下，save方法已经能够满足需求，可以自动选择是插入抑或修改<br>
	 * 所以，在调用本方法前，请确保你明白自己在做什么。
	 * 
	 * @see Dao#save(JavaBean)
	 * 
	 * @param bean
	 */
	void insert(T bean);

	/**
	 * 批量新增
	 * 
	 * @param beans
	 */
	void insert(T[] beans);

	/**
	 * 批量新增，请尽量使用{@link #insert(Object[])}方法
	 * 
	 * @param beans
	 */
	void insert(List<T> beans);

	/**
	 * 修改记录。通常情况下，save方法已经能够满足需求，可以自动选择是插入抑或修改<br>
	 * 所以，在调用本方法前，请确保你明白自己在做什么。
	 * 
	 * @see Dao#save(JavaBean)
	 * 
	 * @param bean
	 */
	long update(T bean);

	/**
	 * 插入或修改记录。
	 * 
	 * @param bean
	 */
	long save(T bean);

	/**
	 * 根据主键删除记录
	 * 
	 * @param id
	 * @return 操作影响行数
	 */
	int delete(long id);

	/**
	 * 批量删除
	 * 
	 * @param ids
	 * @return 操作影响行数
	 */
	int delete(long[] ids);

	/**
	 * 批量删除，请尽量使用{@link #delete(long[])}方法
	 * 
	 * @param ids
	 * @return 操作影响行数
	 */
	int delete(List<Long> ids);

	/**
	 * 根据主键查询记录。
	 * 
	 * @param id
	 * @return
	 */
	T get(long id);
	
	/**
	 * 批量获取
	 * 
	 * @param ids
	 * @return
	 */
	List<T> get(long[] ids);

	/**
	 * 批量获取，请尽量使用{@link #get(long[])}方法
	 * 
	 * @param ids
	 * @return
	 */
	List<T> get(List<Long> ids);

	/**
	 * 统计此对象的总记录数
	 * 
	 * @param filter
	 * @return
	 */
	int count(String filter);

	/**
	 * 统计此对象的总记录数
	 * 
	 * @return
	 */
	int count();

	/**
	 * 查询所有对象
	 * 
	 * @return
	 */
	List<T> list();

	/**
	 * 分页查询对象
	 * 
	 * @param page
	 *            请求的页数
	 * @param size
	 *            每页的记录数目
	 * @return
	 */
	List<T> list(int page, int size);

	/**
	 * 查询所有对象
	 * 
	 * @param filter
	 * @return
	 */
	List<T> list(String filter);

	/**
	 * 分页查询对象
	 * 
	 * @param filter
	 * @param page
	 *            请求的页数
	 * @param size
	 *            每页的记录数目
	 * @return
	 */
	List<T> list(String filter, int page, int size);

	/**
	 * 查询所有对象
	 * 
	 * @param filter
	 * @param orderBy
	 * @return
	 */
	List<T> list(String filter, String orderBy);

	/**
	 * 分页查询对象
	 * 
	 * @param filter
	 * @param orderBy
	 * @param page
	 * @param size
	 * @return
	 */
	List<T> list(String filter, String orderBy, int page, int size);

	/**
	 * 查询给定id后的若干条数据
	 * 
	 * @param lastId
	 * @param size
	 * @return
	 */
	List<T> listAfter(long lastId, int size);

	/**
	 * 查询给定id后的若干条数据
	 * 
	 * @param filter
	 * @param lastId
	 * @param size
	 * @return
	 */
	List<T> listAfter(String filter, long lastId, int size);

	/**
	 * 更新一列
	 * 
	 * @param id
	 * @param col
	 * @param value
	 * @return 操作影响行数
	 */
	int updateSingleColumn(long id, String col, Object value);
}
