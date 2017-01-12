package com.healthcare.dao.base;

import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.dao.IncorrectUpdateSemanticsDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.orm.ObjectRetrievalFailureException;
import org.springframework.util.Assert;

import com.healthcare.dao.base.Dao;
import com.healthcare.model.base.JavaBean;
import com.healthcare.dao.base.DaoHelper;

@SuppressWarnings("deprecation")
public abstract class BaseDao<T extends JavaBean> implements Dao<T> {
	/**
	 * 用在更新操作中。 其语法为=:左侧的为sql字段，等号右侧的为POJO的属性字段。
	 */
	protected String updateSetStatement;
	/**
	 * 映射查询结果和POJO。
	 */
	protected RowMapper<T> rowMapper;

	/**
	 * 执行删除/查询/更新操作
	 */
	protected SimpleJdbcTemplate template;
	
	/**
	 * 执行插入操作
	 */
	protected SimpleJdbcInsert insert;

	public final String TABLE = DaoHelper.getTableName(getClass());

	@Autowired
	void init(DataSource dataSource) {
		updateSetStatement = buildUptStatement();
		rowMapper = buildRowMapper();
		insert = new SimpleJdbcInsert(dataSource).withTableName(TABLE)
				.usingGeneratedKeyColumns("id");
		template = new SimpleJdbcTemplate(dataSource);
	}

	abstract protected String buildUptStatement();

	abstract protected RowMapper<T> buildRowMapper();

	public void insert(T bean) {
		long id = insert.executeAndReturnKey(
				new BeanPropertySqlParameterSource(bean)).longValue();
		bean.setId(id);
	}

	public void insert(T[] beans) {
		Assert.notEmpty(beans);
		SqlParameterSource[] sources = new SqlParameterSource[beans.length];
		for (int i = 0, len = beans.length; i != len; ++i)
			sources[i] = new BeanPropertySqlParameterSource(beans[i]);
		insert.executeBatch(sources);
	}

	public void insert(List<T> beans) {
		Assert.notEmpty(beans);
		SqlParameterSource[] sources = new SqlParameterSource[beans.size()];
		int index = 0;
		// 无法确定传入的List类型，所以使用for-each遍历方式
		for (T bean : beans)
			sources[index++] = new BeanPropertySqlParameterSource(bean);
		insert.executeBatch(sources);
	}

	public long update(T bean) {
		int affected = template.update(
				"UPDATE ".concat(TABLE).concat(updateSetStatement),
				new BeanPropertySqlParameterSource(bean));

		if (affected == 0) {
			String msg = "Exception thrown when UPDATE ".concat(TABLE)
					.concat(" with id = ").concat(String.valueOf(bean.getId()));
			throw new IncorrectUpdateSemanticsDataAccessException(msg);
		}
		return affected;
	}

	public long save (T bean) {
		if (bean.getId() > 0) {
			return update(bean);
			
		} else {
			insert(bean);
			return (int)bean.getId();
		}
	}

	public int updateSingleColumn(long id, String col, Object value) {
		String sql = "UPDATE ".concat(TABLE).concat(" SET ").concat(col)
				.concat(" = ? WHERE id = ?");
		return template.update(sql, value, id);
	}

	public int delete(long id) {
		String sql = "DELETE FROM ".concat(TABLE).concat(" WHERE id = ?");
		int affected = template.update(sql, id);
		if (affected == 0) {
			String msg = "Exception thrown when DELETE from ".concat(TABLE)
					.concat(" WHERE id = ").concat(String.valueOf(id));
			throw new IncorrectUpdateSemanticsDataAccessException(msg);
		}
		return affected;
	}

	public int delete(long[] ids) {
		return delete(getBatchIds(ids));
	}

	public int delete(List<Long> ids) {
		return delete(getBatchIds(ids));
	}

	private int delete(String batchIds) {
		String sql = "DELETE FROM ".concat(TABLE).concat(" WHERE id IN ")
				.concat(batchIds);
		int affected = template.update(sql);
		if (affected == 0) {
			String msg = "Exception thrown when DELETE from ".concat(TABLE)
					.concat(" WHERE id IN ").concat(batchIds);
			throw new IncorrectUpdateSemanticsDataAccessException(msg);
		}
		return affected;
	}

	public T get(long id) {
		String sql = "SELECT * FROM ".concat(TABLE).concat(" WHERE id = ?");
		try {
			return template.queryForObject(sql, rowMapper, id);
		} catch (EmptyResultDataAccessException e) {
			throw new ObjectRetrievalFailureException(TABLE, id);
		}
	}
	
	@SuppressWarnings("rawtypes")
	public int get() {
		int l=1;
		String sql = "SELECT MAX(ID) FROM ".concat(TABLE);
		try {
			List list = template.queryForList(sql);
			l=Integer.parseInt(list.get(0).toString());
			return l;
		} catch (EmptyResultDataAccessException e) {
			throw new ObjectRetrievalFailureException(TABLE,l);
		}
	}

	public List<T> get(long[] ids) {
		return get(getBatchIds(ids));
	}

	public List<T> get(List<Long> ids) {
		return get(getBatchIds(ids));
	}

	private List<T> get(String batchIds) {
		String sql = "SELECT * FROM ".concat(TABLE).concat(" WHERE id IN ")
				.concat(batchIds);
		return template.query(sql, rowMapper);
	}

	public int count(String filter) {
		String sql = "SELECT COUNT(*) FROM ".concat(TABLE).concat(" WHERE ")
				.concat(filter);
		int l = template.queryForObject(sql, Integer.class);
		return l;
	}

	public int count() {
		String sql = "SELECT COUNT(*) FROM ".concat(TABLE);
		int l = template.queryForObject(sql, Integer.class);
		return l;
	}

	public List<T> list(String filter) {
		String sql = "SELECT * FROM ".concat(TABLE).concat(" WHERE ")
				.concat(filter).concat(" LIMIT ?,?");
		return template.query(sql, rowMapper, 0, Integer.MAX_VALUE);
	}

	public List<T> list(String filter, int page, int size) {
		Assert.isTrue(page >= 1 && size >= 1);
		int from = (page - 1) * size;
		String sql = "SELECT * FROM ".concat(TABLE).concat(" WHERE ")
				.concat(filter).concat(" LIMIT ?,?");
		return template.query(sql, rowMapper, from, size);
	}

	public List<T> list(String filter, String orderBy, int page, int size) {
		Assert.isTrue(page >= 1 && size >= 1);
		int from = (page - 1) * size;
		String sql = "SELECT * FROM ".concat(TABLE).concat(" WHERE ")
				.concat(filter).concat(" ORDER BY ").concat(orderBy)
				.concat(" LIMIT ?,?");
		return template.query(sql, rowMapper, from, size);
	}

	public List<T> list(String filter, String orderBy) {
		String sql = "SELECT * FROM ".concat(TABLE).concat(" WHERE ")
				.concat(filter).concat(" ORDER BY ").concat(orderBy)
				.concat(" LIMIT ?,?");
		return template.query(sql, rowMapper, 0, Integer.MAX_VALUE);
	}

	public List<T> list() {
		return skip(0, Integer.MAX_VALUE);
	}

	public List<T> list(int page, int size) {
		Assert.isTrue(page >= 1 && size >= 1);
		int from = (page - 1) * size;
		return skip(from, size);
	}

	public List<T> listAfter(long lastId, int size) {
		Assert.isTrue(size > 0);
		return list("id >= " + lastId, 1, size);
	}

	public List<T> listAfter(String filter, long lastId, int size) {
		Assert.isTrue(size > 0);
		return list(filter + " AND id >= " + lastId, 1, size);
	}

	/**
	 * For CacheDao Usage.
	 * 
	 * @param offset
	 * @param size
	 * @return
	 */
	List<T> skip(int offset, int size) {
		String sql = "SELECT * FROM ".concat(TABLE).concat(
				" LIMIT ?,?");
		return template.query(sql, rowMapper, offset, size);
	}

	private String getBatchIds(long[] ids) {
		StringBuilder sb = new StringBuilder();
		sb.append('(');
		for (int i = 0, size = ids.length; i != size; ++i) {
			sb.append(ids[i]);
			if (i < size - 1)
				sb.append(',');
		}
		sb.append(')');
		return sb.toString();
	}

	private String getBatchIds(List<Long> ids) {
		StringBuilder sb = new StringBuilder();
		sb.append('(');
		sb.append(StringUtils.join(ids, ','));
		sb.append(')');
		return sb.toString();
	}
}
